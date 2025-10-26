/// Model đại diện cho một cuốn sách trong thư viện
class Book {
  final String id;           // ID duy nhất của sách
  final String title;        // Tiêu đề sách
  final String? author;      // Tác giả (có thể null nếu không có)
  final bool isAvailable;    // Trạng thái: true = có sẵn, false = đã mượn

  // Constructor với isAvailable mặc định là true
  Book({
    required this.id,        // Bắt buộc
    required this.title,     // Bắt buộc
    this.author,             // Không bắt buộc
    this.isAvailable = true, // Mặc định là có sẵn
  });

  /// Tạo bản sao với các thuộc tính có thể thay đổi
  Book copyWith({
    String? id,
    String? title,
    String? author,
    bool? isAvailable,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }
}