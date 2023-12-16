import 'package:cubit_bloc_learning_2_todo_app_with_cubit/add_todo.dart';
import 'package:cubit_bloc_learning_2_todo_app_with_cubit/cubit/todo_cubit.dart';
import 'package:cubit_bloc_learning_2_todo_app_with_cubit/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const TodoList(),
          '/add-todo': (_) => AddTodoPage(),
        },
      ),
    );
  }
}
