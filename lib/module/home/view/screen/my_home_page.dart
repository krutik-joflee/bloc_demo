import 'package:bloc_demo/module/home/view/bloc/sign_in_bloc.dart';
import 'package:bloc_demo/module/home/view/bloc/sign_in_state.dart';
import 'package:bloc_demo/module/home/view/screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/sign_in_event.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WELCOME"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider(
                        create: (context) => SignInBloc(SignInInitialState()),
                        child: SignInScreen(),
                      )));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
