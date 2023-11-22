import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/main.dart';
import 'package:riverpod_learning/user.dart';

//for modifier we will change it to stateful consumer widget
class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  String userNo = '1';
  @override
  Widget build(BuildContext context) {
    ///[futureProvider]
    final user = ref.watch(fetchUserProvider(userNo));

    return user.when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(''),
            centerTitle: true,
            elevation: 1,
          ),
          body: Column(
            children: [
              TextField(
                onSubmitted: (value) => setState(() {
                  userNo = value;
                }),
              ),
              // TextField(
              //   onSubmitted: (value) => onSubmitAge(ref, value),
              // ),
              Center(
                child: Text(data.name),
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return Scaffold(
          body: Center(
            child: Text(error.toString()),
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}





//we will use consumer widget, it is provided by the riverpod
//class MyHomePage extends ConsumerWidget {
 // const MyHomePage({super.key});

 // void onSubmit(WidgetRef ref, String value) {
    //this means we are updating the value of the  nameprovider with the value of the parameter
    //  ref.read(nameProvider.notifier).update((state) => value);

    // ref.read(userProvider.notifier).updateName(value);

    // ref.read(userChangeNotifierProvider).updateName(value);
  //}

 // void onSubmitAge(WidgetRef ref, String value) {
    //this means we are updating the value of the  nameprovider with the value of the parameter
    //  ref.read(nameProvider.notifier).update((state) => value);

    // ref.read(userProvider.notifier).updateAge(int.parse(value));
    //   ref.read(userChangeNotifierProvider).updateAge(int.parse(value));
 // }

  //here widget ref allows us to call  the provider
 // @override
 // Widget build(BuildContext context, WidgetRef ref) {
    //there are many ways to get the data of that provider. three of them are:
    //1
    //when we want to continuously keep listening we use ref.watch
    //final name = ref.watch(nameProvider);
    //  final name = ref.watch(nameProvider) ?? '';

    //2
    //when we want to read onetime we use ref.read
    //final nameRead = ref.read(nameProvider);

//this will re run the whole widget tree if any of user property changes
    //  final user = ref.watch(userProvider);

    //3 -> select method
//what if we want to re run the whole widget tree only when the name of user changes
    // final userSelect = ref.watch(
    //   userProvider.select((value) => value.name),
    // );

    // final user = ref.watch(userChangeNotifierProvider).user;

  //   ///[futureProvider]
  //   final user = ref.watch(fetchUserProvider);
  //   //we can use all the case of future builder in only one line

  //  //this is for future provider
  //   return user.when(
  //     data: (data) {
  //       return Scaffold(
  //         appBar: AppBar(
  //           title: const Text(''),
  //           centerTitle: true,
  //           elevation: 1,
  //         ),
  //         body: Column(
  //           children: [
  //             // TextField(
  //             //   onSubmitted: (value) => onSubmit(ref, value),
  //             // ),
  //             // TextField(
  //             //   onSubmitted: (value) => onSubmitAge(ref, value),
  //             // ),
  //             Center(
  //               child: Text(data.name),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //     error: (error, stackTrace) {
  //       return Scaffold(
  //         body: Center(
  //           child: Text(error.toString()),
  //         ),
  //       );
  //     },
  //     loading: () {
  //       return const Center(
  //         child: CircularProgressIndicator(),
  //       );
  //     },
  //   );
    ///[Stream Provider]
    // return Scaffold(
    //   body: ref.watch(streamProvider).when(
    //     data: (data) {
    //       return Text(data.toString());
    //     },
    //     error: (error, stackTrace) {
    //       return Center(
    //         child: Text(error.toString()),
    //       );
    //     },
    //     loading: () {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     },
    //   ),
    // );
  //}
//}

//but if we use consumerWidget it will re render the whole scaffold, which we dont want
// so we will use 2nd method and wrap the only widget that is watching the provider

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {

// //this will just render consumer widget again
//     return Scaffold(
//       body: Consumer(builder: (context, ref, child) {
//         final name = ref.watch(nameProvider);
//         return Center(
//           child: Text(name),
//         );
//       }),
//     );
//   }
// }

///[for stateful widget]

//we will make it consumer stateful widget

// class MyWidget extends ConsumerStatefulWidget {
//   const MyWidget({super.key});

//   @override
//   ConsumerState<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends ConsumerState<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     final name = ref.watch(nameProvider);
//     return Scaffold(
//       body: Center(
//         child: Text(name),
//       ),
//     );
//   }
// }
