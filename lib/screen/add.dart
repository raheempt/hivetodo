import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive3/screen/model/model.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final namecontrollar = TextEditingController();
  final agecontrollar = TextEditingController();
  Box todoBox = Hive.box<TodoMOdle>('todoBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextFormField(
            controller: namecontrollar,
          ),
          TextFormField(
            controller: agecontrollar,
          ),
          ElevatedButton(
              onPressed: () {
                final name = namecontrollar.text.toString();
                final age = agecontrollar.text.toString();
                if (name.isNotEmpty && age.isNotEmpty) {
                  TodoMOdle newtodo = TodoMOdle(name: name, age: age);

                  todoBox.add(newtodo);
                                  Navigator.pop(context);
     
                }
              },
              child: Text('save'))
        ]),
      ),
    );
  }
}
