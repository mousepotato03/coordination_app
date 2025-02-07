// notepad_widget.dart
import 'dart:math';

import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/notepad_styles.dart';
import 'note_paper.dart';
import 'notepad_cover.dart';

class NotePadWidget extends StatefulWidget {
  final List<NotePaper> papers;

  const NotePadWidget({super.key, required this.papers});

  @override
  State<NotePadWidget> createState() => _NotePadWidgetState();
}

class _NotePadWidgetState extends State<NotePadWidget>
    with SingleTickerProviderStateMixin, NotepadStylesMixin {
  late AnimationController _controller;
  late final List<Widget> pages;
  int currentIndex = 0;
  bool isMovingToPrevPage = false;
  double dragAmount = 0.0;

  @override
  void initState() {
    super.initState();
    pages = [...widget.papers, const NotePadCover()];
    _controller = AnimationController(
      vsync: this,
      duration: NotepadConstants.animationDuration,
    );
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_isInvalidDrag(details.primaryDelta!)) return;

    setState(() {
      dragAmount += details.primaryDelta ?? 0.0;
      _controller.value =
          (dragAmount.abs() / NotepadConstants.dragThreshold).clamp(0.0, 1.0);
      isMovingToPrevPage = dragAmount > 0;
    });
  }

  bool _isInvalidDrag(double delta) {
    return (currentIndex == 0 && delta > 0) ||
        (currentIndex == widget.papers.length && delta < 0);
  }

  void _onDragEnd(DragEndDetails details) {
    if (_controller.isAnimating) return;

    if (_isInvalidDrag(dragAmount)) {
      _resetDrag();
      return;
    }

    if (_controller.value > 0.5) {
      _completePageTurn();
    } else {
      _cancelPageTurn();
    }
  }

  void _resetDrag() {
    setState(() {
      dragAmount = 0.0;
    });
  }

  void _completePageTurn() {
    completion() {
      setState(() {
        currentIndex =
            (isMovingToPrevPage ? currentIndex - 1 : currentIndex + 1)
                .clamp(0, widget.papers.length);
        dragAmount = 0.0;
      });
      _controller.reset();
    }

    if (isMovingToPrevPage) {
      _controller.forward(from: 1.0).then((_) => completion());
    } else {
      _controller.forward().then((_) => completion());
    }
  }

  void _cancelPageTurn() {
    _controller.reverse().then((_) => _resetDrag());
  }

  Widget _buildAnimatedPage(List<Widget> pages) {
    final int nextIndex = (dragAmount > 0 ? currentIndex - 1 : currentIndex + 1)
        .clamp(0, pages.length - 1);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final double rotation = _calculateRotation();
        return Stack(
          children: [
            pages[isMovingToPrevPage ? currentIndex : nextIndex],
            Transform(
              alignment: Alignment.topCenter,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(rotation),
              child: pages[isMovingToPrevPage ? nextIndex : currentIndex],
            ),
          ],
        );
      },
    );
  }

  double _calculateRotation() {
    const double rotationFactor = pi / 0.8;
    return isMovingToPrevPage
        ? (-rotationFactor + (_controller.value * rotationFactor))
        : -_controller.value * rotationFactor;
  }

  String _getCurrentTitle() {
    if (_controller.value > 0.4) {
      if (isMovingToPrevPage) {
        return currentIndex > 0 ? widget.papers[currentIndex - 1].title : '';
      } else {
        return currentIndex < widget.papers.length - 1
            ? widget.papers[currentIndex + 1].title
            : '';
      }
    }
    return currentIndex < widget.papers.length
        ? widget.papers[currentIndex].title
        : '';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: _onDragUpdate,
      onVerticalDragEnd: _onDragEnd,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: NotepadConstants.pageWidth,
            height: NotepadConstants.headerHeight,
            decoration: headerDecoration,
            alignment: Alignment.center,
            child: Text(
              _getCurrentTitle(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            width: NotepadConstants.pageWidth,
            height: NotepadConstants.pageHeight,
            child: Stack(
              alignment: Alignment.center,
              children: [
                IndexedStack(
                  index: currentIndex,
                  children: pages,
                ),
                if (pages.length > 1 && _controller.value > 0)
                  _buildAnimatedPage(pages),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
