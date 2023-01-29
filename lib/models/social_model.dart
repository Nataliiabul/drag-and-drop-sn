import 'package:flutter/material.dart';

class SocialItemModel {
  final String name;
  final String value;
  final IconData icon;
  bool accepting;

  SocialItemModel({
    required this.name,
    required this.value,
    required this.icon,
    this.accepting = false,
  });
}
