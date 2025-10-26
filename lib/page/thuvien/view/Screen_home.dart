import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widgets/books_card.dart';
import '../controller/book_controller.dart';
import '../controller/borrow_controller.dart';
import '../controller/studen_controller.dart';

/// Trang chủ - hiển thị sách sinh viên đang mượn và sách có sẵn
class StudentBooksScreen extends StatelessWidget {
  final String studentId;

  const StudentBooksScreen({super.key, required this.studentId});

  @override
  Widget build(BuildContext context) {
    final studentController = Provider.of<StudentController>(context);
    final bookController = Provider.of<BookController>(context);
    final borrowController = Provider.of<BorrowController>(context);

    final student = studentController.getStudentById(studentId);
    final borrowedBooks = borrowController.getBorrowedBooks(studentId);
    final availableBooks = bookController.availableBooks;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hệ thống\nQuản lý Thư viện',
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tên sinh viên
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Sinh viên: ${student.name}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          // Phần 1: sách đang mượn
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Danh sách sách đang mượn',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: borrowedBooks.isEmpty
                ? const Center(child: Text('Chưa mượn sách nào'))
                : ListView.builder(
              itemCount: borrowedBooks.length,
              itemBuilder: (context, index) {
                final book = borrowedBooks[index];
                return BookCard(
                  book: book,
                  onTap: () =>
                      borrowController.returnBook(studentId, book.id),
                  actionText: 'Trả sách',
                );
              },
            ),
          ),

          const Divider(),

          // Phần 2: sách có sẵn
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Sách có sẵn để mượn',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: availableBooks.isEmpty
                ? const Center(child: Text('Không có sách nào khả dụng'))
                : ListView.builder(
              itemCount: availableBooks.length,
              itemBuilder: (context, index) {
                final book = availableBooks[index];
                return BookCard(
                  book: book,
                  onTap: () =>
                      borrowController.borrowBook(studentId, book.id),
                  actionText: 'Mượn sách',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
