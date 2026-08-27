import 'package:flutter/animation.dart';

/// Duraciones y curva por defecto para animaciones,
/// según sección 1.5 de guia-coherencia-desarrollo.md.
class AppDurations {
  AppDurations._();

  static const fast = Duration(milliseconds: 150);
  static const medium = Duration(milliseconds: 250);
  static const slow = Duration(milliseconds: 400);
  static const defaultCurve = Curves.easeInOutCubic;
}