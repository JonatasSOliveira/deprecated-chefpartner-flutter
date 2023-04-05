import 'package:chefpartner_mobile/src/global/navigator_key.dart';
import 'package:flutter/material.dart';

class DialogUtil {
  static void showAlertDialog(String text) {
    showDialog(
      barrierDismissible: false,
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(text),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void showConfirmDialog(String text, Function onConfirm) {
    showDialog(
        barrierDismissible: false,
        context: navigatorKey.currentContext!,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(text),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                  onConfirm();
                },
                child: const Text('Confirmar'),
              ),
            ],
          );
        });
  }
}
