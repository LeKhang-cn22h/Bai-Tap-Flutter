/// Model đại diện cho một sinh viên trong hệ thống
class Student {
  final String id;              // ID duy nhất để phân biệt sinh viên
  final String name;            // Tên sinh viên
  final List<String> borrowedBooks; // Danh sách ID các sách đang mượn

  // Constructor với borrowedBooks mặc định là mảng rỗng
  Student({
    required this.id,           // Bắt buộc phải có id
    required this.name,         // Bắt buộc phải có name
    List<String>? borrowedBooks, // Không bắt buộc, mặc định là rỗng
  }) : borrowedBooks = borrowedBooks ?? [];

  /// Phương thức copyWith giúp tạo bản sao với một số thuộc tính thay đổi
  /// Rất hữu ích khi muốn cập nhật một phần object mà không thay đổi object gốc
  Student copyWith({
    String? id,                 // ID mới, nếu không có thì dùng ID cũ
    String? name,               // Tên mới, nếu không có thì dùng tên cũ
    List<String>? borrowedBooks, // Danh sách mới, nếu không có thì dùng danh sách cũ
  }) {
    return Student(
      id: id ?? this.id,                      // id mới hoặc id cũ
      name: name ?? this.name,                // name mới hoặc name cũ
      borrowedBooks: borrowedBooks ?? this.borrowedBooks, // danh sách mới hoặc cũ
    );
  }
}