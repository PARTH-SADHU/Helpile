import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(
      {super.key, required this.title, this.action, this.onPressed});

  final String title;
  final String? action;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
          fontSize: 22,),
        ),
        if (action != null)
          TextButton(
              onPressed: onPressed,
              child: Text(
                action!,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline),
              ))
      ],
    );
  }
}
