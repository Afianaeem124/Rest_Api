import 'package:flutter/material.dart';
import 'package:flutter_application_1/getapi/example3.dart';
import 'package:flutter_application_1/getapi/example4.dart';
import 'package:flutter_application_1/getapi/examplefive.dart';
import 'package:flutter_application_1/postapi/signup.dart';
import 'package:flutter_application_1/postapi/upload_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: UploadImage(),
    );
  }
}
