import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class AvatarPage extends StatefulWidget {
  const AvatarPage({super.key});

  @override
  State<AvatarPage> createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {
  late UnityWidgetController _unityWidgetController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        UnityWidget(
          onUnityCreated: onUnityCreated,
        ),
      ],
    );
  }

  void onUnityCreated(UnityWidgetController controller) {
    _unityWidgetController = controller;
  }
}
