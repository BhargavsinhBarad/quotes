import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/Models/category.dart';
import 'package:quotes/Views/Helper/db_helper.dart';
import 'package:quotes/Views/Utils/lits.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  int select = -1;
  String? sname;
  ByteData? images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (select >= 0) {
            Uint8List img = images!.buffer.asUint8List();

            category Category = category(name: sname!, image: img);
            int? res = await DB_helper.db.insetcategory(data: Category);

            Get.snackbar("abc", "done");
          } else {
            Get.snackbar("aaa", "xyz");
          }
        },
        child: Text("Add"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 3, mainAxisSpacing: 3),
        itemCount: imagelist.length,
        itemBuilder: (ctx, i) {
          return GestureDetector(
            onTap: () {
              setState(() {
                select = i;
                sname = imagelist[i]['name'];
                images = imagelist[i]['name'];
              });
            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                    decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      imagelist[i]['Image'],
                    ),
                  ),
                )),
              ),
              decoration: BoxDecoration(
                  border: (select == i)
                      ? Border.all(color: Colors.black, width: 3)
                      : Border.all(color: Colors.grey),
                  color: (select == i)
                      ? Colors.grey.withOpacity(0.2)
                      : Colors.blue.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12)),
            ),
          );
        },
      ),
    );
  }
}
