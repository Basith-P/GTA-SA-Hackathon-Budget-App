import 'package:flutter/material.dart';
import 'package:mymny/src/utils/global_keys.dart';

void showSnackBar(String message) {
  final snackBar = SnackBar(content: Text(message));
  scaffoldMessengerKey.currentState!
    ..clearSnackBars()
    ..showSnackBar(snackBar);
}

void clearSnackBars() => scaffoldMessengerKey.currentState!.clearSnackBars();
