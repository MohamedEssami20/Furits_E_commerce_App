import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub/core/services/data_base_service.dart';

class FirestoreService implements DataBaseService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    if (documentId == null) {
      await firebaseFirestore.collection(path).add(data);
    } else {
      await firebaseFirestore.collection(path).doc(documentId).set(data);
    }
  }

  @override
  Future<dynamic> getData(
      {required String path,
      String? documentId,
      Map<String, dynamic>? query}) async {
    if (documentId != null) {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await firebaseFirestore.collection(path).doc(documentId).get();
      return documentSnapshot.data();
    } else {
      Query<Map<String, dynamic>> documentSnapshot =
          firebaseFirestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          String orderBy = query['orderBy'];
          bool isAscending = query['descending'];
          documentSnapshot =
              documentSnapshot.orderBy(orderBy, descending: isAscending);
        }
        if (query['limit'] != null) {
          int limit = query['limit'];
          documentSnapshot = documentSnapshot.limit(limit);
        }
      }
      QuerySnapshot<Map<String, dynamic>> result = await documentSnapshot.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> checkDataExists(
      {required String path, required String documentId}) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await firebaseFirestore.collection(path).doc(documentId).get();
    return documentSnapshot.exists;
  }
  
  @override
  Future<void> deleteData({required String path, required String documentId})async {
    await firebaseFirestore.collection(path).doc(documentId).delete();
  }
  
  @override
  Future<bool> checkEmailExists({required String path, required String email}) async{
    final result = await firebaseFirestore.collection(path).where('email',isEqualTo: email).get();
    log("user exists= ${result.docs.isNotEmpty}");
    return result.docs.isNotEmpty;
  }
}
