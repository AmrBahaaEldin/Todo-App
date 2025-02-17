import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/features/todos/presentation/widget/custom_todo_item.dart';

import '../../logic/todo_cubit.dart';

class ListTodoView extends StatelessWidget {
  const ListTodoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount:context.read<TodoCubit>().todoList.length,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return CustomTodoItem(index:index);
      },




    );
  }
}