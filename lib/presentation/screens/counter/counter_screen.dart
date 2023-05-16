import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {

  static const name = 'counter_screen';

  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterScreen'),
      ),
      body: Text('valor: 10', style: Theme.of(context).textTheme.titleLarge),
      floatingActionButton: FloatingActionButton (
        onPressed: (){},
        child: const Icon(Icons.add),
      ),
    );
  }
}
