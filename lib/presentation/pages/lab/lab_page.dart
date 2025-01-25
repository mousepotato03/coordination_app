import 'package:flutter/material.dart';

class LabPage extends StatelessWidget {
  const LabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExpansionTile(
      title: Text("클릭해서 펼쳐보세요"),
      children: [
        ListTile(title: Text("추가 정보 1")),
        ListTile(title: Text("추가 정보 2")),
      ],
    );
  }
}
