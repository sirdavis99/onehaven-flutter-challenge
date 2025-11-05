import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:onehaven_flutter_challenge/domain/entities/auth.dart';
part 'auth_state.freezed.dart';



extension AuthStateGetters on AuthState {
  bool get isLoading => this is Loading;
  bool get isError => this is ErrorMessage;
  AuthEntity get data => (this as Loaded).data;
}

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;
  const factory AuthState.loading() = Loading;
  const factory AuthState.loaded({required AuthEntity data}) = Loaded;
  const factory AuthState.error({required String message}) = ErrorMessage;
}
