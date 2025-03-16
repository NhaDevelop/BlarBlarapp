import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';

import '../../../theme/theme.dart';
import '../../ride_pref/widgets/ride_pref_form.dart';
// Adjust the path as necessary

class RidePrefModal extends StatefulWidget {
  RidePrefModal({super.key, required this.currentPreference, required this.onUpdate});

  final RidePreference currentPreference;
  final void Function(RidePreference) onUpdate;

  @override
  State<RidePrefModal> createState() => _RidePrefModalState();
}

class _RidePrefModalState extends State<RidePrefModal> {
  void onBackSelected() {
    Navigator.of(context).pop();
  }

  void _onSubmit(dynamic newPreference) {
    widget.onUpdate(newPreference as RidePreference); // Notify parent widget of the new preference

    Navigator.pop(context, newPreference);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            left: BlaSpacings.m, right: BlaSpacings.m, top: BlaSpacings.s),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back icon
            IconButton(
              onPressed: onBackSelected,
              icon: Icon(Icons.close),
            ),
            SizedBox(height: BlaSpacings.m),

            // Title
            Text("Edit your search",
                style: BlaTextStyles.heading.copyWith(color: BlaColors.textNormal)),
            SizedBox(height: BlaSpacings.m),

            // Form
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: RidePrefForm(
                  initialPreference: widget.currentPreference,
                  onSubmit: _onSubmit,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
