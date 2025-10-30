import 'dart:math';
import 'Nhanvien.dart';
import 'Lich.dart';


class AlgorithmgaLogic {
  List<NhanVien> dsNhanVien = [];
  List<Lich> quanThe = [];

  // Khởi tạo quần thể ban đầu
  void addQuanThe(int n) {
    final random = Random();
    int ca = 2;
    int thu = 7;
    for (int i = 0; i < n; i++) {
      List<List<String>> lichlam = List.generate(
        ca,
            (c) =>
            List.generate(
              thu,
                  (t) {
                var nv = dsNhanVien[random.nextInt(dsNhanVien.length)];
                return nv.name;
              },
            ),
      );
      quanThe.add(Lich(diem: 0, lichlam: lichlam));
    }
  }

  // Thêm nhân viên
  void addListEmployee(String ten, Map<String, int> buoiban) {
    dsNhanVien.add(NhanVien(name: ten, buoiban: buoiban));
  }

  // Lai tạo giữa cha và mẹ
  Lich laiTao(Lich cha, Lich me) {
    final random = Random();
    int ca = 2;
    int thu = 7;

    List<List<String>> lichCon = List.generate(
      ca,
          (i) =>
          List.generate(
            thu,
                (j) => random.nextBool() ? cha.lichlam[i][j] : me.lichlam[i][j],
          ),
    );

    Lich con = Lich(diem: 0, lichlam: lichCon);
    //cơ hội đột biến
    if (random.nextDouble() < 0.3) {
      con.dotBien(dsNhanVien);
    }

    quanThe.add(con);
    return con;
  }

  // Tính độ thích nghi cho từng cá thể
  void dothichnghi() {
    for (int i = 0; i < quanThe.length; i++) {
      int diemTong = 100;

      // Ràng buộc 1: Không làm 2 ca trong cùng 1 ngày
      for (int j = 0; j < 7; j++) {
        String caSang = quanThe[i].lichlam[0][j];
        String caChieu = quanThe[i].lichlam[1][j];
        if (caSang == caChieu) diemTong -= 10;
      }

      // Ràng buộc 2: Ngày bận không được làm
      for (int ca = 0; ca < 2; ca++) {
        for (int j = 0; j < 7; j++) {
          String nvName = quanThe[i].lichlam[ca][j];
          NhanVien? nv = dsNhanVien.firstWhere(
                (n) => n.name == nvName,
            orElse: () => NhanVien(name: '', buoiban: {}),
          );
          if (nv.buoiban.containsKey(j.toString())) {
            int? buoiBan = nv.buoiban[j.toString()];
            if (buoiBan == 2 || buoiBan == ca) {
              diemTong -= 10;
            }
          }
        }
      }

      quanThe[i].diem = diemTong;
    }
  }

  // Chọn lọc top cá thể
  void chonloc() {
    quanThe.sort((a, b) => b.diem.compareTo(a.diem));
    if (quanThe.length > 6) {
      quanThe = quanThe.sublist(0, 6);
    }

    while (quanThe.length < 12) {
      var cha = quanThe[Random().nextInt(6)];
      var me = quanThe[Random().nextInt(6)];
      if (cha == me) me = quanThe[Random().nextInt(6)];
      laiTao(cha, me);
    }
  }

  // Vòng đời
  void vongDoi({int max = 50}) {
    quanThe.clear();
    addQuanThe(10);
    int theHe = 0;
    int maxScore = 0;

    while (theHe < max) {
      dothichnghi();
      chonloc();

      if (quanThe.first.diem > maxScore) {
        maxScore = quanThe.first.diem;
      }

      if (maxScore >= 100) {
        print("Đạt tối ưu ở thế hệ: $theHe");
        break;
      }

      theHe++;
    }

    print("Kết thúc sau $theHe thế hệ, điểm cao nhất: $maxScore");
  }

}
