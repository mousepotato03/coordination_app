import '../response_wrapper/response_wrapper.dart';

extension ResponseWrapperEx on ResponseWrapper {
  ResponseWrapper<T> toModel<T>(T data) {
    return ResponseWrapper(
      status: status,
      code: code,
      message: message,
      data: data,
    );
  }
}
