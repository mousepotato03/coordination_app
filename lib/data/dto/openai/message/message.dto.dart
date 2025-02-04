import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.dto.freezed.dart';
part 'message.dto.g.dart';

@freezed
class MessageRequest with _$MessageRequest {
  const factory MessageRequest({
    required String role,
    required String content,
    List<Map<String, dynamic>>? attachments,
  }) = _MessageRequest;

  factory MessageRequest.fromJson(Map<String, dynamic> json) =>
      _$MessageRequestFromJson(json);
}

@freezed
class MessageResponse with _$MessageResponse {
  const factory MessageResponse({
    required String id,
  }) = _MessageResponse;

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);
}

@freezed
class MessageListResponse with _$MessageListResponse {
  const factory MessageListResponse({
    required List<ChatMessage> messages,
  }) = _MessageListResponse;

  factory MessageListResponse.fromJson(Map<String, dynamic> json) {
    final messageList = (json['data'] as List)
        .map((messageJson) => ChatMessage.fromJson(messageJson))
        .toList();

    return MessageListResponse(messages: messageList);
  }
}

@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String text,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    final content = json['content'] as List;
    final textContent = content.firstWhere(
      (element) => element['type'] == 'text',
      orElse: () => {
        'text': {'value': ''}
      },
    );

    return ChatMessage(
      text: textContent['text']['value'] as String,
    );
  }
}
