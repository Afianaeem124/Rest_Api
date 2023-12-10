import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/modeluser.dart';
import 'package:http/http.dart' as http;

class examplethree extends StatefulWidget {
  const examplethree({super.key});

  @override
  State<examplethree> createState() => _examplethreeState();
}

class _examplethreeState extends State<examplethree> {
  List<UserModel> userlist = [];
  Future<List<UserModel>> getuser() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        print(i['name']);
        userlist.add(UserModel.fromJson(i));
      }
      return userlist;
    } else {
      return userlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ex3ouuulu'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getuser(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                        //itemCount: userlist.length,
                        itemCount: userlist.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.amber,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  reuserow(
                                      title: 'Name',
                                      value: userlist[index].name.toString()),
                                  reuserow(
                                      title: 'username',
                                      value:
                                          userlist[index].username.toString()),
                                  reuserow(
                                      title: 'email',
                                      value: userlist[index].email.toString()),
                                  reuserow(
                                      title: 'Address',
                                      value: userlist[index]
                                          .address!
                                          .geo!
                                          .lat
                                          .toString()),
                                  reuserow(
                                      title: 'id',
                                      value: userlist[index].id.toString()),
                                ],
                              ),
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

class reuserow extends StatelessWidget {
  String title, value;
  reuserow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
