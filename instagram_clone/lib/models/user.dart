import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List followers;
  final List following;

  const UserModel({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.username,
    required this.bio,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "uid": uid,
      "photoUrl": photoUrl,
      "username": username,
      "bio": bio,
      "followers": followers,
      "following": following,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'email': this.email,
      'uid': this.uid,
      'photoUrl': this.photoUrl,
      'username': this.username,
      'bio': this.bio,
      'followers': this.followers,
      'following': this.following,
    };
  }

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      email: snapshot['email'],
      uid: snapshot['uid'],
      photoUrl: snapshot['photoUrl'],
      username: snapshot['username'],
      bio: snapshot['bio'],
      followers: snapshot['followers'],
      following: snapshot['following'],
    );
  }
}
