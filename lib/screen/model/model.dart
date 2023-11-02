
import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 1)
class TodoMOdle{
@HiveField(0)
String name;
@HiveField(1)
String age;

TodoMOdle({required this.name,required this.age});

}