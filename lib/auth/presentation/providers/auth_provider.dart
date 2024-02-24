import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quizz_app/auth/data/datasources/auth_service.dart';

class AuthNotifier extends AsyncNotifier<bool> {
  final authService = AuthService();
  final storage = const FlutterSecureStorage();

  @override
  FutureOr<bool> build() async {
    state = const AsyncLoading();
    final String? token = await storage.read(key: 'token');
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    state = const AsyncLoading();
    final response = await authService.login(
      username: username,
      password: password,
    );
    if (response.statusCode == 200) {
      await storage.write(key: 'token', value: response.data['token']);
      await storage.write(key: 'username', value: username);
      state = const AsyncData(true);
    } else if (response.statusCode == 420) {
      state = AsyncError('Credenciales incorrectas', StackTrace.current);
    } else {
      state = AsyncError('Error, intente más tarde', StackTrace.current);
    }
  }

  Future<void> register({
    required String username,
    required String password,
  }) async {
    final response = await authService.register(
      username: username,
      password: password,
    );

    if (response.statusCode == 200) {
      login(
        username: username,
        password: password,
      );
    } else if (response.statusCode == 411) {
      state = AsyncError(
        'El usuario ya existe',
        StackTrace.current,
      );
    } else {
      state = AsyncError(
        'Error, intente más tarde',
        StackTrace.current,
      );
    }
  }

  Future<void> logout() async {
    await storage.delete(key: 'token');
    state = const AsyncData(false);
  }
}

final authProvider = AsyncNotifierProvider<AuthNotifier, bool>(() {
  return AuthNotifier();
});
