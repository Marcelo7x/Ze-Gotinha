import 'package:flutter/material.dart';

Widget elevatedButton(BuildContext context, String label,
    void Function() function) {
  
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
            return ThemeData.light()
                .primaryColor; // Use the component's default.
          },
        ),
      ),
      child: Text(label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )));
}
