
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
   final TextEditingController nameController = TextEditingController();
   final TextEditingController batchController = TextEditingController();
   final TextEditingController domainController = TextEditingController();
  //  late StudentProvider studentProvider;
  @override
  Widget build(BuildContext context) {
    //  studentProvider=Provider.of<StudentProvider>(context) ;
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
                        child:Icon(Icons.add_photo_alternate) ,
                      ),
                      onTap: () {},
                    ),
                    const SizedBox( height: 20),
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
                    const SizedBox( height: 20),
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
                    const SizedBox( height: 20),
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
                    const SizedBox( height: 20),
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
    

    // if (formkey.currentState!.validate()) {
    //   final student = StudentModel(name: name, batch: batch, domain: domain
    //      );
        
    //     studentProvider.addStudent(student);
      
    //   Navigator.of(context).pop();
    //   nameController.text = '';
    //   batchController.text = '';
    //   domainController.text = '';
    // }
  }
}

