import 'dart:io';

import 'package:coordination_app/core/secure_key.dart';
import 'package:coordination_app/core/utils/dev_func/custom_debug_print.dart';
import 'package:coordination_app/data/response_wrapper/response_wrapper.dart';
import 'package:coordination_app/domain/repository/my_outfit.repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/utils/logger.dart';
import '../data_source/remote/openai.api.dart';
import '../dto/openai/message/message.dto.dart';
import '../dto/openai/run/run.dto.dart';

@Singleton(as: MyOutfitRepository)
class MyOutfitRepositoryImpl extends MyOutfitRepository {
  final OpenAiApi _openAiApi;

  MyOutfitRepositoryImpl(this._openAiApi);

  @override
  Future<String> uploadFile(File file) async {
    try {
      final formData = File(file.path);
      final response = await _openAiApi.uploadFile(
        "Bearer $gptKey",
        formData,
        "assistants",
      );
      return response.id;
    } catch (e) {
      CustomLogger.logger.e("파일 업로드 실패: $e");
      return "";
    }
  }

  @override
  Future<ResponseWrapper<String>> evaluatingOutfit(
      List<String> imageIds) async {
    String? threadId;
    String? runId;

    try {
      final threadResponse = await _openAiApi.createThread(
        "Bearer $gptKey",
        "application/json",
        "assistants=v2",
      );
      threadId = threadResponse.id;
    } catch (e) {
      CustomLogger.logger.e("스레드 생성 실패: $e");
      return ResponseWrapper(status: "ERROR", data: "스레드 생성 실패: $e");
    }

    try {
      final messageRequest = MessageRequest(
        role: "user",
        content: "착용한 옷(사진 첨부된 거임)의 코디를 평가해줘.",
        attachments: imageIds
            .map((id) => {
                  "file_id": id,
                  "tools": [
                    {"type": "code_interpreter"}
                  ]
                })
            .toList(),
      );

      await _openAiApi.sendMessage(
        "Bearer $gptKey",
        "application/json",
        "assistants=v2",
        threadId,
        messageRequest,
      );
    } catch (e) {
      CustomLogger.logger.e("메시지 전송 실패: $e");
      return ResponseWrapper(status: "ERROR", data: "메시지 전송 실패: $e");
    }

    try {
      final runResponse = await _openAiApi.createRun(
        "Bearer $gptKey",
        "application/json",
        "assistants=v2",
        threadId,
        const RunRequest(assistant_id: gptAssistantsKey),
      );
      runId = runResponse.id;
    } catch (e) {
      CustomLogger.logger.e("런 생성 실패: $e");
      return ResponseWrapper(status: "ERROR", data: "런 생성 실패: $e");
    }

    try {
      while (true) {
        infoDebugPrint("Checking runStatus");
        final runStatus = await _openAiApi.checkRunStatus(
          "Bearer $gptKey",
          "application/json",
          "assistants=v2",
          threadId,
          runId,
        );

        if (runStatus.status == "completed") {
          infoDebugPrint("run completed ");
          break;
        }

        await Future.delayed(const Duration(seconds: 2));
      }
    } catch (e) {
      CustomLogger.logger.e("런 상태 확인 실패: $e");
      return ResponseWrapper(status: "ERROR", data: "런 상태 확인 실패: $e");
    }

    try {
      final messages = await _openAiApi.getMessages(
        "Bearer $gptKey",
        "application/json",
        "assistants=v2",
        threadId,
      );

      return ResponseWrapper(
        status: "SUCCESS",
        data: messages.messages.first.text,
      );
    } catch (e) {
      CustomLogger.logger.e("메시지 조회 실패: $e");
      return ResponseWrapper(status: "ERROR", data: "메시지 조회 실패: $e");
    }
  }
}
