import 'package:application_flutter/bloc/conter.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConterBlocPage extends StatelessWidget {
  const ConterBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    final conterBloc = context.read<ConterBloc>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ConterBlocPage"),
      ),
      body: Center(child: BlocBuilder<ConterBloc, int>(
        builder: (context, state) {
          return Text(
            "$state",
            style: const TextStyle(fontSize: 20),
          );
        },
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              conterBloc.add(ConterEvent.DECREMENT);
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              conterBloc.add(ConterEvent.INCREMENT);
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
