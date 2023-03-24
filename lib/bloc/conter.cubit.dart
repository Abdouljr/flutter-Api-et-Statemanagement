
import 'package:flutter_bloc/flutter_bloc.dart';

class ConterCubit extends Cubit<int> {
  ConterCubit(int state) : super(state);

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }
}
