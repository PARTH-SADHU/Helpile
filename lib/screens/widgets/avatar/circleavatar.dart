import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            backgroundColor: Colors.blue, // Background color of the avatar
            radius: 25, // Radius of the avatar
            child: Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
