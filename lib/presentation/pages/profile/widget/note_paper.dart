import 'package:flutter/material.dart';

class NotePaper extends StatelessWidget {
  final Widget child;

  const NotePaper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 500,
      decoration: BoxDecoration(
        color: Colors.amber.shade100,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(10, 8),
            blurRadius: 4,
          ),
        ],
      ),
      child: CustomPaint(
        painter: LinedPaperPainter(),
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 8),
          child: child,
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