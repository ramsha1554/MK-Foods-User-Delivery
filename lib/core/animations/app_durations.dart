import 'package:flutter/material.dart';

abstract final class AppDurations {
  static const Duration instant = Duration(milliseconds: 100);
  static const Duration micro = Duration(milliseconds: 200);
  static const Duration standard = Duration(milliseconds: 300);
  static const Duration emphasis = Duration(milliseconds: 450);
  static const Duration hero = Duration(milliseconds: 600);
}

abstract final class AppCurves {
  static const Curve enter = Curves.easeOutCubic;
  static const Curve exit = Curves.easeInCubic;
  static const Curve inOut = Curves.easeInOutCubic;
  static const Curve spring = Curves.elasticOut;
  static const Curve panel = Curves.decelerate;
}
