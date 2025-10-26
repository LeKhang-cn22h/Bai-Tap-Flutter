import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../model/sv_model.dart';

/// Widget hiển thị thông tin một sinh viên trong danh sách
/// Có thể tái sử dụng ở nhiều nơi
class StudentCard extends StatelessWidget {
  final Student student; // Sinh viên cần hiển thị

  const StudentCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(student.name), // Tên sinh viên
        subtitle: Text('Số sách đang mượn: ${student.borrowedBooks.length}'),
        trailing: const Icon(Icons.arrow_forward_ios), // Icon mũi tên
        // Khi click -> điều hướng đến màn hình chi tiết sinh viên
        onTap: () => context.push('/student/${student.id}'),
      ),
    );
  }
}