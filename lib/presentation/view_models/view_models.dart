import 'package:flutter/material.dart';

class KeyboardViewModel {
  final String key;
  final bool isClearButton;
  final bool enabled;

  final Color lightColor;
  final Color darkColor;

  KeyboardViewModel({
    required this.key,
    required this.lightColor,
    required this.darkColor,
    this.isClearButton = false,
    this.enabled = true,
  });

  bool get isANumber => int.tryParse(key) != null;
}

final keyboards = [
  KeyboardViewModel(
    key: 'AC',
    lightColor: Colors.greenAccent,
    darkColor: Colors.greenAccent,
    isClearButton: true,
  ),
  KeyboardViewModel(
    key: '+/-',
    lightColor: Colors.greenAccent,
    darkColor: Colors.greenAccent,
    enabled: false,
  ),
  KeyboardViewModel(
    key: '%',
    lightColor: Colors.greenAccent,
    darkColor: Colors.greenAccent,
    enabled: false,
  ),
  KeyboardViewModel(
    key: 'º|º',
    lightColor: Colors.orange,
    darkColor: Colors.orange,
    enabled: false,
  ),
  KeyboardViewModel(
    key: '7',
    lightColor: Colors.black,
    darkColor: Colors.white,
  ),
  KeyboardViewModel(
    key: '8',
    lightColor: Colors.black,
    darkColor: Colors.white,
  ),
  KeyboardViewModel(
    key: '9',
    lightColor: Colors.black,
    darkColor: Colors.white,
  ),
  KeyboardViewModel(
      key: 'x', lightColor: Colors.orange, darkColor: Colors.orange),
  KeyboardViewModel(
    key: '4',
    lightColor: Colors.black,
    darkColor: Colors.white,
  ),
  KeyboardViewModel(
    key: '5',
    lightColor: Colors.black,
    darkColor: Colors.white,
  ),
  KeyboardViewModel(
    key: '6',
    lightColor: Colors.black,
    darkColor: Colors.white,
  ),
  KeyboardViewModel(
      key: '-', lightColor: Colors.orange, darkColor: Colors.orange),
  KeyboardViewModel(
    key: '1',
    lightColor: Colors.black,
    darkColor: Colors.white,
  ),
  KeyboardViewModel(
    key: '2',
    lightColor: Colors.black,
    darkColor: Colors.white,
  ),
  KeyboardViewModel(
    key: '3',
    lightColor: Colors.black,
    darkColor: Colors.white,
  ),
  KeyboardViewModel(
      key: '+', lightColor: Colors.orange, darkColor: Colors.orange),
  KeyboardViewModel(
    key: 'Ω',
    lightColor: Colors.black,
    darkColor: Colors.white,
    enabled: false,
  ),
  KeyboardViewModel(
    key: '0',
    lightColor: Colors.black,
    darkColor: Colors.white,
  ),
  KeyboardViewModel(
    key: '.',
    lightColor: Colors.black,
    darkColor: Colors.white,
    enabled: false,
  ),
  KeyboardViewModel(
    key: '=',
    lightColor: Colors.orange,
    darkColor: Colors.orange,
    enabled: false,
  ),
];
