import 'dart:math';

import 'package:flutter/material.dart';

Color Kcolor=Colors.blue.shade900;
String getRandomId()
{
  var rng = new Random();
  String randomName="";
  for (var i = 0; i < 20; i++) {
    randomName += rng.nextInt(100).toString();
  }
  return randomName;
}