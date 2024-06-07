import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
  appBar: AppBar(
        elevation: 5,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search))
        ],
        centerTitle: true,
        title: const Text('Students'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(thickness: 1,),
        itemCount: 10,
        itemBuilder: (context,index){
        return  Padding(
          padding: const EdgeInsets.only(left: 10),
          child: ListTile(
            onTap: (){
              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsPage(studentModel: studentProvider.studentList[index],)));
            },
            title:  const Text('studentProvider.studentList[index].name'),
            leading: const CircleAvatar(),
            subtitle:  const Text('studentProvider.studentList[index].batch'),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton.extended(label: const Row(
        children: [
          Text('Add'),
          Icon(Icons.add)
        ],
      ),
        onPressed: (){
        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Register()));
      }),
    );
  }
}