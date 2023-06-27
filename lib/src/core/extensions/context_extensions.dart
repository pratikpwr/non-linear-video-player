import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get screenWidth => mediaQuery.size.width;

  double get screenHeight => mediaQuery.size.height;

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  bool get hasActiveDialog => ModalRoute.of(this)?.isCurrent != true;
}
