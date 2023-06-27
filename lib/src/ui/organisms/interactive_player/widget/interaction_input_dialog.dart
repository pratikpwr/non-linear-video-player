import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../entities/interaction_entity.dart';

void interactionInputDialog(
  BuildContext context, {
  required InteractiveEntity res,
  required Function(InteractiveEntity) onSelect,
}) {
  if (context.hasActiveDialog) {
    Navigator.of(context).pop();
  }
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Choose your option'),
        content: Text(res.question ?? ''),
        actions: List.generate(
          res.options.length,
          (index) {
            return TextButton(
              onPressed: () {
                onSelect(res.options[index]);
                Navigator.of(context).pop();
              },
              child: Text(res.options[index].title),
            );
          },
        ),
      );
    },
  );
}
