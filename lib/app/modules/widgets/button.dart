import 'package:flutter/material.dart';

Widget elevatedButton(
    BuildContext context, Text label, void Function() function,
    {double? textSize, Color? color}) {

  return ElevatedButton(
      onPressed: function,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)))),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return Theme.of(context).colorScheme.secondary;
            }
            return color ??
                Theme.of(context)
                    .colorScheme
                    .secondary; // Use the component's default.
          },
        ),
      ),
      child: label
  );
}
