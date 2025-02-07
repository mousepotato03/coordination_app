import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/notepad_styles.dart';


class NotePaper extends StatelessWidget with NotepadStylesMixin {
  final String title;
  final Widget content;

  const NotePaper({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: NotepadConstants.pageWidth,
      height: NotepadConstants.pageHeight,
      decoration: commonBoxDecoration.copyWith(
        color: Colors.amber.shade100,
      ),
      child: CustomPaint(
        painter: LinedPaperPainter(),
        child: Container(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 40,
            bottom: 8,
          ),
          child: content,
        ),
      ),
    );
  }
}

class LinedPaperPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 1;

    for (double i = 0; i < size.height; i += 20) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
