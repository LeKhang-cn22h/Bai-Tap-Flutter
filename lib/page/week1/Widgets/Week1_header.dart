import 'package:flutter/material.dart';

class Week1Header extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onEdit;
  const Week1Header({super.key, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      // đổ bóng
      elevation: 0,
      // icon xuất hiện bên trái
      leading: IconButton(onPressed: (){
        Navigator.pop(context);

      }, icon: const Icon(Icons.arrow_back,color: Colors.black)),
      actions: [
        IconButton(onPressed: onEdit, icon: const Icon(Icons.edit,color: Colors.black)),
      ],

    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
