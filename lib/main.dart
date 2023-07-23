import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_primary_architecture/injection_container.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';

void main() async {
  await dotenv.load(fileName: ".env"); // load env variables from the .env file
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(),
    );
  }
}
