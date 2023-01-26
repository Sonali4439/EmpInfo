import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../bloc/Login_bloc/login_bloc.dart';
import '../bloc/counter_bloc/counter_bloc.dart';
import 'conter_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status == LoginStatus.failure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                content: Text('Login Failure'),
              ));
          }

          if (state.status == LoginStatus.loading) {
            CircularProgressIndicator();
          }

          if (state.status == LoginStatus.success) {
            {
              Fluttertoast.showToast(
                msg: ' Login Successful...',
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => CounterBloc(),
                    child: CounterScreen(),
                  ),
                ),
              );
            }
          }
        },
        child: Form(
          key: _formKey,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  emailAddressWidget(context),
                  SizedBox(height: 20),
                  passwordWidget(context),
                  SizedBox(height: 20),
                  submitButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  emailAddressWidget(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: "Username"),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      onChanged: (email) =>
          context.read<LoginBloc>().add(LoginEmailChanged(email)),
      validator: (value) {
        final emailRegex = RegExp(
          r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
        );
        final error = value!.isEmpty ? "Email required" : null;
        return (error != null)
            ? error
            : emailRegex.hasMatch(value)
                ? null
                : "Invalid email";
      },
    );
  }

  passwordWidget(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: "Password"),
      obscureText: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        final error = value!.isEmpty ? "Password required" : null;
        return (error != null)
            ? error
            : value.length > 5
                ? null
                : "Minimum 6 characters required";
      },
      onChanged: (password) =>
          context.read<LoginBloc>().add(LoginPasswordChanged(password)),
    );
  }

  submitButton() =>
      BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          child: Text("Log In"),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              context.read<LoginBloc>().add(LoginSubmitted());
            }
          },
        );
      });
}
