import 'package:flutter/material.dart';
import 'package:myproject/screen/equipment.dart';
import 'package:myproject/screen/home.dart';
import 'package:myproject/screen/item.dart';

class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Eq? equipment;
  double hours = 0;
  double? result1;
  double? result2;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "my title",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Calculate"),
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey, // เพิ่ม key
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Daily Used(hour)"),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please fill Daily Used(hour)";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      hours = double.tryParse(value) ?? 0;
                    });
                  },
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<Eq>(
                  value: equipment,
                  decoration: const InputDecoration(
                    label: Text("Electric equipment"),
                  ),
                  onChanged: (Eq? value) {
                    setState(() {
                      equipment = value;
                    });
                  },
                  items: Eq.values.map((Eq eq) {
                    return DropdownMenuItem<Eq>(
                      value: eq,
                      child: Text(eq.title),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (equipment != null) {
                        final selectedEquipment = data.firstWhere(
                          (item) => item.equ == equipment,
                          orElse: () =>
                              Equipment(equ: Eq.a, minpower: 0, maxpower: 0),
                        );
                        double minpower = selectedEquipment.minpower.toDouble();
                        double maxpower = selectedEquipment.maxpower.toDouble();
                        setState(() {
                          result1 = calculate(hours, minpower);
                          result2 = calculate2(hours, maxpower);
                        });
                      }
                    }
                  },
                  style: FilledButton.styleFrom(
                      backgroundColor: Colors.deepOrange),
                  child: const Text(
                    "Calculate",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 20),
                if (result1 != null && result2 != null)
                  Column(
                    children: [
                      Text(
                        "mincost : ${result1!.toStringAsFixed(0)} bath",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "maxcost : ${result2!.toStringAsFixed(0)} bath",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 200,
                ),
                FilledButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => const Home()));
                    },
                    style: FilledButton.styleFrom(
                        backgroundColor: Colors.deepOrange),
                    child: const Text(
                      "Home",
                      style: TextStyle(fontSize: 20),
                    )),
                const SizedBox(
                  height: 20,
                ),
                FilledButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => const Item()));
                    },
                    style: FilledButton.styleFrom(
                        backgroundColor: Colors.deepOrange),
                    child: const Text(
                      "List",
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
