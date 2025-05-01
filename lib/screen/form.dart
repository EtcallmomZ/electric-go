import 'package:flutter/material.dart';
import 'package:myproject/main.dart';
import 'package:myproject/model/person.dart';

class AddForm extends StatefulWidget {
  const AddForm({super.key});

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int _age = 20;
  Job _job = Job.programmer;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My title",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Form"),
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(
                      label: Text(
                    "Name",
                    style: TextStyle(fontSize: 20),
                  )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please fill your name";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text(
                    "Age",
                    style: TextStyle(fontSize: 20),
                  )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please fill your age";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _age = int.parse(value.toString());
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                    value: _job,
                    decoration: const InputDecoration(
                        label: Text(
                      "Job",
                      style: TextStyle(fontSize: 20),
                    )),
                    items: Job.values.map((key) {
                      return DropdownMenuItem(
                        value: key,
                        child: Text(key.title),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _job = value!;
                      });
                    }),
                FilledButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        data.add(Person(name: _name, age: _age, job: _job));
                      }
                      _formKey.currentState!.reset();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => const MyApp()));
                    },
                    style: FilledButton.styleFrom(
                        backgroundColor: Colors.deepOrange),
                    child: const Text(
                      "save",
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
