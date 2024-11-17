import 'package:coordination_app/presentation/pages/profile/widget/note_paper.dart';
import 'package:flutter/material.dart';

class NotePadWidget extends StatefulWidget {
  final List<Widget> children;

  const NotePadWidget({
    super.key,
    required this.children,
  });

  @override
  State<NotePadWidget> createState() => _NotePadWidgetState();
}

class _NotePadWidgetState extends State<NotePadWidget> {
  int currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity! < 0 && currentIndex < widget.children.length - 1) {
          FocusScope.of(context).unfocus();
          setState(() => currentIndex++);
        } else if (details.primaryVelocity! > 0 && currentIndex > 0) {
          FocusScope.of(context).unfocus();
          setState(() => currentIndex--);
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          NotePaper(child: widget.children[currentIndex]),
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
              child: Text(
                _getPageTitle(currentIndex),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getPageTitle(int index) {
    switch (index) {
      case 0:
        return '기본 정보';
      case 1:
        return '상의 정보';
      case 2:
        return '하의 정보';
      case 3:
        return '신발 정보';
      default:
        return '';
    }
  }
}
