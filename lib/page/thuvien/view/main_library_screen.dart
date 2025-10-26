import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/studen_controller.dart';
import 'Screen_book.dart';
import 'Screen_home.dart';
import 'Screen_student.dart';


class MainLibraryScreen extends StatefulWidget {
  const MainLibraryScreen({super.key});

  @override
  State<MainLibraryScreen> createState() => _MainLibraryScreenState();
}

class _MainLibraryScreenState extends State<MainLibraryScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final studentController = context.read<StudentController>();
    final studentId = studentController.students.isNotEmpty
        ? studentController.students.first.id
        : '';

    // Các màn hình chính
    final screens = [
      StudentBooksScreen(studentId: studentId), // Trang chủ
      const BookListScreen(),
      const StudentListScreen(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Trang chủ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Danh sách sách",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Sinh viên",
          ),
        ],
      ),
    );
  }
}
