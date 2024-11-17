import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? value;
  final String? unit;
  final ValueChanged<String>? onChanged;
  final bool isEditMode;
  const CustomTextField({
    super.key,
    required this.label,
    this.value,
    this.unit,
    this.onChanged,
    this.isEditMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 100,
          child: Text(label, style: const TextStyle(fontSize: 16)),
        ),
        Expanded(
          child: TextField(
            controller: TextEditingController(text: value),
            onChanged: onChanged,
            enabled: isEditMode,
            style: TextStyle(
              color: isEditMode ? Colors.black : Colors.grey[600],
              fontSize: 16,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              border: const UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: isEditMode ? Colors.black : Colors.grey[400]!,
                ),
              ),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400]!),
              ),
              suffixText: unit,
              suffixStyle: TextStyle(
                color: isEditMode ? Colors.black : Colors.grey[600],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
