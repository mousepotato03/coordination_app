import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants.dart';
import '../../main/riverpod/user_state_provider.dart';
import 'ui/lab/lab_ui.dart';
import 'ui/login/login_page.dart';

class LabPage extends StatelessWidget {
  const LabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final status = ref.watch(userStateProvider).status;
        switch (status) {
          case Status.initial:
            return const LogInUI();
          case Status.loading:
            return const Center(child: CircularProgressIndicator());
          case Status.success:
            return const LabUI();
          case Status.error:
            return const Center(child: Text("에러임 ㅇㅇ;;"));
        }
      },
    );
  }
}
