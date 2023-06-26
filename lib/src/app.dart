import 'package:flutter/material.dart';

import 'features/non_linear_video/domain/entities/interaction_entity.dart';
import 'features/non_linear_video/presentation/screens/interactive_player.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const InteractivePlayer(data: mock),
    );
  }
}
