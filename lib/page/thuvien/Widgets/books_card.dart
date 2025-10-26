import 'package:flutter/material.dart';

import '../model/sach_model.dart';

/// Widget hiển thị thông tin một cuốn sách
/// Linh hoạt: có thể hiển thị trạng thái và nút hành động
class BookCard extends StatelessWidget {
  final Book book;           // Sách cần hiển thị
  final VoidCallback? onTap; // Hàm được gọi khi click (có thể null)
  final String? actionText;  // Text nút hành động (có thể null)
  final bool showStatus;     // Có hiển thị trạng thái không

  const BookCard({
    super.key,
    required this.book,
    this.onTap,
    this.actionText,
    this.showStatus = false, // Mặc định không hiển thị trạng thái
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(book.title), // Tiêu đề sách
        subtitle: book.author != null ? Text(book.author!) : null, // Tác giả (nếu có)
        trailing: Row(
          mainAxisSize: MainAxisSize.min, // Chiếm ít không gian nhất có thể
          children: [
            // Hiển thị trạng thái nếu được yêu cầu
            if (showStatus)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: book.isAvailable ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  book.isAvailable ? 'Có sẵn' : 'Đã mượn',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            // Hiển thị nút hành động nếu có
            if (actionText != null)
              TextButton(
                onPressed: onTap, // Gọi hàm onTap khi click
                child: Text(actionText!),
              ),
          ],
        ),
        // Xử lý click toàn bộ item (nếu có onTap)
        onTap: onTap,
      ),
    );
  }
}