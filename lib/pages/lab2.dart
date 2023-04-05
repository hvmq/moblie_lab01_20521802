import 'package:flutter/material.dart';

class Lab2 extends StatefulWidget {
  const Lab2({super.key});

  @override
  State<Lab2> createState() => _Lab2State();
}

class _Lab2State extends State<Lab2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile Lab02'),
        backgroundColor: Color.fromARGB(255, 5, 112, 199),
      ),
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
        Text('Full Name', style: TextStyle(fontSize: 20),),
        SizedBox(height: 10,),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Please enter full name',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),        
        ),
        SizedBox(height: 10,),
       Text('Gross Salary', style: TextStyle(fontSize: 20),),
        SizedBox(height: 10,),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Please enter gross salary',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),        
        ),
      ],
      ),
    );
  }
}
