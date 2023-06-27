import 'package:flutter/material.dart';
import 'package:non_linear_videos/src/app.dart';

import 'src/core/injector/injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}
