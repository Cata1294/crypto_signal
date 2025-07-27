
// Crypto Signal - Flutter
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(CryptoSignalApp());

class CryptoSignalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Signal',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.blue,
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      home: SignalScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignalScreen extends StatefulWidget {
  @override
  _SignalScreenState createState() => _SignalScreenState();
}

class _SignalScreenState extends State<SignalScreen> {
  String coin = '';
  String direction = '';
  double price = 0.0;
  double tp = 0.0;
  double sl = 0.0;

  final List<String> coins = ['BTC', 'ETH', 'SOL', 'XRP', 'ADA'];

  void generateSignal() {
    final random = Random();
    coin = coins[random.nextInt(coins.length)];
    direction = random.nextBool() ? 'LONG' : 'SHORT';
    price = 100 + random.nextDouble() * 1000;
    if (direction == 'LONG') {
      tp = price * 1.05;
      sl = price * 0.85;
    } else {
      tp = price * 0.95;
      sl = price * 1.15;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    generateSignal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Crypto Signal')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Coin: \$coin', style: TextStyle(fontSize: 24)),
            Text('Direction: \$direction', style: TextStyle(fontSize: 24)),
            Text('Price: \$\${price.toStringAsFixed(2)}', style: TextStyle(fontSize: 20)),
            Text('TP: \$\${tp.toStringAsFixed(2)}', style: TextStyle(color: Colors.green)),
            Text('SL: \$\${sl.toStringAsFixed(2)}', style: TextStyle(color: Colors.red)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: generateSignal,
              child: Text('Generate New Signal'),
            ),
          ],
        ),
      ),
    );
  }
}
