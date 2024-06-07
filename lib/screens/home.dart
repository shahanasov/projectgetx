import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectgetx/db/functions.dart';
import 'package:projectgetx/screens/details.dart';
import 'package:projectgetx/screens/register.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    StudentController studentController = Get.put(StudentController());
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        centerTitle: true,
        title: const Text('Students'),
      ),
      body: GetBuilder<StudentController>(
          init: studentController,
          builder: (controller) {
            return ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                      thickness: 1,
                    ),
                itemCount: studentController.studentList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ListTile(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => DetailsPage(
                        //           studentModel:
                        //               studentController.studentList[index],
                        //         )));
                        Get.to(() => DetailsPage(
                              studentModel:
                                  studentController.studentList[index],
                            ));
                      },
                      title: Text(controller.studentList[index].name),
                      leading: const CircleAvatar(),
                      subtitle: Text(controller.studentList[index].batch),
                    ),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton.extended(
          label: const Row(
            children: [Text('Add'), Icon(Icons.add)],
          ),
          onPressed: () {
            Get.to(() => Register());
          }),
    );
  }
}
