// notepad_cover.dart
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/notepad_styles.dart';

class NotePadCover extends StatelessWidget with NotepadStylesMixin {
  const NotePadCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: NotepadConstants.pageWidth,
      height: NotepadConstants.pageHeight,
      decoration: commonBoxDecoration.copyWith(
        color: const Color(0xed93602a),
      ),
    );
  }
}
