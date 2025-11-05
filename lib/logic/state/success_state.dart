

import 'package:freezed_annotation/freezed_annotation.dart';
part 'success_state.freezed.dart';

extension SuccessStateGetters on SuccessState {
  bool get isLoading => this is Loading;
  bool get isError => this is ErrorMessage;
  
}

@freezed
abstract class SuccessState with _$SuccessState {
  const factory SuccessState.initial() = Initial;
  const factory SuccessState.loading() = Loading;
  const factory SuccessState.loaded() = Loaded;
  const factory SuccessState.error({required String message}) = ErrorMessage;
}
