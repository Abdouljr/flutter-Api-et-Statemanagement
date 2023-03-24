import 'package:application_flutter/provider/conter.state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConterProvider extends StatelessWidget {
  const ConterProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final conterState = Provider.of<ConterState>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ConterProvider"),
      ),
      body: Center(
          child: Consumer<ConterState>(
        builder: (context, value, child) => Text(
          "${value.nombre}",
          style: const TextStyle(fontSize: 20),
        ),
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              conterState.decrement();
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              conterState.increment();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
