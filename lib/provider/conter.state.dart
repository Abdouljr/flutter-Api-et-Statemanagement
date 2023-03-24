import 'package:flutter/cupertino.dart';

class ConterState extends ChangeNotifier {
  int nombre = 1;
  int resultat = 1;
  void increment() {
    ++nombre;
    notifyListeners();
  }

  void decrement() {
    --nombre;
    notifyListeners();
  }

}
