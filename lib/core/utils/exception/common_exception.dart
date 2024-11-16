import 'package:coordination_app/core/utils/error/error_response.dart';
import 'package:dio/dio.dart';

class CommonException {
  const CommonException();

  static ErrorResponse setError(error){
    if(error is Exception){
      if(error.runtimeType == DioException){
        final dioError = error as DioException;
        final code = dioError.response?.statusCode.toString() ?? '9999';

        return ErrorResponse(
          status: "Network Error",
          code: code,
          message: '네트워크 연결 상태를 다시 확인해주세요.',
        );
      }else {
        return const ErrorResponse(
          status: "unExpected Error",
          code: '8888',
          message: '서비스에 일시적인 오류가 발생했습니다. \n 잠시 후 다시 시도해주세요.',
        );
      }
    }
    return const ErrorResponse(
      status: "unKnown Error",
      code: '7777',
      message: '알 수 없는 오류가 발생했습니다. \n 잠시 후 다시 시도해주세요.',
    );
  }
}