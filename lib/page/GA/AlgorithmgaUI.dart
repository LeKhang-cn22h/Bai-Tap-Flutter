import 'package:flutter/material.dart';
import 'Lich.dart';
import 'algorithmGA.dart';

class Algorithmgaui extends StatefulWidget {
  const Algorithmgaui({super.key});

  @override
  State<Algorithmgaui> createState() => _AlgorithmgauiState();
}

class _AlgorithmgauiState extends State<Algorithmgaui> {
  // Khởi tạo đối tượng AlgorithmgaLogic
  final algo = AlgorithmgaLogic();
  // Tạo controller cho TextField
  final TextEditingController tenController = TextEditingController();
  // Danh sách buổi bận của nhân viên
  Map<String, int> buoiban = {};
  // Lưu trữ lịch tối ưu
  Lich? lichToiUu;
  // Biến đánh dấu đã chạy chưa
  bool daChay = false;
//hàm thêm nhân viên và cập nhật trạng thái hiển thị
  void themNV() {
    if (tenController.text.isEmpty) return;
    algo.addListEmployee(tenController.text, buoiban);
    setState(() {
      tenController.clear();
      buoiban = {};
    });
  }
  //hàm chạy GA và cập nhật trạng thái hiển thị
  void chayGA() {
    setState(() {
      algo.vongDoi();
      lichToiUu = algo.quanThe.first;
      daChay = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Genetic Algorithm",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ==== THÊM NHÂN VIÊN ====
                const Text(
                  "Thêm nhân viên",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: tenController,
                  decoration: InputDecoration(
                    hintText: "Nhập tên nhân viên",
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 10,
                  children: List.generate(7, (i) {
                    return ChoiceChip(
                      label: Text('Thứ ${i + 2}'),
                      selected: buoiban.containsKey(i.toString()),
                      selectedColor: Colors.blue.shade200,
                      onSelected: (value) {
                        setState(() {
                          if (value) {
                            buoiban[i.toString()] = 2;
                          } else {
                            buoiban.remove(i.toString());
                          }
                        });
                      },
                    );
                  }),
                ),
                const SizedBox(height: 18),
                ElevatedButton.icon(
                  onPressed: themNV,
                  icon: const Icon(Icons.person_add),
                  label: const Text("Thêm nhân viên"),
                ),

                // ==== DANH SÁCH NHÂN VIÊN ====
                const Divider(height: 40),
                const Text(
                  "Danh sách nhân viên:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 6),
                if (algo.dsNhanVien.isEmpty)
                  const Text("Chưa có nhân viên nào được thêm.")
                else
                  ...algo.dsNhanVien.map(
                        (nv) => ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(nv.name),
                      subtitle: Text(
                        nv.buoiban.isEmpty
                            ? "Không bận ngày nào"
                            : "Buổi bận: ${nv.buoiban.keys.map((e) => 'Thứ ${int.parse(e) + 2}').join(', ')}",
                      ),
                    ),
                  ),

                // ==== NÚT CHẠY GA ====
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (algo.dsNhanVien.isNotEmpty) {
                          algo.addQuanThe(10);
                          setState(() {});
                        }
                      },
                      child: const Text('Khởi tạo quần thể'),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (algo.dsNhanVien.isNotEmpty) {
                          chayGA();
                        }
                      },
                      icon: const Icon(Icons.play_arrow),
                      label: const Text("Chạy GA"),
                    ),
                  ],
                ),

                // ==== HIỂN THỊ KẾT QUẢ ====
                const SizedBox(height: 24),
                if (daChay && lichToiUu != null)
                  Card(
                    elevation: 4,
                    color: Colors.blue.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Text(
                            "KẾT QUẢ TỐI ƯU",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Table(
                            border: TableBorder.all(color: Colors.blueGrey),
                            defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                            children: [
                              TableRow(
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE0F2F1),
                                ),
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Ca / Thứ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ...['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN']
                                      .map(
                                        (e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        e,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              // Ca sáng
                              TableRow(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Sáng",
                                        textAlign: TextAlign.center),
                                  ),
                                  ...lichToiUu!.lichlam[0].map(
                                        (nv) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        nv,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              // Ca chiều
                              TableRow(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Chiều",
                                        textAlign: TextAlign.center),
                                  ),
                                  ...lichToiUu!.lichlam[1].map(
                                        (nv) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        nv,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Điểm tối ưu: ${lichToiUu!.diem}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
