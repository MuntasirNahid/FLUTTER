import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// @immutable
// class User {
//   final String name;
//   final int age;

//   const User({
//     required this.name,
//     required this.age,
//   });

//   User copyWith({
//     String? name,
//     int? age,
//   }) {
//     return User(
//       name: name ?? this.name,
//       age: age ?? this.age,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'name': name,
//       'age': age,
//     };
//   }

//   factory User.fromMap(Map<String, dynamic> map) {
//     return User(
//       name: map['name'] as String,
//       age: map['age'] as int,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory User.fromJson(String source) =>
//       User.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'User(name: $name, age: $age)';

//   @override
//   bool operator ==(covariant User other) {
//     if (identical(this, other)) return true;

//     return other.name == name && other.age == age;
//   }

//   @override
//   int get hashCode => name.hashCode ^ age.hashCode;
// }

// //we will manipulate the value of User model using UserNotifier
// class UserNotifier extends StateNotifier<User> {
//   //here we are taking input from constructor which is in main.dart
//   UserNotifier(super.state); // this state is User state
//if we dont want to take input from constructor initially, we can write like this

// UserNotifier()
//     : super(
//         const User(name: '', age: 0),
//       );

//if we want a constructor to be run as soon as User Notifier is run. we can make it happen like this:
// UserNotifier() : super(const User(name: '', age: 0)) {
//   updateName('aaaaa');
// }

//   void updateName(String n) {
//     state = state.copyWith(name: n);
//   }

//   void updateAge(int a) {
//     state = state.copyWith(age: a);
//   }
// }

// class UserNotifierChange extends ChangeNotifier {
//   User user = const User(name: '', age: 0);
//   void updateName(String n) {
//     user = user.copyWith(name: n);
//     notifyListeners();
//   }

//   void updateAge(int a) {
//     user = user.copyWith(age: a);
//     notifyListeners();
//   }
// }

class User {
  final String name;
  final String email;

  User(
    this.name,
    this.email,
  );

  User copyWith({
    String? name,
    String? email,
  }) {
    return User(
      name ?? this.name,
      email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['name'] as String,
      map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(name: $name, email: $email)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}

final userRepositoryProvider = Provider((ref) => UserRepository());

// class UserRepository {
//   Future<User> fetchUserData() {
//     const url = 'https://jsonplaceholder.typicode.com/users/1';
//     //we will use then instead of async-await
//     return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
//   }
// }


//lets say we want to take input from the user,which we will use in our url link
class UserRepository {
  Future<User> fetchUserData(String input) {
    var url = 'https://jsonplaceholder.typicode.com/users/$input';
    //we will use then instead of async-await
    return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
  }
}


