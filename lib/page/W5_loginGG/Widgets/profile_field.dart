import 'package:flutter/material.dart';

class ProfileField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isDate;
  final bool readOnly;
  final Function(DateTime?)? onDatePick;

  const ProfileField({
    super.key,
    required this.label,
    required this.controller,
    this.isDate = false,
    this.readOnly = false,
    this.onDatePick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          readOnly: isDate || readOnly,
          onTap: isDate
              ? () async {
            DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.tryParse(controller.text) ??
                  DateTime(2000),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            onDatePick?.call(picked);
          }
              : null,
          decoration: InputDecoration(
            hintText: "Enter your $label",
            suffixIcon:
            isDate ? const Icon(Icons.calendar_today, size: 20) : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
