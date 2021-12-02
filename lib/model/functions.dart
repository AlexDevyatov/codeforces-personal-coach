import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle getStyle(int rating) {
  if (rating < 1200) {
    return const TextStyle(fontSize: 18, color: Colors.grey);
  }
  if (rating >= 1200 && rating < 1400) {
    return const TextStyle(fontSize: 18, color: Colors.green);
  }
  if (rating >= 1400 && rating < 1600) {
    return const TextStyle(fontSize: 18, color: Colors.cyanAccent);
  }
  if (rating >= 1600 && rating < 1900) {
    return const TextStyle(fontSize: 18, color: Colors.blue);
  }
  if (rating >= 1900 && rating < 2200) {
    return const TextStyle(fontSize: 18, color: Colors.purple);
  }
  if (rating >= 2200 && rating < 2400) {
    return const TextStyle(fontSize: 18, color: Colors.orange);
  }

  return const TextStyle(fontSize: 18, color: Colors.red);
}
