import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projectgetx/db/functions.dart';
import 'package:projectgetx/db/model.dart';

class Register extends StatelessWidget {
  Register({super.key});

  StudentController studentController = Get.find<StudentController>();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController batchController = TextEditingController();
  final TextEditingController domainController = TextEditingController();
  // late StudentController studentController;

  final ImagePicker imgpicker = ImagePicker();
  XFile? imagefile;
   late RxString imagefileobs = ''.obs;

  @override
  Widget build(BuildContext context) {
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
                        onTap: () {
                          uploadImage();
                        },
                        child:Obx(() => 
                         imagefileobs.isNotEmpty
                            ?  CircleAvatar(
                                    radius: 80,
                                    backgroundImage:
                                        FileImage(File(imagefileobs.value)),
                                  )
                              
                            
                            : const CircleAvatar(
                                radius: 80,
                                child: Icon(Icons.add_a_photo_outlined),
                              ))),
                    const SizedBox(height: 20),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.name,
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
                      textCapitalization: TextCapitalization.characters,
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
                      textCapitalization: TextCapitalization.words,
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
                          savestudent(context);
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
  savestudent(context) {
    final name = nameController.text.trim();
    final batch = batchController.text.trim();
    final domain = domainController.text.trim();

    if (formkey.currentState!.validate()) {
      final student = StudentModel(
          name: name, batch: batch, domain: domain, image: imagefile!.path);

      studentController.addStudent(student);

      Get.back();
      nameController.text = '';
      batchController.text = '';
      domainController.text = '';
    }
  }

  Future<void> uploadImage() async {
    var pickedFile = await imgpicker.pickImage(source: ImageSource.gallery);
    if(pickedFile!=null){
      imagefile = pickedFile;
      imagefileobs.value = imagefile!.path;
    }
  }
}
