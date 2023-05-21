import 'package:flutter/material.dart';
import 'package:flutter_shared_preferences/counter_shared_references.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  int counterValue = 0;

  void getCounterValue() async {
    counterValue = await CounterSharedReferences().getCounter();
    setState(() {});
  }

  @override
  void initState() {
    getCounterValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$counterValue',
              style: const TextStyle(fontSize: 28),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await CounterSharedReferences()
                        .setCounter(counterValue - 1);
                    getCounterValue();
                  },
                  child: const Text(
                    'Decrement',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await CounterSharedReferences()
                        .setCounter(counterValue + 1);
                    getCounterValue();
                  },
                  child: const Text(
                    'Increment',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
