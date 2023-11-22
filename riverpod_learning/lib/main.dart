import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/home_page.dart';
import 'package:riverpod_learning/logger_riverpod.dart';
import 'package:riverpod_learning/user.dart';
import 'package:http/http.dart' as http;

//There are 6 kinds of provider available under the riverpod


///[1. provider] -> readable only

//providerref will allow us to talk with other provider
//final nameProvider = Provider<String>((ref) => 'Nahid Muntasir ');

///[2. state provider] ->used to update the value
// final nameProvider = StateProvider<String?>((ref) => null);

///[3. stateNotifier and stateNotifierProvider] -> used to update complex value,always recommended
// final userProvider = StateNotifierProvider<UserNotifier, User>(
//   //first is the class we are returning, 2nd is the state of the class
//   (ref) => UserNotifier(
//     const User(name: '', age: 0),
//   ),
// );

///[4.changeNotifier and changeNotifierProvider] -> directly comes from provider, not recommended if we built app from scratch
//this is not mutable
// final userChangeNotifierProvider =
//     ChangeNotifierProvider((ref) => UserNotifierChange());

///[5.FutureProvider] -> is based on http calls or firebase calls,when i will use async call
//it is a goodreplacement of future builder

// final fetchUserProvider = FutureProvider(
//   (ref) {
//     const url = 'https://jsonplaceholder.typicode.com/users/1';

//     //we will use then instead of async-await
//     return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
//   },
// );

// final fetchUserProvider = FutureProvider(
//   (ref) {
//     // return UserRepository().fetchUserData();
//     final userRepository = ref.watch(userRepositoryProvider);
//     return userRepository.fetchUserData();
//   },
// );

///[6.Stream Provider] ->enables us to return a stram of data got from the api

final streamProvider = StreamProvider((ref) async* {
  //as we dont remember an stream api,we will use async*,and yield.this will give us a stream of array
  yield [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
});

///[features available for every provider]:

//modifier
//as instead of listening our provider by others, in this case our provider is also
//listening.so we will use family
//family have some limitation,we cannot give more than one extra params using family,{if we use extra package,we can}
//we can use tuple,class etc and pass it in the parameter,class should be immutable
//we can use autodispose if we dont want any memory leaks

final fetchUserProvider = FutureProvider.family(
  (ref, String input) {
    // return UserRepository().fetchUserData();
    final userRepository = ref.watch(userRepositoryProvider);
    return userRepository.fetchUserData(input);
  },
);

///[different types of ref]:
//WidgetRef -> Helps us to talk from widget to provider
//ProviderRef -> Enables us to talk from one provider to another provider

//Ref -> can be considered as superclass of this widget ref and provider ref
//final Ref ref ; -> we can use this in any class and use ref.watch ,ref.read vice versa on that class

//other use of ref
//ref.keepAlive() -> we have to use it after we use autoDispose. it helps to store the state of the provider even after it is dispossed
//ref.onDispose((){}) -> when dispossing what we want to do
//ref.onCancel() -> when your provider is in pause state, and can be cancelled anytime
//ref.onResume((){})->when provider will resume,what should be done
//ref.onRemoveListener/onAddListener

///[Provider observer] -> this things helps us to observe the provider


void main() {
//providerscope keeps track of all the providers and ensure there is no leakage
  runApp(
    ProviderScope(
      //will use this to observe providerObserver
      observers: [
        LoggerRiverpod(), //we just told the providerScope that we are observing all it's provider using LoggerRiverpod class
      ],
      //we can use provider over ride to override any provider
      //which will help us testing
      // overrides: [
      //   streamProvider.overrideWith((ref) => {

      //   })
      // ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
