import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Models/category.dart';
import '../../Models/jsonmodel.dart';

class quotes extends StatefulWidget {
  const quotes({super.key});

  @override
  State<quotes> createState() => _quotesState();
}

class _quotesState extends State<quotes> {
  @override
  Widget build(BuildContext context) {
    category e = ModalRoute.of(context)!.settings.arguments as category;
    return Scaffold(
      appBar: AppBar(
        title: Text("${e.name}"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: rootBundle.loadString("lib/Views/Utils/Json/quotes.json"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.hasError.toString()),
            );
          } else if (snapshot.hasData) {
            String jsondata = snapshot.data;
            List maydata = jsonDecode(jsondata);
            List<jsonmodel> data = maydata
                .map(
                  (e) => jsonmodel.json(data: e),
                )
                .toList();
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, i) {
                  return (e.name == data[i].category)
                      ? Container(
                          child: Text("${data[i].quotes}"),
                        )
                      : Container();
                });
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
