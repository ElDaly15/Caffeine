import 'package:bloc/bloc.dart';
import 'package:caffeine/featuers/product/data/model/product_model.dart';
import 'package:caffeine/featuers/product/data/model/rating_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'magnage_rating_state.dart';

class MagnageRatingCubit extends Cubit<MagnageRatingState> {
  MagnageRatingCubit() : super(MagnageRatingInitial());

  ProductModel? productModel;
  void manageRating({required String code, required num rate}) async {
    try {
      emit(MagnageRatingLoading());

      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        emit(MagnageRatingFailuer());
        return;
      }

      String userId = currentUser.uid;

      // Run transaction to ensure atomic update
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        // Fetch product document reference
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('products')
            .where('productCode', isEqualTo: code)
            .limit(1)
            .get();

        if (querySnapshot.docs.isEmpty) {
          emit(MagnageRatingFailuer());
          return;
        }

        DocumentSnapshot productDoc = querySnapshot.docs.first;
        DocumentReference productRef = productDoc.reference;

        // Get fresh product data within the transaction
        DocumentSnapshot freshProductDoc = await transaction.get(productRef);

        if (!freshProductDoc.exists) {
          emit(MagnageRatingFailuer());
          return;
        }

        productModel = ProductModel.fromJson(
            freshProductDoc.data() as Map<String, dynamic>);

        bool userExists = false;

        // Update or add user rating
        for (var userRating in productModel!.ratingUserModel) {
          if (userRating.id == userId) {
            userExists = true;
            productModel!.rating -= userRating.rating; // Remove old rating
            userRating.rating = rate; // Update new rating
            productModel!.rating += rate; // Add new rating
            break;
          }
        }

        if (!userExists) {
          productModel!.ratingUserModel.add(RatingUserModel(
            name: currentUser.displayName ?? '',
            image: currentUser.photoURL ?? '',
            id: userId,
            rating: rate,
          ));
          productModel!.ratingCount += 1;
          productModel!.rating += rate;
        }

        // Save updates atomically
        transaction.update(productRef, {
          'ratingsUserModel': productModel!.ratingUserModel
              .map((rating) => rating.toJson())
              .toList(),
          'rating': productModel!.rating,
          'ratingCount': productModel!.ratingCount,
        });
      });

      emit(MagnageRatingSuccess());
    } catch (e) {
      emit(MagnageRatingFailuer());
    }
  }
}
