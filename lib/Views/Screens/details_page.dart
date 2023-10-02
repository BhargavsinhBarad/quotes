import 'package:flutter/material.dart';

import '../Utils/lits.dart';

class details extends StatefulWidget {
  const details({super.key});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details page"),
        centerTitle: true,
      ),
      body: Center(child: Text("hello")),
    );
  }
}
