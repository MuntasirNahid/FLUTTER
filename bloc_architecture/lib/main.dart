import 'package:bloc_architecture/features/home/ui/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

//when we want to change in ui we pass event,bloc catches this event and do some logic
//and passes state which changes/updates my user interface
// so event ->bloc->state -> UI Change


