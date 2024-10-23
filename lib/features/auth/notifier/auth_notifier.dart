import 'package:dio/dio.dart';
import 'package:naafa/features/auth/model/auth_model.dart';
import 'package:naafa/features/auth/state/auth_state.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/repository/auth_repository.dart';
part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    return AuthState(
        authModel: AuthModel(
            address: '', password: '', phone: '', email: '', username: ''),
        loading: false);
  }

  AuthRepository get _repository => ref.read(authRepositoryProvider);

  usernameChange(String v) {
    state = state.copyWith(authModel: state.authModel.copyWith(username: v));
  }

  passwordChange(String v) {
    state = state.copyWith(authModel: state.authModel.copyWith(password: v));
  }

  emailChange(String v) {
    state = state.copyWith(authModel: state.authModel.copyWith(email: v));
  }

  phoneChange(String v) {
    state = state.copyWith(authModel: state.authModel.copyWith(phone: v));
  }

  addressChange(String v) {
    state = state.copyWith(authModel: state.authModel.copyWith(address: v));
  }

  login() async {
    try {
      state = state.copyWith(loading: true);
      await _repository.login(
          state.authModel.username, state.authModel.password);
      state = state.copyWith(loading: false);
    } on DioException catch (e) {
      state = state.copyWith(loading: false);
      return Future.error(e.response?.data['error']);
    }
  }
}
