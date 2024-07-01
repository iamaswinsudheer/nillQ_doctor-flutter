import 'package:flutter/material.dart';

final textInputDecoration = InputDecoration(
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(
          color: Colors.grey[800]!,
          width: 1.0,
        )),
    focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(
          color: Colors.grey[800]!,
          width: 1.0,
        )),
    errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(
          color: Colors.grey[800]!,
          width: 1.0,
        )),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(
          color: Colors.grey[800]!,
          width: 1.0,
        )));

const Color themeColor = Color.fromARGB(255, 13, 71, 161);

final textInputDecorationWithTheme = InputDecoration(
    fillColor: Colors.grey[100],
    filled: true,
    enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(
          color: themeColor,
          width: 2.0,
        )),
    focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(
          color: themeColor,
          width: 2.0,
        )),
    errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(
          color: themeColor,
          width: 2.0,
        )),
    focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(
          color: themeColor,
          width: 2.0,
        )));

final appbarStyle = TextStyle(
    color: Colors.grey[800], fontSize: 20.0, fontWeight: FontWeight.w500);
