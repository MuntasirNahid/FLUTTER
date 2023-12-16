import 'package:cubit_bloc_learning_1_counter_app_using_both/cublit/counter_cubit.dart';
import 'package:cubit_bloc_learning_1_counter_app_using_both/bloc/counter_bloc.dart';
import 'package:cubit_bloc_learning_1_counter_app_using_both/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              CounterCubit(), //now we can access Counter Cubit bloc from anywhere of our application
        ),
        BlocProvider(
          create: (_) => CounterBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
