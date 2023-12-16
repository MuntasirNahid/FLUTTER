import 'package:cubit_bloc_learning_1_counter_app_using_both/bloc/counter_bloc.dart';
import 'package:cubit_bloc_learning_1_counter_app_using_both/cublit/counter_cubit.dart';
import 'package:cubit_bloc_learning_1_counter_app_using_both/inc_dec_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(
        context); //we just told which bloc we want to access
    final counterBloc = BlocProvider.of<CounterBloc>(context);

//we can delete upper two line too,if we specify them in block builder

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, int>(
                //we have to specify the block and return type of the state, else it will remain as object
                bloc:
                    counterBloc, //this is optional if we do the upper specification
                builder: (context, counter) {
                  return Text(
                    '$counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const IncrementDecrementPage();
              },
            ),
          );
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
