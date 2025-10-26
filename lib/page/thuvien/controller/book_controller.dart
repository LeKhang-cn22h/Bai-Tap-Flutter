import 'package:flutter/material.dart';

import '../model/sach_model.dart';

/// Controller quản lý tất cả dữ liệu và logic liên quan đến sách
class BookController with ChangeNotifier {
  // Danh sách sách - khởi tạo với dữ liệu mẫu
  final List<Book> _books = [
    Book(id: '1', title: 'Sách 01'),
    Book(id: '2', title: 'Sách 02'),
    Book(id: '3', title: 'Sách 03'),
  ];

  // Getter để lấy tất cả sách
  List<Book> get books => _books;

  // Getter để lấy chỉ những sách có sẵn (chưa được mượn)
  List<Book> get availableBooks => _books.where((book) => book.isAvailable).toList();

  /// Thêm sách mới vào thư viện
  void addBook(Book book) {
    _books.add(book);
    notifyListeners(); // UI cập nhật
  }

  /// Tìm sách theo ID
  Book getBookById(String id) {
    return _books.firstWhere((book) => book.id == id);
  }

  /// Cập nhật thông tin sách
  void updateBook(Book updatedBook) {
    final index = _books.indexWhere((b) => b.id == updatedBook.id);
    if (index != -1) {
      _books[index] = updatedBook;
      notifyListeners();
    }
  }
}