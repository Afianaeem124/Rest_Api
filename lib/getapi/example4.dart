import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/getapi/example3.dart';
import 'package:flutter_application_1/model/modeluser.dart';
import 'package:http/http.dart' as http;

class examplefour extends StatefulWidget {
  const examplefour({super.key});

  @override
  State<examplefour> createState() => _examplefourState();
}

class _examplefourState extends State<examplefour> {
  var data;
  Future<void> getapi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WithoutModel'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getapi(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('loadding...');
                  } else {
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.deepOrangeAccent,
                            child: Column(
                              children: [
                                reuserow(
                                    title: 'name',
                                    value: data[index]['name'].toString()),
                                reuserow(
                                    title: 'username',
                                    value: data[index]['username'].toString()),
                                reuserow(
                                    title: 'id',
                                    value: data[index]['id'].toString()),
                                reuserow(
                                    title: 'email',
                                    value: data[index]['email'].toString()),
                                reuserow(
                                    title: 'lat',
                                    value: data[index]['address']['geo']['lat']
                                        .toString()),
                                reuserow(
                                    title: 'lng',
                                    value: data[index]['address']['geo']['lng']
                                        .toString()),
                              ],
                            ),
                          );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}
