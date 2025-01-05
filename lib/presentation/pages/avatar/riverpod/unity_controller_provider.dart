import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

//Unity Controller
final unityControllerProvider = StateNotifierProvider<UnityNotifier,
        UnityWidgetController?>(
    (ref) =>
        UnityNotifier(null) //초기 UnityController 는 아직 AvatarPage 에서 전달 받지 못했음.
    );

class UnityNotifier extends StateNotifier<UnityWidgetController?> {
  UnityNotifier(super.state);

  Future<void> unityControllerInitialized(
      UnityWidgetController controller) async {
    state = controller; // 생성 후 넘겨 받은 controller 를 state 로 저장.
  }
}
