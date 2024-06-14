import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectgetx/db/functions.dart';
import 'package:projectgetx/db/model.dart';

class EditPage extends StatelessWidget {
  final StudentModel studentModel;
  EditPage({super.key, required this.studentModel});

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController batchController;
  late TextEditingController domainController;

  late StudentController studentController;

  @override
  Widget build(BuildContext context) {
    studentController = Get.find<StudentController>();

    nameController = TextEditingController(text: studentModel.name);
    batchController = TextEditingController(text: studentModel.batch);
    domainController = TextEditingController(text: studentModel.domain);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 208, 203, 189),
              borderRadius: BorderRadius.circular(20)),
          height: 520,
          width: 330,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formkey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                      child: const CircleAvatar(
                        radius: 50,
                        child: Icon(Icons.add_photo_alternate),
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          label: Text('Name'),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Your Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: batchController,
                      decoration: const InputDecoration(
                          label: Text('Batch'),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Your Batch';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: domainController,
                      decoration: const InputDecoration(
                          label: Text('Domain'),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Your Domain';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          editstudent(context, studentModel.key);
                          // Navigator.of(context).pop();
                        },
                        child: const Text('Register'))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // validatingForm() {
  //   if (formkey.currentState!.validate()) {}
  // }
  editstudent(context, key) {
    final name = nameController.text.trim();
    final batch = batchController.text.trim();
    final domain = domainController.text.trim();

    if (formkey.currentState!.validate()) {
      final student = StudentModel(name: name, batch: batch, domain: domain, image: '');

      studentController.updateStudent(student, key);

      Get.back();
      nameController.text = '';
      batchController.text = '';
      domainController.text = '';
    }
  }
}
