import 'package:flutter/material.dart';
import 'package:quizz_app/app.dart';
import 'package:quizz_app/config/network/dio_config.dart';

void main() {
  DioConfig().init();
  runApp(const App());
}
