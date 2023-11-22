import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String phoneNo;
  final String email;
  final String password;

  UserModel({
    this.id,
    required this.fullName,
    required this.phoneNo,
    required this.email,
    required this.password,
  });

  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Phone": phoneNo,
      "Password": password,
    };
  }

//Map user fetched from firebase to UserModel

  //This is a factory constructor for the UserModel class. It takes a single argument,
  // which is a DocumentSnapshot object.
  // A DocumentSnapshot represents a snapshot of a document in a Firestore collection
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return UserModel(
      id: document.id,
      fullName: data?["FullName"] ?? "",
      phoneNo: data?["Phone"] ?? "",
      email: data?["Email"] ?? "",
      password: data?["Password"] ?? "",
    );
  }
}
