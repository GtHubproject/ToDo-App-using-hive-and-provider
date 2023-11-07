import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../themes/theme_provider.dart';

class AppBarTodo extends StatefulWidget {
  const AppBarTodo({Key? key}) : super(key: key);

  @override
  State<AppBarTodo> createState() => _AppBarTodoState();
}

class _AppBarTodoState extends State<AppBarTodo> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        // Icon(Icons.menu,color:Colors.black),
        Text(
          'T A S K S',
          style: Theme.of(context).textTheme.titleLarge,
          // style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        Switch.adaptive(
          value: themeProvider.isDarkTheme,
          activeColor: const Color(0xFFCCE5FF),
          onChanged: (val) {
            themeProvider.toggleTheme();
          },
        ),

      ],


    );
  }
}
