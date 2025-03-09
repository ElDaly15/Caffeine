// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:caffeine/featuers/product/data/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit() : super(GetProductsInitial());

  List<ProductModel> products = [];

  StreamSubscription<QuerySnapshot>? _subscription;

  void getProducts() async {
    try {
      await _subscription?.cancel();
      emit(GetProductsLoading());
      await Future.delayed(const Duration(
          milliseconds: 600)); // 2-second delay, adjust as needed

      _subscription =
          FirebaseFirestore.instance.collection('products').snapshots().listen((
        querySnapshot,
      ) {
        products = querySnapshot.docs
            .map((doc) => ProductModel.fromJson(doc.data()))
            .toList();

        emit(GetProductsSuccess(products: products));
      });
    } catch (e) {
      emit(GetProductsFailuer(error: 'An error occurred , Try again'));
    }
  }

  void getProductsByCategory({required String category}) async {
    try {
      await _subscription?.cancel();
      emit(GetProductsLoading());
      await Future.delayed(const Duration(
          milliseconds: 600)); // 2-second delay, adjust as needed

      _subscription = FirebaseFirestore.instance
          .collection('products')
          .where('productCategory', isEqualTo: category)
          .snapshots()
          .listen((
        querySnapshot,
      ) {
        products = querySnapshot.docs
            .map((doc) => ProductModel.fromJson(doc.data()))
            .toList();

        emit(GetProductsSuccess(products: products));
      });
    } catch (e) {
      emit(GetProductsFailuer(error: 'An error occurred , Try again'));
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
