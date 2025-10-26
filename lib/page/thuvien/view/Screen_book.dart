import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widgets/books_card.dart';
import '../controller/book_controller.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookController = Provider.of<BookController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách Sách',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: bookController.books.length,
        itemBuilder: (context, index) {
          final book = bookController.books[index];
          return BookCard(book: book, showStatus: true);
        },
      ),
    );
  }
}
