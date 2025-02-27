import 'package:flutter/material.dart';

class BlaButton extends StatelessWidget {
  final String text;
  final bool isPrimary;
  final VoidCallback onPressed;
  final Icon? icon; // Update the type to Icon?

  const BlaButton({
    required this.text,
    required this.isPrimary,
    required this.onPressed,
    this.icon, // Allow null values
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: icon ?? Container(), // Provide a default empty container if icon is null
      label: Text(text),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? Colors.blue : Colors.grey,
      ),
    );
  }
}
