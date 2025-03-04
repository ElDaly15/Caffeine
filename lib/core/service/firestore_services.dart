import 'package:caffeine/core/errors/exceptions.dart';
import 'package:caffeine/core/service/dataBase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices implements DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
    String? documentId, {
    required String path,
    required Map<String, dynamic> data,
  }) async {
    if (documentId != null) {
      await firestore
          .collection(path)
          .doc(documentId)
          .set(data, SetOptions(merge: true));
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<bool> searchUser({required String path, required String uid}) async {
    QuerySnapshot querySnapshot =
        await firestore.collection(path).where('uid', isEqualTo: uid).get();

    if (querySnapshot.docs.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<dynamic> getData(
      {required String path,
      String? documentId,
      Map<String, dynamic>? query}) async {
    try {
      if (documentId != null) {
        DocumentSnapshot documentSnapshot =
            await firestore.collection(path).doc(documentId).get();

        return documentSnapshot.data();
      } else {
        Query<Map<String, dynamic>> result = firestore.collection(path);

        if (query != null) {
          if (query['orderBy'] != null) {
            var orderBy = query['orderBy'];
            var descending = query['descending'];
            result = result.orderBy(orderBy, descending: descending);
          }

          if (query['limit'] != null) {
            var limit = query['limit'];
            result = result.limit(limit);
          }
        }

        var data = await result.get();
        return data.docs.map((doc) => doc.data()).toList();
      }
    } catch (e) {
      throw CustomException(message: 'An error occurred. Please try again.');
    }
  }
}
