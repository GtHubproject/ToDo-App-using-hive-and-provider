import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_provider_hive/constants/constants.dart';
import 'package:todoapp_provider_hive/features/Todo/view/widgets/appBar.dart';

import '../../controller/provider_todo.dart';
import '../../../themes/theme_provider.dart';
import '../../model/task_model.dart';
import '../widgets/delete_widget.dart';
import '../widgets/search_box.dart';



class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);
    TextStyle? cursor = Theme.of(context).textTheme.titleMedium;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      
      body:Padding(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
      child: Column(
        children: [
          AppBarTodo(),
          height20,
         Expanded( child: ValueListenableBuilder<Box<Task>>(
           valueListenable: todoProvider.todoBox.listenable(),
           builder: (context, box, child) {
      final tasks = todoProvider.todos;
      if (box.isEmpty) {
        return Center(
          child: Text(
            "No todo",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        );
      }else {
       return ListView.builder(
               itemCount: todoProvider.todos.length,
               itemBuilder: (context, index) {
                 final todo = todoProvider.todos[index];
                 return ListTile(
                   title: Text(todo.title),
                   subtitle: Text(todo.description),
                   trailing: Checkbox(
                     value: todo.isCompleted,
                     onChanged: (value) {
                       // Update task completion status
                       todoProvider.updateTodo(index, todo.title, todo.description, value!);
                     },
                   ),
                   onTap: () {
                     // Navigate to the Todo Update screen with task data
                     Navigator.pushNamed(
                       context,
                       '/updateTodo',
                       arguments: {'index': index, 'task': todo.title, 'desc': todo.description, 'done': todo.isCompleted},
                     );
                   },
                   onLongPress: () {
                   showDeleteCnfrmtn(context, todoProvider, index);
                 },
                 );
               },
             );
              }
          },
        )

         )
        ],
      ),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the Todo Add screen
          Navigator.pushNamed(context, '/addTodo');
        },
        child: Icon(Icons.add),
      ),
      drawer: Drawer(),
    );
  }
}
