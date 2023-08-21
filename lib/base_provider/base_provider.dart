import 'package:flutter/material.dart';

class BaseMethods {
  final BuildContext context;
  BaseMethods(this.context);

  buildShowDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(color: Colors.red),
        );
      },
    );
  }

}
