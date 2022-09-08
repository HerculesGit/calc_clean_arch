import 'package:flutter/material.dart';

class KeyboardViewModel {
  final String key;
  final Color lightColor;
  final Color darkColor;

  KeyboardViewModel(
      {required this.key, required this.lightColor, required this.darkColor});
}

final keyboards = [
  KeyboardViewModel(
      key: 'AC', lightColor: Colors.greenAccent, darkColor: Colors.greenAccent),
  KeyboardViewModel(
      key: '+/-',
      lightColor: Colors.greenAccent,
      darkColor: Colors.greenAccent),
  KeyboardViewModel(
      key: '%', lightColor: Colors.greenAccent, darkColor: Colors.greenAccent),
  KeyboardViewModel(
      key: 'º|º', lightColor: Colors.orange, darkColor: Colors.orange),
  KeyboardViewModel(
      key: '7', lightColor: Colors.black, darkColor: Colors.white),
  KeyboardViewModel(
      key: '8', lightColor: Colors.black, darkColor: Colors.white),
  KeyboardViewModel(
      key: '9', lightColor: Colors.black, darkColor: Colors.white),
  KeyboardViewModel(
      key: 'x', lightColor: Colors.orange, darkColor: Colors.orange),
  KeyboardViewModel(
      key: '4', lightColor: Colors.black, darkColor: Colors.white),
  KeyboardViewModel(
      key: '5', lightColor: Colors.black, darkColor: Colors.white),
  KeyboardViewModel(
      key: '6', lightColor: Colors.black, darkColor: Colors.white),
  KeyboardViewModel(
      key: '-', lightColor: Colors.orange, darkColor: Colors.orange),
  KeyboardViewModel(
      key: '1', lightColor: Colors.black, darkColor: Colors.white),
  KeyboardViewModel(
      key: '2', lightColor: Colors.black, darkColor: Colors.white),
  KeyboardViewModel(
      key: '3', lightColor: Colors.black, darkColor: Colors.white),
  KeyboardViewModel(
      key: '+', lightColor: Colors.orange, darkColor: Colors.orange),
  KeyboardViewModel(
      key: 'Ω', lightColor: Colors.black, darkColor: Colors.white),
  KeyboardViewModel(
      key: '0', lightColor: Colors.black, darkColor: Colors.white),
  KeyboardViewModel(
      key: '.', lightColor: Colors.black, darkColor: Colors.white),
  KeyboardViewModel(
      key: '=', lightColor: Colors.orange, darkColor: Colors.orange),
];
