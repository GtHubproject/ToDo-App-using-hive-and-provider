import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/provider_todo.dart';


class TodoAddScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,

       // backgroundColor: Theme.of(context).,
        title: Text('Add Todo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Task Title'),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Task Description'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style,
              // style: ElevatedButton.styleFrom(
              //   shape: RoundedRectangleBorder(),
              //   backgroundColor: Theme.of(context).colorScheme.primary,
              //   fixedSize: Size(MediaQuery.of(context).size.width - 20,47),
              //   textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 30)
              //
              //
              // ),
              onPressed: () {
                final title = titleController.text.trim();
                final desc = descriptionController.text.trim();
                todoProvider.addTodo(desc, title, false);
                Navigator.pop(context);
              },
              child: Text('Add Task',
              style: TextStyle(color: Colors.white54),),
            ),
          ],
        ),
      ),
    );
  }
}
