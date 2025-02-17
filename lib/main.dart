import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/features/todos/logic/todo_cubit.dart';

import 'features/todos/presentation/todo_home.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        home: TodoHome(),
      ),
    );
  }

// This widget is the root of your application.

}

