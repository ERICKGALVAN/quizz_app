import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthScreensEnum {
  login,
  register,
}

final authScreensProvider = StateProvider.autoDispose<AuthScreensEnum>(
  (ref) => AuthScreensEnum.login,
);
