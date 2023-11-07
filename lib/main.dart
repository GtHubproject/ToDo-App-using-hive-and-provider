


import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_provider_hive/features/splash_screen/splash_screen.dart';

import 'features/Notes/provider_notes.dart';
import 'features/Todo/controller/provider_todo.dart';
import 'features/themes/theme_provider.dart';
import 'features/Todo/model/task_model.dart';
import 'features/Todo/view/screens/todo_addScreen.dart';
import 'features/Todo/view/screens/update_todo.dart';
import 'features/themes/theme.dart';


void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());

  await Hive.openBox<Task>('students');

  runApp(
   MyApp()
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<TodoProvider>(create: (_) => TodoProvider()),
          ChangeNotifierProvider(create: (context) => NoteProvider()),
          ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ],

        child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            // home: ,
            theme: themeProvider.isDarkTheme ? darkTheme : lightTheme,
            // darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            title: 'Todo App',

            initialRoute: '/',
            routes: {
              '/': (context) => const SplashScreen(),
              '/addTodo': (context) => TodoAddScreen(),
              '/updateTodo': (context) => TodoUpdateScreen(),
            },
          );
        }
        ),
      ),
    );
  }
}





