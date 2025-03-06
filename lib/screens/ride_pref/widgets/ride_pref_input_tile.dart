import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/screens/app_widget/bla_button.dart';
// import 'package:week_3_blabla_project/widgets/actions/bla_icon_button.dart';

import '../../../theme/theme.dart';
// import '../../../widgets/actions/bla_icon_button.dart';

///
/// This tile represents a selectable tile on the Ride Preference screen
///
class RidePrefInputTile extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData leftIcon;

  // If true the text is displayed ligher
  final bool isPlaceHolder;

  // A right button can be optionally provided
  final IconData? rightIcon;
  final VoidCallback? onRightIconPressed;

  const RidePrefInputTile(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.leftIcon,
      this.rightIcon, //   optional
      this.onRightIconPressed, //   optional
      this.isPlaceHolder = false});

  @override
  Widget build(BuildContext context) {
    Color textColor =
        isPlaceHolder ? BlaColors.textLight : BlaColors.textNormal;

    return ListTile(
      onTap: onPressed,
      title: Text(title,
          style: BlaTextStyles.button.copyWith(fontSize: 14, color: textColor)),
      leading: Icon(
        leftIcon,
        // size: BlaSize.iconMedium,
        color: BlaColors.iconLight,
      ),
      trailing: rightIcon != null
          ? BlaButton(
            // size: BlaSize.iconMedium,
              icon: rightIcon,
              onPressed: onRightIconPressed ?? () {},
              text: "helllo",
    )
          : null,
    );
  }
}