import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../atoms/padding.dart';
import '../entities/interaction_entity.dart';

void interactionInputDialog(
  BuildContext context, {
  required InteractionEntity res,
  required Function(InteractionEntity) onSelect,
}) {
  if (context.hasActiveDialog) {
    Navigator.of(context).pop();
  }
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(res.question ?? '',
                  style: context.textTheme.titleLarge?.copyWith(fontSize: 20)),
              padding12,
              Text('Choose your option', style: context.textTheme.titleMedium),
              padding8,
              ...List.generate(
                res.options.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        onSelect(res.options[index]);
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        res.options[index].title.toUpperCase(),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      );
    },
  );
}
