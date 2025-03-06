import 'package:flutter/material.dart';


import '../../../theme/theme.dart';
import '../../ride_pref/widgets/ride_pref_form.dart';
import '../../models/ride_preference.dart'; // Adjust the path as necessary

class RidePrefModal extends StatefulWidget {
  RidePrefModal({super.key, required this.currentPreference
      // TODO 7 : We should pass the current prefs to this modal;
      });
  final RidePreference currentPreference;

  @override
  State<RidePrefModal> createState() => _RidePrefModalState();
}

class _RidePrefModalState extends State<RidePrefModal> {
  void onBackSelected() {
    Navigator.of(context).pop();
  }

  void _onSubmit(RidePreference newPreference) {
    // TODO 9 : We should pop this modal, with the new current preference
    setState(() {
      widget.currentPreference.copyFrom(newPreference);
    });

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
              initialPreference: widget.currentPreference
                  .currentPreference, // TODO 7 : The form should be displayed with the modal current prefs
              onSubmit: _onSubmit,
            ),
          )),
        ],
      ),
    ));
  }
}