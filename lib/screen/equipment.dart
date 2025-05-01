import 'package:flutter/material.dart';

enum Eq {
  a(title: "เครื่องทำน้ำอุ่น", color: Colors.deepOrange),
  b(title: "เครื่องปรับอากาศ", color: Colors.deepOrange),
  c(title: "เครื่องซักผ้า", color: Colors.deepOrange),
  d(title: "เตารีดไฟฟ้า", color: Colors.deepOrange),
  e(
    title: "หม้อทอดไร้น้ำมัน",
    color: Colors.deepOrange,
  ),
  f(
    title: "หม้อหุงข้าว",
    color: Colors.deepOrange,
  ),
  g(
    title: "เตาไฟฟ้า",
    color: Colors.deepOrange,
  ),
  h(
    title: "เครื่องดูดฝุ่น",
    color: Colors.deepOrange,
  ),
  i(
    title: "เครื่องเป่าผม",
    color: Colors.deepOrange,
  ),
  j(
    title: "เตาไมโครเวฟ",
    color: Colors.deepOrange,
  );

  const Eq({required this.title, required this.color});
  final String title;
  final Color color;
}

class Equipment {
  Equipment(
      {required this.equ, required this.minpower, required this.maxpower});
  Eq equ;
  int minpower;
  int maxpower;
}

List<Equipment> data = [
  Equipment(equ: Eq.a, minpower: 2500, maxpower: 12000),
  Equipment(equ: Eq.b, minpower: 1200, maxpower: 3300),
  Equipment(equ: Eq.c, minpower: 3000, maxpower: 3000),
  Equipment(equ: Eq.d, minpower: 700, maxpower: 2000),
  Equipment(equ: Eq.e, minpower: 500, maxpower: 2000),
  Equipment(equ: Eq.f, minpower: 450, maxpower: 1500),
  Equipment(equ: Eq.g, minpower: 200, maxpower: 1500),
  Equipment(equ: Eq.h, minpower: 750, maxpower: 1200),
  Equipment(equ: Eq.i, minpower: 400, maxpower: 1000),
  Equipment(equ: Eq.j, minpower: 100, maxpower: 1000)
];

double calculate(hours, minpower) {
  return ((hours * minpower) / 1000) * 4;
}

double calculate2(hours, maxpower) {
  return ((hours * maxpower) / 1000) * 4;
}
