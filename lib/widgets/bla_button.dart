// TODO Implement this library.
import 'package:flutter/material.dart';

class BlaButton extends StatelessWidget {
  final String text;          // Defines the button label
  final bool isPrimary;       // Defines if the button is primary (blue) or secondary (grey)
  final VoidCallback onPressed;  // Callback function to handle button click

  const BlaButton({
    required this.text,
    this.isPrimary = false,  // Defaults to secondary if not specified
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,  // Calls the function when button is clicked
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? Colors.blue : Colors.grey, // Primary or Secondary color
      ),
      child: Text(text),  // Displays button text
    );
  }
}
