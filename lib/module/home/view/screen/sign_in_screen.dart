import 'package:bloc_demo/module/home/view/bloc/sign_in_bloc.dart';
import 'package:bloc_demo/module/home/view/bloc/sign_in_event.dart';
import 'package:bloc_demo/module/home/view/bloc/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("BLOC DEMO"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20),
            child: BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.errormessage,
                    style: const TextStyle(color: Colors.red),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              controller: emailcontroller,
              onChanged: (value) {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(
                    emailcontroller.text, passwordcontroller.text));
              },
              decoration: const InputDecoration(
                labelText: "Email",
                hintText: "enter email",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              onChanged: (value) {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(
                    emailcontroller.text, passwordcontroller.text));
              },
              controller: passwordcontroller,
              decoration: const InputDecoration(
                labelText: "Password",
                hintText: "enter password",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
            child: BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInLodingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return GestureDetector(
                  onTap: () {
                    if (state is SignInValidState) {
                      BlocProvider.of<SignInBloc>(context).add(
                          SignInSubmittedevent(
                              emailcontroller.text, passwordcontroller.text));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: (state is SignInValidState)
                            ? Colors.blue
                            : Colors.grey),
                    width: double.infinity,
                    height: 40,
                    child: const Center(
                        child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
