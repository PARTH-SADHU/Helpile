import 'package:flutter/material.dart';

enum Services {
  plumbing(
    name: 'Plumbing',
    icon: Icons.plumbing,
  ),
  electrician(
    name: 'Electrician',
    icon: Icons.electric_bolt_rounded,
  ),
  cleaner(
    name: 'Cleaner',
    icon: Icons.clean_hands_outlined,
  );

  final String name;
  final IconData icon;

  const Services({
    required this.name,
    required this.icon,
  });
}
