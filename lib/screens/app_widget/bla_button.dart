import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

class BlaButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final IconData? icon;

  // Constructor to initialize the button's properties
  const BlaButton({
    super.key, 
    required this.text,
    required this.onPressed, 
    this.isPrimary = true, 
    this.icon, //opating icon
  });

  @override
  Widget build(BuildContext context) {
    // Check if the button is primary
    return isPrimary
        ? ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: BlaColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // Rounded corners
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24), // Button padding
            ),
            // Set the button's child widget to display the text
            child: Text(
              text,
              style: TextStyle(color: BlaColors.white, fontSize: 16), // Text style
            ),
          )
        : TextButton.icon(
         
            onPressed: onPressed,
           
            icon: Icon(icon, color: BlaColors.primary),
            // Set the button's label widget to display the text
            label: Text(
              text,
              style: TextStyle(color: BlaColors.primary, fontSize: 16), // Text style
            ),
          );
  }
}
