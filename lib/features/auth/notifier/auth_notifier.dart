import 'package:naafa/features/auth/model/auth_model.dart';
import 'package:naafa/features/auth/state/auth_state.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    return AuthState(authModel: AuthModel(address: '',password: '',phone: '',email: '',username: ''),
    loading: false
    );
  }
}