import 'package:flutter/material.dart';

void showError(String message, BuildContext context ) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Theme.of(context).errorColor,
    )
  );
}