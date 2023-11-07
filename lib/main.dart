
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive3/screen/Home_Screen.dart';
import 'package:hive3/screen/model/model.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    Directory directory = await getApplicationDocumentsDirectory(); 
  Hive.init(directory.path);
  Hive.registerAdapter<TodoMOdle>(TodoMOdleAdapter()); 
 await Hive.openBox<TodoMOdle>('todoBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
