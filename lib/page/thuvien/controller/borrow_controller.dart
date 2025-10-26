import 'package:chaoflutter/page/thuvien/controller/studen_controller.dart';
import 'package:flutter/material.dart';
import '../model/sach_model.dart';
import 'book_controller.dart';

/// Controller chuyên xử lý logic mượn và trả sách
class BorrowController with ChangeNotifier {
  final StudentController studentController; // Phụ thuộc vào student controller
  final BookController bookController;       // Phụ thuộc vào book controller

  // Constructor nhận 2 controller làm dependency
  BorrowController({
    required this.studentController,
    required this.bookController,
  });

  /// Cho sinh viên mượn sách
  void borrowBook(String studentId, String bookId) {
    // Lấy thông tin sinh viên và sách từ các controller
    final student = studentController.getStudentById(studentId);
    final book = bookController.getBookById(bookId);

    // Chỉ cho mượn nếu sách có sẵn
    if (book.isAvailable) {
      // Tạo danh sách mới bằng cách spread danh sách cũ và thêm bookId mới
      final updatedStudent = student.copyWith(
        borrowedBooks: [...student.borrowedBooks, bookId],
      );
      // Cập nhật sinh viên với danh sách mượn mới
      studentController.updateStudent(updatedStudent);

      // Cập nhật sách thành không có sẵn
      final updatedBook = book.copyWith(isAvailable: false);
      bookController.updateBook(updatedBook);

      notifyListeners(); // Thông báo thay đổi
    }
  }

  /// Cho sinh viên trả sách
  void returnBook(String studentId, String bookId) {
    final student = studentController.getStudentById(studentId);
    final book = bookController.getBookById(bookId);

    // Tạo danh sách mới từ danh sách cũ và xóa bookId
    final updatedBorrowedBooks = List<String>.from(student.borrowedBooks)
      ..remove(bookId); // .. là cascade operator, cho phép gọi nhiều method liên tiếp

    // Cập nhật sinh viên với danh sách mới (đã xóa sách trả)
    final updatedStudent = student.copyWith(
      borrowedBooks: updatedBorrowedBooks,
    );
    studentController.updateStudent(updatedStudent);

    // Cập nhật sách thành có sẵn
    final updatedBook = book.copyWith(isAvailable: true);
    bookController.updateBook(updatedBook);

    notifyListeners();
  }

  /// Lấy danh sách sách mà sinh viên đang mượn
  List<Book> getBorrowedBooks(String studentId) {
    final student = studentController.getStudentById(studentId);

    // Chuyển đổi từ danh sách ID sang danh sách Book object
    return student.borrowedBooks
        .map((bookId) => bookController.getBookById(bookId)) // Chuyển ID thành Book
        .toList(); // Chuyển thành List
  }
}