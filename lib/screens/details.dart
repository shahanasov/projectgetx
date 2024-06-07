import 'package:flutter/material.dart';
import 'package:projectgetx/db/model.dart';


class DetailsPage extends StatelessWidget {
  final StudentModel studentModel;
  const DetailsPage({super.key, required this.studentModel, });

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title:   Text(studentModel.name),
      ),
      body: Center(
        child: Container(
          height: 520,
          width: 330,
          color: const Color.fromARGB(255, 208, 203, 189),
          child:   Column(
            children: [
              const CircleAvatar(radius: 80,),
              const SizedBox(height: 20),
              Text(studentModel.name),
              const SizedBox(height: 20),
              Text(studentModel.batch),
              const SizedBox(height: 20),
              Text(studentModel.domain)
            ],
          ),
        ),
      ),
    );
  }
}