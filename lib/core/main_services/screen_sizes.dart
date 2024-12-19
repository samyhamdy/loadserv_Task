import 'package:flutter/material.dart';

class Sizes {
  Sizes._();
  static double getHeight(context) => MediaQuery.sizeOf(context).height;
  static double getWidth(context) => MediaQuery.sizeOf(context).width;
}
