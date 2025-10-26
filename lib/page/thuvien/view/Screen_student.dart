import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/studen_controller.dart';
import '../widgets/student_card.dart';

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final studentController = Provider.of<StudentController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Danh sách Sinh viên',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: studentController.students.length,
        itemBuilder: (context, index) {
          final student = studentController.students[index];
          return StudentCard(student: student);
        },
      ),
    );
  }
}
