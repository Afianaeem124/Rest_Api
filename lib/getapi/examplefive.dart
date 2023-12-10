import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/products_model.dart';
import 'package:http/http.dart' as http;

class examplefive extends StatefulWidget {
  const examplefive({super.key});

  @override
  State<examplefive> createState() => _examplefiveState();
}

class _examplefiveState extends State<examplefive> {
  Future<ProductsModel> getproductsapi() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/42c975d7-474a-4486-ae48-7d8657827fff'));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return ProductsModel.fromJson(data);
    } else {
      return ProductsModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('complexapu'.toUpperCase()),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getproductsapi(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.data!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListTile(
                                  title: Text(snapshot
                                      .data!.data![index].shop!.name
                                      .toString()),
                                  subtitle: Text(snapshot
                                      .data!.data![index].shop!.shopemail
                                      .toString()),
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(snapshot
                                        .data!.data![index].shop!.image
                                        .toString()),
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
                                  width: MediaQuery.of(context).size.width * 1,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot
                                          .data!.data![index].images!.length,
                                      itemBuilder: (context, position) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(snapshot
                                                        .data!
                                                        .data![index]
                                                        .images![position]
                                                        .url
                                                        .toString()))),
                                          ),
                                        );
                                      }),
                                )
                              ],
                            );
                          });
                    } else {
                      return Text('loading..');
                    }
                  }))
        ],
      ),
    );
  }
}
