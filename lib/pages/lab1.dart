import 'package:flutter/material.dart';

class Lab1 extends StatelessWidget {
  const Lab1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 239, 239),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Row'),
            Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  color: Colors.red,
                ),
                Container(
                  height: 70,
                  width: 70,
                  color: Colors.yellow,
                ),
                Container(
                  height: 70,
                  width: 70,
                  color: Colors.green,
                )
              ],
            ),
            const Text('Column'),
            Column(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  color: Colors.red,
                ),
                Container(
                  height: 70,
                  width: 70,
                  color: Colors.yellow,
                ),
                Container(
                  height: 70,
                  width: 70,
                  color: Colors.green,
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
                  color = Colors.red;
                } else if (index == 1) {
                  color = Colors.yellow;
                } else {
                  color = Colors.green;
                }
                return Container(
                  height: 70,
                  color: color,
                );
              },
            ),
            const Text('Gridview'),
            SizedBox(
              height: 400,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                children: [
                  Container(
                    color: const Color.fromARGB(255, 158, 207, 248),
                    child: const Text('Ô số 1'),
                  ),
                  Container(
                    color: const Color.fromARGB(255, 58, 151, 226),
                    child: const Text('Ô số 2'),
                  ),
                  Container(
                    color: const Color.fromARGB(255, 9, 125, 225),
                    child: const Text('Ô số 3'),
                  ),
                  Container(
                    color: const Color.fromARGB(255, 2, 75, 135),
                    child: const Text('Ô số 4'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
