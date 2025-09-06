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
      await firebaseFirestore.collection(path).doc(documentId).set(
            data,
            SetOptions(merge: true),
          );
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
  Future<void> deleteData(
      {required String path, required String documentId}) async {
    await firebaseFirestore.collection(path).doc(documentId).delete();
  }

  @override
  Future<bool> checkEmailExists(
      {required String path, required String email}) async {
    final result = await firebaseFirestore
        .collection(path)
        .where('email', isEqualTo: email)
        .get();
    log("user exists= ${result.docs.isNotEmpty}");
    return result.docs.isNotEmpty;
  }

  @override
  Stream<Map<String, dynamic>> getStreamData(
      {required String path,
      String? documentId,
      Map<String, dynamic>? query}) async* {
    Stream<DocumentSnapshot<Map<String, dynamic>>> documentSnapshot =
        firebaseFirestore.collection(path).doc(documentId).snapshots();

    yield* documentSnapshot.map((event) => event.data()!);
  }

  @override
  Future<void> addDataWithDocumentId(
      {required String mainPath,
      required String subPath,
      required Map<String, dynamic> data,
      required String mainDocumentId,
      required String subDocumentId}) async {
    await firebaseFirestore
        .collection(mainPath)
        .doc(mainDocumentId)
        .collection(subPath)
        .doc(subDocumentId)
        .set(data, SetOptions(merge: true));
  }

  @override
  Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getStreamDataWithDocumentId(
          {required String mainPath,
          required String subPath,
          String? documentId,
          Map<String, dynamic>? query}) async* {
    Stream<QuerySnapshot<Map<String, dynamic>>> documentSnapshot =
        firebaseFirestore
            .collection(mainPath)
            .doc(documentId)
            .collection(subPath)
            .snapshots();

    yield* documentSnapshot.map((event) => event.docs);
  }
}
