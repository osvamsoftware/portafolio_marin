import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ContactDataSource {
  Future<bool> sendMessage(String name, String email, String message);
}

class ContactDataSourceImpl extends ContactDataSource {
  final instance = FirebaseFirestore.instance;
  @override
  Future<bool> sendMessage(String name, String email, String message) async {
    try {
      await instance.collection('messages').add({'name': name, "email": email, 'message': message});
      return true;
    } on FirebaseException catch (e) {
      print('FAILLL $e');
      return false;
    }
  }
}
