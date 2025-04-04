import 'dart:math';
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
      home: NumberGuessGame(),
    );
  }
}

class NumberGuessGame extends StatefulWidget {
  const NumberGuessGame({super.key});

  @override
  State<NumberGuessGame> createState() => _NumberGuessGameState();
}

class _NumberGuessGameState extends State<NumberGuessGame> {
  int _numberToGuess = Random().nextInt(100) + 1;
  String _message = '私が思い浮かべている数字はなんでしょうか？（1〜100）';
  final TextEditingController _controller = TextEditingController();
  int _count = 0;

  void _guessNumber() {
    int? userGuess = int.tryParse(_controller.text);

    if (userGuess == null || userGuess <= 0 || userGuess > 100) {
      _message = '1〜100の数字を入力してください';
      setState(() {
        _controller.clear();
      });
      return;
    } else if (userGuess == _numberToGuess) {
      _message = '正解！あなたは$_count回で当てました！新しい数字を思い浮かべます';
      setState(() {
        _controller.clear();
      });
      _numberToGuess = Random().nextInt(100) + 1;
      _count = 0;
      return;
    } else if (userGuess < _numberToGuess) {
      _message = '「$userGuess」は小さすぎます！もっと大きい数字です';
      _count++;
    } else {
      _message = '「$userGuess」は大きすぎます！もっと小さい数字です';
      _count++;
    }

    setState(() {
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('数字当てゲーム')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _message,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'あなたの予想を入力してください'),
              ),
            ),
            ElevatedButton(onPressed: _guessNumber, child: const Text('予想する')),
          ],
        ),
      ),
    );
  }
}
