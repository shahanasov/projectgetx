import 'package:hive_flutter/adapters.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class StudentModel extends HiveObject{
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String batch;
  @HiveField(2)
  final String domain;
  @HiveField(3)
  final String image;
  StudentModel({required this.name, required this.batch, required this.domain, required this.image});
}