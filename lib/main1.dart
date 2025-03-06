import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
    ),
  );
}

enum CardType { red, blue }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int redTapCount = 0;
  int blueTapCount = 0;

  void _incrementRedTapCount() {
    setState(() {
      redTapCount++;
    });
  }

  void _incrementBlueTapCount() {
    setState(() {
      blueTapCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          StatisticsScreen(
            blueTaps: blueTapCount, 
            redTaps: redTapCount,
            onStatsPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StatisticsPage(
                  redTaps: redTapCount,
                  blueTaps: blueTapCount,
                ),
              ),
            ),
          ),
          ColorTap(
            type: CardType.red,
            onTap: _incrementRedTapCount,
            tapCount: redTapCount,
          ),
          ColorTap(
            type: CardType.blue,
            onTap: _incrementBlueTapCount,
            tapCount: blueTapCount,
          ),
        ],
      ),
    );
  }
}

class ColorTap extends StatelessWidget {
  final CardType type;
  final int tapCount;
  final VoidCallback onTap;

  const ColorTap({
    super.key,
    required this.type,
    required this.tapCount,
    required this.onTap,
  });

  Color get backgroundColor => type == CardType.red ? Colors.red : Colors.blue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 100,
        child: Center(
          child: Text(
            'Taps: $tapCount',
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  final int redTaps;
  final int blueTaps;
  final VoidCallback onStatsPressed;

  const StatisticsScreen({
    super.key,
    required this.redTaps,
    required this.blueTaps,
    required this.onStatsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.bar_chart),
          iconSize: 40,
          onPressed: onStatsPressed,
        ),
        const Text('View Statistics'),
      ],
    );
  }
}
 
class StatisticsPage extends StatelessWidget {
  final int redTaps;
  final int blueTaps;

  const StatisticsPage({
    super.key,
    required this.redTaps,
    required this.blueTaps,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.bar_chart,
              size: 100,    
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            Text(
              'Red Taps: $redTaps',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              'Blue Taps: $blueTaps',
              style: const TextStyle(fontSize: 24),                                       
            ),
          ],
        ),
      ),
    );
  }
}