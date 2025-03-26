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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  double _height = 0.0;
  double _weight = 0.0;
  double _bmi = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('身長(cm)'),
            TextField(
              onChanged: (value) {
                setState(() {
                  _height = (double.tryParse(value) ?? 0.0) / 100;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text('体重(kg)'),
            TextField(
              onChanged: (value) {
                setState(() {
                  _weight = (double.tryParse(value) ?? 0.0);
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_height <= 0.0 || _weight <= 0.0) {
                  setState(() {
                    _bmi = 0.0;
                  });
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('エラー'),
                        content: Text('身長と体重は0より大きい数字を入力してください'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                  return;
                }

                setState(() {
                  _bmi = _weight / (_height * _height);
                });
              },
              child: Text('計算'),
            ),
            SizedBox(height: 16.0),
            Text('BMI: $_bmi'),
          ],
        ),
        
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
