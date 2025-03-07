import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/core/constant/app_color.dart';
import 'package:project4/features/todos/logic/todo_cubit.dart';

class AddTaskSheet extends StatelessWidget {
final TextEditingController newTask = TextEditingController();
final FocusNode _focusNode = FocusNode();

   AddTaskSheet({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15
      ),

      width: double.infinity,
      height:500,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 5,
              width: 50,
              decoration:BoxDecoration(
                color: AppColor.iconColor,
                borderRadius: BorderRadius.circular(10),
              ) ,
            ),
          ),
         SizedBox(height: 10,) ,
          Text("Add Task",style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: 10,) ,
          TextFormField(
            style: TextStyle(
              color: Colors.white,
            ),
            keyboardType: TextInputType.text,
            focusNode: _focusNode,
            onFieldSubmitted: (value) {
              if (value.isNotEmpty) {
                BlocProvider.of<TodoCubit>(context).addTodo(value);
                _focusNode.unfocus();
                Navigator.pop(context);
              }
            },


            controller: newTask,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.textFieldColor,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: 'Task name',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              prefixIcon: Icon(Icons.task, color: Colors.grey,),
            ),

          ),
          SizedBox(height: 5,) ,
          Container(
            width: double.infinity,
            color: AppColor.textFieldColor.withValues(alpha: 0.5),

            child: CupertinoButton(child: Text("Save"), onPressed: () {
              context.read<TodoCubit>().addTodo(newTask.text);
              Navigator.pop(context);
            },),
          ),
        ],
      ),
    );
  }
}
