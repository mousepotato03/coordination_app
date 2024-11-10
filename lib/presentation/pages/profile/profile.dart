import 'package:coordination_app/presentation/pages/profile/widget/note_pad_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: NotePadWidget(),);
  }
}

