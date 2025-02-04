import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../dto/openai/file_upload/file_upload.dto.dart';
import '../../dto/openai/message/message.dto.dart';
import '../../dto/openai/run/run.dto.dart';
import '../../dto/openai/thread/thread.dto.dart';

part 'openai.api.g.dart';

@RestApi(baseUrl: "https://api.openai.com/v1")
abstract class OpenAiApi {
  factory OpenAiApi(Dio dio) = _OpenAiApi;

  @MultiPart()
  @POST("/files")
  Future<FileUploadResponse> uploadFile(
    @Header("Authorization") String apiKey,
    @Part(name: "file") File file,
    @Part(name: "purpose") String purpose,
  );

  @POST("/threads")
  Future<ThreadResponse> createThread(
    @Header("Authorization") String apiKey,
    @Header("Content-Type") String contentType,
    @Header("OpenAI-Beta") String openAiBeta,
  );

  @POST("/threads/{thread_id}/messages")
  Future<MessageResponse> sendMessage(
    @Header("Authorization") String apiKey,
    @Header("Content-Type") String contentType,
    @Header("OpenAI-Beta") String openAiBeta,
    @Path("thread_id") String threadId,
    @Body() MessageRequest request,
  );

  @POST("/threads/{thread_id}/runs")
  Future<RunResponse> createRun(
    @Header("Authorization") String apiKey,
    @Header("Content-Type") String contentType,
    @Header("OpenAI-Beta") String openAiBeta,
    @Path("thread_id") String threadId,
    @Body() RunRequest request,
  );

  @GET("/threads/{thread_id}/runs/{run_id}")
  Future<RunStatusResponse> checkRunStatus(
    @Header("Authorization") String apiKey,
    @Header("Content-Type") String contentType,
    @Header("OpenAI-Beta") String openAiBeta,
    @Path("thread_id") String threadId,
    @Path("run_id") String runId,
  );

  @GET("/threads/{thread_id}/messages")
  Future<MessageListResponse> getMessages(
    @Header("Authorization") String apiKey,
    @Header("Content-Type") String contentType,
    @Header("OpenAI-Beta") String openAiBeta,
    @Path("thread_id") String threadId,
  );
}
