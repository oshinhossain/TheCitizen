import 'package:flutter/material.dart';

Widget appBarTitle({required String title}) {
  return FittedBox(
    child: Text(
      title,
      style: TextStyle(fontSize: 17),
    ),
    fit: BoxFit.cover,
  );
}
