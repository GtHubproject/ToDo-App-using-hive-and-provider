import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../../../Notes/notes_screen.dart';
import '../../../controller/provider_todo.dart';
import '../todo_listscreen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<Widget> pages = [
    TodoListScreen(),
      const NoteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(
      context,
    );
    return SafeArea(
        child: Scaffold(
      body: pages[provider.currentBottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: provider.currentBottomNavIndex,
          onTap: (value) => provider.bottomNavbar(value),
          items: [
            customBottomNavbarItem(
              icon: const Icon(Icons.note_outlined),
              label: 'Todos',
            ),
            customBottomNavbarItem(
              icon: const Icon(Icons.note_add),
              label: 'Notes',
            ),
          ]),
    ));
  }

  BottomNavigationBarItem customBottomNavbarItem ({required Widget icon, required String label}){
    return BottomNavigationBarItem(icon: icon, label: label);
  }
}
