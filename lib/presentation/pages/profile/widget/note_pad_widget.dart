import 'package:flutter/material.dart';

class NotePadWidget extends StatelessWidget {
  final Widget? child;

  const NotePadWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 350,
          height: 550,
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
              padding: const EdgeInsets.only(top: 46,left:16 ,right:16 ,bottom:16),
              child: child,
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 30,
            decoration: const BoxDecoration(
              color: Color(0xff040f63),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            alignment: Alignment.center,
          ),
        ),
      ],
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
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
