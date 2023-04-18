import 'package:flutter/material.dart';

class Lab2 extends StatefulWidget {
  const Lab2({super.key});

  @override
  State<Lab2> createState() => _Lab2State();
}

class _Lab2State extends State<Lab2> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController grossController = TextEditingController();
  final List<persionSalary> _persionSalary = [];
  _netSalary(double grossSalary) {
    double temp = 11000000;
    final gross = grossSalary ?? 0;
    double a = gross - (gross * 0.105);
    if (a <= temp)
      return temp;
    else  if(a > temp){
      double fax = (a - temp) * 0.05;
      return a - fax;
    }
  }

  void _addList() {
    final String fullname = fullnameController.text;
    final double netSalary = _netSalary(double.parse(grossController.text));
    final person = persionSalary(fullname: fullname, netSalary: netSalary);
    setState(() {
      _persionSalary.add(person);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Lab02'),
        backgroundColor: const Color.fromARGB(255, 5, 112, 199),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Full Name',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: fullnameController,
            decoration: InputDecoration(
                hintText: 'Please enter full name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Gross Salary',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: grossController,
            decoration: InputDecoration(
                hintText: 'Please enter gross salary',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _addList();
                    fullnameController.clear();
                    grossController.clear();
                  });
                },
                child: Text('Calc')),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: _persionSalary.length,
                itemBuilder: (context, index) {
                  final person = _persionSalary[index];
                  return ListTile(
                    title:
                        Text('${person.fullname}: ${person.netSalary.toStringAsFixed(0)}'),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class persionSalary {
  String? fullname;
  double netSalary;

  persionSalary({required this.fullname, required this.netSalary});
}
