import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/getapi/example1.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _homescreenState();
}

class _homescreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => homescreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Image(
              fit: BoxFit.fitHeight,
              image: NetworkImage(
                  'https://images.pexels.com/photos/3640930/pexels-photo-3640930.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'))
        ],
      ),
    );
  }
}
