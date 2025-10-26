import 'package:flutter/material.dart';
import '../model/sv_model.dart';

/// Controller quản lý tất cả dữ liệu và logic liên quan đến sinh viên
class StudentController with ChangeNotifier {
  // Danh sách sinh viên - dữ liệu private (chỉ truy cập trong class)
  final List<Student> _students = [
    // Dữ liệu mẫu khi khởi tạo
    Student(id: '1', name: 'Nguyen Van A'),
    Student(id: '2', name: 'Nguyen Thi B'),
    Student(id: '3', name: 'Nguyen Van C'),
  ];

  // Getter công khai để các widget bên ngoài có thể đọc danh sách sinh viên
  // Nhưng không thể thay đổi trực tiếp (chỉ đọc)
  List<Student> get students => _students;

  /// Thêm sinh viên mới vào danh sách
  void addStudent(Student student) {
    _students.add(student);          // Thêm vào danh sách nội bộ
    notifyListeners();               // Thông báo cho UI cập nhật
  }

  /// Tìm sinh viên theo ID
  Student getStudentById(String id) {
    // firstWhere: tìm phần tử đầu tiên thỏa mãn điều kiện
    return _students.firstWhere((student) => student.id == id);
  }

  /// Cập nhật thông tin sinh viên
  void updateStudent(Student updatedStudent) {
    // Tìm vị trí của sinh viên trong danh sách
    final index = _students.indexWhere((s) => s.id == updatedStudent.id);

    // Nếu tìm thấy (index != -1)
    if (index != -1) {
      _students[index] = updatedStudent; // Thay thế sinh viên cũ bằng mới
      notifyListeners();                 // Thông báo cho UI
    }
  }
}