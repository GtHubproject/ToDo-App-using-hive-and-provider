import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../themes/theme_provider.dart';
import '../../controller/provider_todo.dart';


class TodoUpdateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final Map<String, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final int index = arguments['index'];
    final String task = arguments['task'];
    final String desc = arguments['desc'];
    final bool done = arguments['done'];

    final TextEditingController titleController = TextEditingController(text: task);
    final TextEditingController descriptionController = TextEditingController(text: desc);

    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        title: Text('Update Todo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Task Title',
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 20.0),
            TextField(
              keyboardType: TextInputType.text,
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Task Description',
              border: OutlineInputBorder()),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style,
              onPressed: () {
                final title = titleController.text.trim();
                final desc = descriptionController.text.trim();
                todoProvider.updateTodo(index, title, desc, done);
                Navigator.pop(context);
              },
              child: Text('Update Task'),
            ),
          ],
        ),
      ),
    );
  }
}