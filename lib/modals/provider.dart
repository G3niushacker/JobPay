import 'package:flutter/material.dart';
import 'package:invest/modals/FirebaseServices/Auth.dart';

class Provider extends InheritedWidget {
  final Auth auth;

  Provider({Key key, Widget child, this.auth,}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static Provider of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<Provider>());
}
