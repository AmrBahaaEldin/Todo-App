import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:elegant_notification/resources/stacked_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/core/constant/app_color.dart';
import 'package:project4/features/todos/logic/todo_cubit.dart';
import 'package:project4/features/todos/logic/todo_state.dart';
import 'package:project4/features/todos/presentation/widget/custom_text_sheet.dart';
import 'package:project4/features/todos/presentation/widget/list_todo_view.dart';
import 'widget/list_header_view.dart';

class TodoHome extends StatelessWidget {
  const  TodoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {
         if (state is TodoDelete) {
           return ElegantNotification.success(
             width: 200,
             height: 70,
             isDismissable: false,
             animationCurve: Curves.easeInBack,
             stackedOptions: StackedOptions(
               key: 'top',
               type: StackedType.same,
               itemOffset: Offset(-5, -5),
             ),
             position: Alignment.topCenter,
             animation: AnimationType.fromTop,
             title: Text('delete'),
             description: Text('Your data has been deleted '),
             onDismiss: () {},
             onNotificationPressed: () {},
           ).show(context);
         }
         else if (state is TodoAdd) {
           return ElegantNotification.success(
             width: 200,
             height: 70,
             isDismissable: false,
             animationCurve: Curves.easeInBack,
             stackedOptions: StackedOptions(
               key: 'top',
               type: StackedType.same,
               itemOffset: Offset(-5, -5),
             ),
             position: Alignment.topCenter,
             animation: AnimationType.fromTop,
             title: Text('Add'),
             description: Text('Your data has been Added '),
             onDismiss: () {},
             onNotificationPressed: () {},
           ).show(context);
         }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColor.primaryColor,
          appBar: AppBar(
            backgroundColor: AppColor.primaryColor,
            leading: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                  )),
            ],
          ),
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What's up,Amr!",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("TODAYSTASkS",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                          )),
                      Text("${context.read<TodoCubit>().todoList.length} Task",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 10,
                          ))
                    ],
                  ),
                  ListTodoView(),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.bottomNavigationColor,
            shape: OvalBorder(),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => AddTaskSheet());
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}








