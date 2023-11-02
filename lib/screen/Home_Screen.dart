
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive3/screen/add.dart';
import 'package:hive3/screen/model/model.dart';
import 'package:hive_flutter/adapters.dart';

class HomeScreen extends StatefulWidget {
  
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Box todoBox = Hive.box<TodoMOdle>('todoBox');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder(
          valueListenable:todoBox.listenable() ,
           builder: (context,todoBox,child){
            return ListView.builder(
              itemCount: todoBox.length,
              itemBuilder: (context,intex){
                TodoMOdle newtodo = todoBox.getAt(intex);
                return Card(
                  child: ListTile(
                    title: Text(newtodo.name),
                    subtitle: Text(newtodo.age),
                    leading: Icon(Icons.edit),
                    trailing: Icon(Icons.delete),
                  ),

                ); 
              },
            );
           }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>AddTodo()));
      }),
    );
  }
}


