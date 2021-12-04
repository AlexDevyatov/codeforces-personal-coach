import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle getHandleStyle(int rating) {
  if (rating < 1200) {
    return const TextStyle(
        fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold);
  }
  if (rating >= 1200 && rating < 1400) {
    return const TextStyle(
        fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold);
  }
  if (rating >= 1400 && rating < 1600) {
    return const TextStyle(
        fontSize: 18, color: Colors.cyanAccent, fontWeight: FontWeight.bold);
  }
  if (rating >= 1600 && rating < 1900) {
    return const TextStyle(
        fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold);
  }
  if (rating >= 1900 && rating < 2200) {
    return const TextStyle(
        fontSize: 18, color: Colors.purple, fontWeight: FontWeight.bold);
  }
  if (rating >= 2200 && rating < 2400) {
    return const TextStyle(
        fontSize: 18, color: Colors.orange, fontWeight: FontWeight.bold);
  }

  return const TextStyle(
      fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold);
}

TextStyle getRankStyle(int rating) {
  if (rating < 1200) {
    return const TextStyle(
        fontSize: 18, color: Colors.grey, fontWeight: FontWeight.normal);
  }
  if (rating >= 1200 && rating < 1400) {
    return const TextStyle(
        fontSize: 18, color: Colors.green, fontWeight: FontWeight.normal);
  }
  if (rating >= 1400 && rating < 1600) {
    return const TextStyle(
        fontSize: 18, color: Colors.cyanAccent, fontWeight: FontWeight.normal);
  }
  if (rating >= 1600 && rating < 1900) {
    return const TextStyle(
        fontSize: 18, color: Colors.blue, fontWeight: FontWeight.normal);
  }
  if (rating >= 1900 && rating < 2200) {
    return const TextStyle(
        fontSize: 18, color: Colors.purple, fontWeight: FontWeight.normal);
  }
  if (rating >= 2200 && rating < 2400) {
    return const TextStyle(
        fontSize: 18, color: Colors.orange, fontWeight: FontWeight.normal);
  }

  return const TextStyle(
      fontSize: 18, color: Colors.red, fontWeight: FontWeight.normal);
}
