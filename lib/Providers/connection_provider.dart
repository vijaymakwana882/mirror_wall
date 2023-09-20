import 'package:flutter/cupertino.dart';

class ConnectionProvider extends ChangeNotifier {
  bool iConnection = false;

  void ConnectionCheck() {
    iConnection = iConnection;
    notifyListeners();
  }
}
