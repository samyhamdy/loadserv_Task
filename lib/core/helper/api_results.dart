import 'package:loadserv_task/core/helper/api_error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_results.freezed.dart';

@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(ErrorHandler errorHandler) = Failure<T>;
}
