import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;

showErrorDialog(BuildContext context, String message) {
  return showAlertDialog(context, message, "Error");
}

showInfoDialog(BuildContext context, String message) {
  return showAlertDialog(context, message, "Info");
}

showAlertDialog(BuildContext context, String message, String title) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Widget? checkRouteArg(BuildContext context, dynamic arg, String route) {
  if (arg == null) {
    Future.delayed(Duration.zero).then((_) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
    });
    return Container();
  }

  return null;
}
