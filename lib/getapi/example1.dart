import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/model/model.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  List<hehe> hehelist = [];
  Future<List<hehe>> getapi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        hehelist.add(hehe.fromJson(i));
      }
      return hehelist;
    } else {
      return hehelist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('home'),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getapi(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: hehelist.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: const Color.fromARGB(255, 243, 243, 136),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'userID :'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 216, 24, 255)),
                                  ),
                                  Text(hehelist[index].userId.toString()),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'ID :'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 255, 109, 24)),
                                  ),
                                  Text(hehelist[index].id.toString()),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'title :'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.cyanAccent),
                                  ),
                                  Text(hehelist[index].title.toString()),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'description :'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.redAccent),
                                  ),
                                  Text(hehelist[index].body.toString())
                                ],
                              ),
                            );
                          });
                    } else {
                      return Text('Loading...');
                    }
                  }),
            )
          ],
        ));
  }
}
