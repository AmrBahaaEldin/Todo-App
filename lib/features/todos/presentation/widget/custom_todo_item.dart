import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/core/constant/app_color.dart';
import 'package:project4/features/todos/logic/todo_cubit.dart';

class CustomTodoItem extends StatelessWidget {
  final int index;
  const CustomTodoItem({
    super.key, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10, bottom: 20),
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        color: AppColor.textFieldColor,
      ),
      child: Row(
        children: [
          IconButton(
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            onPressed: () {
              context.read<TodoCubit>().changeStatus(index);
            },
            icon: context.read<TodoCubit>().todoList[index].isDone?
            Icon(Icons.circle, color:Colors.green, size: 25):
            Icon(
              Icons.circle_outlined,
              color: AppColor.iconColor,
            ),
          ),

          Text(
            context.read<TodoCubit>().todoList[index].title,
            style: TextStyle(color: Colors.white, fontSize: 16,decoration:context.read<TodoCubit>().todoList[index].isDone? TextDecoration.lineThrough:null,decorationThickness: 3,decorationColor: Colors.red),
          ),
          Spacer(),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              context.read<TodoCubit>().deleteTodo(index);
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}