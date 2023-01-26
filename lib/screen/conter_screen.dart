import 'package:employee_project/bloc/Login_bloc/login_bloc.dart';
import 'package:employee_project/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc/counter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => LoginBloc(),
                  child: LoginScreen(),
                ),
              ),
            );
          },
          /*  => Navigator.pop(context), */
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text("Counter"),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return SafeArea(
              child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: FloatingActionButton(
                    heroTag: "btn1",
                    child: Icon(Icons.add),
                    onPressed: () {
                      context
                          .read<CounterBloc>()
                          .add(Incrament(count: state.count));
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  state.count.toString(),
                  style: TextStyle(fontSize: 24.0),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: FloatingActionButton(
                    heroTag: "btn2",
                    child: Icon(Icons.remove),
                    onPressed: () {
                      context
                          .read<CounterBloc>()
                          .add(Decrement(count: state.count));
                    },
                  ),
                )
              ],
            ),
          ));
        },
      ),
    );
  }
}
