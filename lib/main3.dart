
// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

class ColorCounters extends ChangeNotifier {
  int _redTapCount = 0;
  int _blueTapCount = 0;

  int get redTapCount => _redTapCount;
  int get blueTapCount => _blueTapCount;

  void incrementRedTapCount() {
    _redTapCount++;
    notifyListeners();
  }

  void incrementBlueTapCount() {
    _blueTapCount++;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ColorCounters(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Home()),
      ),
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
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    print("Home rebuilt");

    return Scaffold(
      body: _currentIndex == 0 ? ColorTapsScreen() : StatisticsScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.tap_and_play),
            label: 'Taps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
        ],
      ),
    );
  }
}

class ColorTapsScreen extends StatelessWidget {
  const ColorTapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("ColorTapsScreen rebuilt");

    return Scaffold(
      appBar: AppBar(title: Text('Color Taps')),
      body: Column(
        children: [ColorTap(type: CardType.red), ColorTap(type: CardType.blue)],
      ),
    );
  }
}

class ColorTap extends StatelessWidget {
  final CardType type;

  const ColorTap({super.key, required this.type});

  Color get backgroundColor => type == CardType.red ? Colors.red : Colors.blue;

  int getTapCount(ColorCounters counter) {
    return type == CardType.blue ? counter.blueTapCount : counter.redTapCount;
  }

  void onTap(ColorCounters counter) {
    if (type == CardType.blue) {
      counter.incrementBlueTapCount();
    } else {
      counter.incrementRedTapCount();
    }
  }

  @override
  Widget build(BuildContext context) {
    print("ColorTap $type rebuilt");

    return Consumer<ColorCounters>(
      builder: (BuildContext context, ColorCounters counter, Widget? child) {
        print("Consumer Wdiget -  $type rebuilt");

        return GestureDetector(
          onTap: () => {onTap(counter)},
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            height: 100,
            child: Center(
              child: Text(
                'Taps: ${getTapCount(counter)}',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("Statistics Screen rebuilt");


return Scaffold(
      appBar: AppBar(title: const Text('Statistics')),
      body: Center(
        child: Consumer<ColorCounters>(
          builder:
              (context, colorCounter, child) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Red Taps: ${colorCounter.redTapCount}',
                    style: const TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Blue Taps: ${colorCounter.blueTapCount}',
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}