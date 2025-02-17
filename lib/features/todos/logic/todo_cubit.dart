import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/features/todos/logic/todo_state.dart';

import '../model/task_model.dart';

class TodoCubit extends Cubit<TodoStates> {
  TodoCubit() : super(TodoInitial());
  List<TaskModel> todoList = [];
  void addTodo(String todo) {
    todoList.add(TaskModel(title: todo));
    emit(TodoAdd());
  }
  void changeStatus(int index) {
    todoList[index].isDone = !todoList[index].isDone;
    emit(TodoCheck());
  }
  void deleteTodo(int index) {
    todoList.removeAt(index);
    emit(TodoDelete());
  }

}