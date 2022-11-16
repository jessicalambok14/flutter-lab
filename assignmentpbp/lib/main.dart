import 'package:flutter/material.dart';
import 'package:assignmentpbp/input.dart';
import 'package:assignmentpbp/builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  final String title = "Counter_7";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Kondisi text saat counter ganjil atau genap
              _counter % 2 == 1
                  ? const Text(
                      'GANJIL',
                      style: TextStyle(color: Colors.blue),
                    )
                  : const Text(
                      'GENAP',
                      style: TextStyle(color: Colors.red),
                    ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: Stack(
          children: <Widget>[
            Positioned(
              right: 10,
              bottom: 10,
              child: FloatingActionButton(
                heroTag: null,
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ),
            // Counter decrement hanya akan ada saat counter > 0
            if (_counter > 0)
              Positioned(
                left: 40,
                bottom: 10,
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: _decrementCounter,
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
              ),
          ],
        ));
  }
}
