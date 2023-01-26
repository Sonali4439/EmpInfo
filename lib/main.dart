import 'package:employee_project/screen/login_screen.dart';
import 'package:employee_project/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/Login_bloc/login_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      /*  home: const SplashScreen(), */

      home: BlocProvider(
        create: (context) => LoginBloc(),
        child: LoginScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
