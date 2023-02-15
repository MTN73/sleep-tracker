import 'package:flutter/material.dart';

void main() {
  runApp(const SleepTracker());
}

class SleepTracker extends StatelessWidget {
  const SleepTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OverviewPage(),
    );
  }
}

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.amber,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: 250.0,
              color: Colors.lightBlueAccent,
            )
          ],
        ),
      ),
    ));
  }
}