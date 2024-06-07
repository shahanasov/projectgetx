import 'package:flutter/material.dart';


class DetailsPage extends StatelessWidget {
  // final StudentModel studentModel;
  const DetailsPage({super.key, });

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title:  const Text('studentModel.name'),
      ),
      body: Center(
        child: Container(
          height: 520,
          width: 330,
          color: const Color.fromARGB(255, 208, 203, 189),
          child:  const Column(
            children: [
              CircleAvatar(radius: 80,),
              SizedBox(height: 20),
              Text('studentModel.name'),
              SizedBox(height: 20),
              Text('studentModel.batch'),
              SizedBox(height: 20),
              Text('studentModel.domain')
            ],
          ),
        ),
      ),
    );
  }
}