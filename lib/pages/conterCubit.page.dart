import 'package:application_flutter/bloc/conter.cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConterCubitPage extends StatelessWidget {
  const ConterCubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ConterCubitPage"),
      ),
      body: Center(
          child: BlocBuilder<ConterCubit, int>(
        builder: (context, value) => Text(
          "$value",
          style: const TextStyle(fontSize: 20),
        ),
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<ConterCubit>().decrement();
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<ConterCubit>().increment();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
