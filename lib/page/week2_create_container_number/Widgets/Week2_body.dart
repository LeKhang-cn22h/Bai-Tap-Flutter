import 'package:flutter/material.dart';

class Week2Body extends StatefulWidget {
  const Week2Body({super.key});

  @override
  State<Week2Body> createState() => _Week2BodyState();
}

class _Week2BodyState extends State<Week2Body> {
  final TextEditingController _SLcontroller = TextEditingController();
  List<Widget> _containers = [];
  String ? _loi;

  void _createContainer() {
    final text = _SLcontroller.text;
    final soLuong = int.tryParse(text);

    if (soLuong == null || soLuong <= 0) {
      setState(() {
        _loi="vui long nhap so hop le";
        _containers = [];
      });
      return;
    }
    else {
      _loi=null;
      setState(() {
        _containers = List.generate(soLuong, (index) {
          return Container(
            width: 300,
            height: 50,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "${index + 1}",
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          );
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Thực hành 02",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Ô nhập + nút Create
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: TextField(
                        controller: _SLcontroller,
                        decoration: InputDecoration(
                          hintText: "Nhập số lượng tại đây",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(80, 50),
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: _createContainer,
                      child: const Text(
                        "Create",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                if(_loi!=null)...[
                  SizedBox(height:20),
                  Text(_loi!,style: TextStyle(color: Colors.red),)
                ],
                const SizedBox(height: 20),

                // Danh sách container tạo ra
                Column(
                  children: _containers,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
