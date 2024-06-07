  import 'package:hive_flutter/hive_flutter.dart';
import 'package:projectgetx/db/model.dart';
 

addStudent(StudentModel value)async{
    final studentDb = await Hive.openBox<StudentModel>('studentDb');
    await studentDb.add(value);
    var data =studentDb.values.toList();
    await studentDb.clear();
    await studentDb.addAll(data);
  }
  List<StudentModel> studentList=[];

  getAllDetails()async{
    final studentDb= await Hive.openBox<StudentModel>('studentDb');
    studentList.addAll(studentDb.values);
    // notifyListeners();
  }