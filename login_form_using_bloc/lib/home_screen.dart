import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_form_using_bloc/bloc/auth_bloc.dart';
import 'package:login_form_using_bloc/login_screen.dart';
import 'package:login_form_using_bloc/widgets/gradient_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Center(
            child: Column(
              children: [
                Text(
                  (state as AuthSuccess).uid,
                  style: const TextStyle(color: Colors.white),
                ),
                GradientButton(onPressed: () {
                  context.read<AuthBloc>().add(AuthLogoutRequested());
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
