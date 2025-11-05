


import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onehaven_flutter_challenge/domain/entities/user.dart';
part 'get_user_state.freezed.dart';

extension GetUserStateGetters on GetUserState {
  bool get isLoading => this is Loading;
  bool get isError => this is ErrorMessage;
  UserEntity get data => (this as Loaded).data;
}

@freezed
abstract class GetUserState with _$GetUserState {
  const factory GetUserState.initial() = Initial;
  const factory GetUserState.loading() = Loading;
  const factory GetUserState.empty() = Empty;
  const factory GetUserState.loaded({required UserEntity data}) =
      Loaded;
  const factory GetUserState.error({required String message}) =
      ErrorMessage;
}
