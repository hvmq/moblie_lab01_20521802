import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Lab1 extends StatelessWidget {
  const Lab1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Color.fromARGB(255, 239, 239, 239),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Row'),
            Row(
              children: [
                Container(
                  height: 70,
                  width: 40,
                  color: Colors.blue,
                ),
                Container(
                  height: 70,
                  width: 40,
                  color: Colors.red,
                ),
                Container(
                  height: 70,
                  width: 40,
                  color: Colors.black,
                )
              ],
            ),
            const Text('Column'),
            Column(
              children: [
                Container(
                  height: 70,
                  width: 40,
                  color: Colors.blue,
                ),
                Container(
                  height: 70,
                  width: 40,
                  color: Colors.red,
                ),
                Container(
                  height: 70,
                  width: 40,
                  color: Colors.black,
                )
              ],
            ),
            const Text('ListView'),
            
               ListView.builder(
                shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    Color color;
                    if (index == 0) {
                      color = Colors.blue;
                    } else if (index == 1) {
                      color = Colors.red;
                    } else {
                      color = Colors.black;
                    }
                    return Container(
                      height: 20,
                      color: color,
                    );
                  }),
            
          ],
        ),
      ),
    );
  }
}
