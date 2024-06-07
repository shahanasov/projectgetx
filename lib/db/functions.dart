  import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:projectgetx/db/model.dart';
 
 class StudentController extends GetxController {
   
 

addStudent(StudentModel value)async{
    final studentDb = await Hive.openBox<StudentModel>('studentDb');
    await studentDb.add(value);
    // var data =studentDb.values.toList();
    // await studentDb.clear();
    // await studentDb.addAll(data);
    getAllDetails();
  }
  List studentList=[];

  getAllDetails()async{
    final studentDb= await Hive.openBox<StudentModel>('studentDb');
    studentList.addAll(studentDb.values);
    update();
  }
 }