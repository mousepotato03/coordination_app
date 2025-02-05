import 'package:coordination_app/presentation/pages/avatar/riverpod/avatar_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void showEvaluationDialog(BuildContext context, WidgetRef ref) async {
  final evaluationContent = ref.read(avatarStateProvider).evaluation;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("평가 결과"),
        content: SizedBox(
          width: double.maxFinite, // 다이얼로그 크기 조정
          child: Column(
            mainAxisSize: MainAxisSize.min, // 내용에 맞춰 크기 조절
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: MarkdownBody(data: evaluationContent),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text("확인"),
          ),
        ],
      );
    },
  );
}
