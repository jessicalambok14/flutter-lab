import 'package:flutter/material.dart';
import 'package:assignmentpbp/main.dart';
import 'package:assignmentpbp/input.dart';

class MyBuilder extends StatefulWidget {
  const MyBuilder({super.key});
  static List<List> data = [];

  @override
  State<MyBuilder> createState() => _MyBuilderState();

  static void addList(List temp) {
    MyBuilder.data.add(temp);
  }
}

class _MyBuilderState extends State<MyBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Budget'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('Counter'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Form Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyFormPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyBuilder()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      MyBuilder.data[index][0],
                      style: const TextStyle(fontSize: 24),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          MyBuilder.data[index][1].toString(),
                          style: const TextStyle(fontSize: 24),
                        ),
                        Text(
                          MyBuilder.data[index][2],
                          style: const TextStyle(fontSize: 24),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: MyBuilder.data.length),
    );
  }
}
