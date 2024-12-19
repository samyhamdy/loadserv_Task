import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_details_state.freezed.dart';

@freezed
class CategoryDetailsState<T> with _$CategoryDetailsState<T> {
  const factory CategoryDetailsState.initial() = _Initial;

  const factory CategoryDetailsState.loadingGettingCategoryDetails() =
      LoadingGettingCategoryDetails;
  const factory CategoryDetailsState.successGettingCategoryDetails(T data) =
      SuccessGettingCategoryDetails<T>;
  const factory CategoryDetailsState.errorGettingCategoryDetails(
      {required String error}) = ErrorGettingCategoryDetails;
}
