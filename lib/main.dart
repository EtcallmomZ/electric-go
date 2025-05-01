import 'package:flutter/material.dart';
import 'package:myproject/screen/home.dart';

void main() {
  runApp(MaterialApp(
      title: "Electic GO V.0.0.2",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Electric Go"),
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
        ),
        body: const Home(),
      )));
}
