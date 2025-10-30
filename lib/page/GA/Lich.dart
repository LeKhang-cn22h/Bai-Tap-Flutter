import 'dart:math';

import 'Nhanvien.dart';

class Lich{
  int diem;
  List<List<String>> lichlam;
  Lich({required this.diem,required this.lichlam});
  //hàm đột biến lich làm
  void dotBien(List<NhanVien> danhSachNV) {
    final random = Random();
    int ca = random.nextInt(2);
    int thu = random.nextInt(7);

    // chọn nhân viên ngẫu nhiên trong danh sách
    var nv = danhSachNV[random.nextInt(danhSachNV.length)];
    lichlam[ca][thu] = nv.name;
  }
}
