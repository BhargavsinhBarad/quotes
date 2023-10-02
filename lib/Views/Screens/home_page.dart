import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/Models/category.dart';
import 'package:quotes/Views/Helper/db_helper.dart';
import 'package:quotes/Views/Screens/quotes.dart';
import 'package:quotes/Views/Utils/lits.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  int select = -1;
  String? sname;
  String? images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Get.to(details());
        //       },
        //       icon: Icon(Icons.chevron_right))
        // ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     if (select >= 0) {
      //       category Category = category(name: sname!, image: images!);
      //       addcategory.add(Category as Map<String, dynamic>);
      //
      //       Get.snackbar("abc", "done");
      //     } else {
      //       Get.snackbar("aaa", "xyz");
      //     }
      //   },
      //   child: Text("Add"),
      // ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 3, mainAxisSpacing: 3),
        itemCount: 21,
        itemBuilder: (ctx, i) {
          return GestureDetector(
            onTap: () {
              category c1 = category(
                  name: imagelist[i]['category'],
                  image: imagelist[i]['Image'],
                  id: imagelist[i]['id']);
              Get.to(quotes(), arguments: c1);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(
                    imagelist[i]['Image'],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
