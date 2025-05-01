import 'package:flutter/material.dart';
import 'package:myproject/screen/calculate.dart';
import 'package:myproject/screen/item.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo.png",
            height: 250,
            width: 250,
          ),
          const SizedBox(
            height: 200,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.deepOrange[400]),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const Calculate()));
              },
              child: const Text(
                "Start",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange[400],
                  foregroundColor: Colors.white),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => const Item()));
              },
              child: const Text(
                "List",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
