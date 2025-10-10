import 'package:flutter/material.dart';

class CheckoldBody extends StatefulWidget {
  const CheckoldBody({super.key});

  @override
  State<CheckoldBody> createState() => _CheckoldBodyState();
}

class _CheckoldBodyState extends State<CheckoldBody> {
  final TextEditingController _Namecontroller = TextEditingController();
  final TextEditingController _Agecontroller = TextEditingController();
  String? _check;

  void _checkold() {
    final name = _Namecontroller.text.trim();
    final age = int.tryParse(_Agecontroller.text);

    if (name.isEmpty || age == null) {
      setState(() {
        _check = "Vui lòng nhập đủ dữ liệu";
      });
      return;
    }

    if (age <= 0) {
      setState(() {
        _check = "Tuổi phải lớn hơn 0";
      });
      return;
    }

    setState(() {
      if (age < 2) {
        _check = "$name là em bé";
      } else if (age < 6) {
        _check = "$name là trẻ em";
      } else if (age < 65) {
        _check = "$name là người lớn";
      } else {
        _check = "$name là người cao tuổi";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Thực hành 01",
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        const SizedBox(height: 10),
                        Container(
                            height: 150,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Họ và tên",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 150,
                                          height: 40,
                                          child: TextField(
                                            controller: _Namecontroller,
                                            decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white,
                                                enabledBorder: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    borderSide: BorderSide.none),
                                                focusedBorder: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    borderSide: BorderSide.none)),
                                          ),
                                        )
                                      ]),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Tuổi",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(
                                          width: 150,
                                          height: 40,
                                          child: TextField(
                                              controller:
                                              _Agecontroller,
                                              keyboardType: TextInputType.number,
                                              decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(10),
                                                      borderSide: BorderSide.none),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(10),
                                                      borderSide:
                                                      BorderSide.none)))),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        const SizedBox(height: 10),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue),
                            onPressed: _checkold, //  gọi hàm
                            child: const Text(
                              "Check",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            )),
                        const SizedBox(height: 10),
                        if (_check != null) ...[
                          Text(
                            _check!,
                            style:
                            const TextStyle(color: Colors.red, fontSize: 16),
                          )
                        ],
                      ],
                    )))));
  }
}
