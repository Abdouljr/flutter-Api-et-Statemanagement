// ignore_for_file: void_checks

import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: constant_identifier_names
enum ConterEvent { INCREMENT, DECREMENT, MULTIPLICATION }

class ConterBloc extends Bloc<ConterEvent, int> {
  ConterBloc() : super(0) {
    on<ConterEvent>((event, emit) {
      switch (event) {
        case ConterEvent.DECREMENT:
          emit(state - 1);
          break;
        case ConterEvent.INCREMENT:
          emit(state + 1);
          break;
       
        case ConterEvent.MULTIPLICATION:
         emit(state * 2);
          break;
      }
    });
  }
}
