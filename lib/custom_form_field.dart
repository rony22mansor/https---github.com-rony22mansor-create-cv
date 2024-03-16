import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.icon,
    required this.textController,
    required this.fieldName,
  }) : super(key: key);

  final String fieldName;
  final IconData icon;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [Icon(icon), Text(fieldName)],
        ),
        TextFormField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          controller: textController,
        ),
      ],
    );
  }
}
