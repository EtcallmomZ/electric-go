import 'package:flutter/material.dart';

enum Job {
  athlete(title: "athlete", image: "assets/image/logo.png", color: Colors.blue),
  programmer(
      title: "programmer",
      image: "assets/image/logo.png",
      color: Colors.deepOrange),
  director(
      title: "director", image: "assets/image/logo.png", color: Colors.purple),
  nurse(title: "nurse", image: "assets/image/logo.png", color: Colors.green),
  artist(title: "artist", image: "assets/image/logo.png", color: Colors.pink);

  const Job({required this.title, required this.image, required this.color});
  final String title;
  final String image;
  final Color color;
}

class Person {
  Person({required this.name, required this.age, required this.job});
  String name;
  int age;
  Job job;
}

List<Person> data = [
  Person(name: "eiweiw", age: 17, job: Job.programmer),
  Person(name: "mai", age: 17, job: Job.programmer),
];
