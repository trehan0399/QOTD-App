import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuoteGeneratorScreen(),
    );
  }
}

class QuoteGeneratorScreen extends StatefulWidget {
  @override
  _QuoteGeneratorScreenState createState() => _QuoteGeneratorScreenState();
}

class _QuoteGeneratorScreenState extends State<QuoteGeneratorScreen> {
  final List<String> _quotes = [
    "The only way to do great work is to love what you do. - Steve Jobs",
    "Innovation distinguishes between a leader and a follower. - Steve Jobs",
    "Life is what happens when you're busy making other plans. - John Lennon",
    "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt",
    "Success is not final, failure is not fatal: It is the courage to continue that counts. - Winston Churchill",
    "You miss 100% of the shots you don't take. - Wayne Gretzky",
    "Believe you can and you're halfway there. - Theodore Roosevelt",
  ];

  String _currentQuote = '';

  @override
  void initState() {
    super.initState();
    _generateRandomQuote();
  }

  void _generateRandomQuote() {
    final random = Random();
    final index = random.nextInt(_quotes.length);
    setState(() {
      _currentQuote = _quotes[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quote Generator'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _currentQuote,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _generateRandomQuote,
                child: Text('Generate New Quote'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}