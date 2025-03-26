import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Inch Centi Converter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _centi = 0.0;
  double _inch = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('インチ'),
            TextField(
              onChanged: (String value) {
                setState(() {
                  _centi = (double.tryParse(value) ?? 0.0) * 2.54;
                });
              },
            ),
            SizedBox(height: 16),
            Text('結果: ${_centi}センチ'),
            SizedBox(height: 32),
            Text('センチ'),
            TextField(
              onChanged: (String value) {
                setState(() {
                  _inch = (double.tryParse(value) ?? 0.0) / 2.54;
                });
              },
            ),
            SizedBox(height: 16),
            Text('結果: ${_inch}インチ'),
          ],
        ),
      ),
    );
  }
}
