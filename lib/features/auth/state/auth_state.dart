import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/auth_model.dart';

part 'auth_state.freezed.dart';
part 'auth_state.g.dart';

@freezed
class AuthState with _$AuthState {

  factory AuthState({
    required AuthModel authModel,
    @Default(false) bool loading,
  }) = _AuthState;

  factory AuthState.fromJson(Map<String, dynamic> json) => _$AuthStateFromJson(json);
  Map<String, dynamic> toJson() => super.toJson();
}