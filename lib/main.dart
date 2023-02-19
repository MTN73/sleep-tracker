import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Sleep Tracker',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  @override
  notifyListeners();
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const OverviewPage();
        break;
      case 1:
        page = const AddPage();
        break;
      case 2:
        page = const StatsPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Overview'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.add_circle_outline),
                    label: Text('Add'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.insights),
                    label: Text('Stats'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    //var appState = context.watch<MyAppState>();

    return Container(
      margin: const EdgeInsets.all(30.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: Colors.orange.shade100,
            elevation: 10.0,
            child: const Padding(
              padding: EdgeInsets.only(
                  left: 60.0, right: 60.0, top: 10.0, bottom: 10.0),
              child: Text("Overview"),
            ),
          ),
        ],
      ),
    );
  }
}

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    //var appState = context.watch<MyAppState>();

    return Container(
      margin: const EdgeInsets.all(30.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment(0.00, 0.00),
            child: Card(
              color: Colors.orange.shade100,
              elevation: 10.0,
              child: const Padding(
                padding: EdgeInsets.only(
                    left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
                child: Text("Add Sleep Activity : "),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    //var appState = context.watch<MyAppState>();

    return Container(
      margin: const EdgeInsets.all(30.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: Colors.orange.shade100,
            elevation: 10.0,
            child: const Padding(
              padding: EdgeInsets.only(
                  left: 60.0, right: 60.0, top: 10.0, bottom: 10.0),
              child: Text("Your Statistics"),
            ),
          ),
        ],
      ),
    );
  }
}
