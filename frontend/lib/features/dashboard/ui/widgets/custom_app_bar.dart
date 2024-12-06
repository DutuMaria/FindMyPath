import 'package:flutter/material.dart';

import '../../../../utils/custom_colors.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    super.key,
    required String title,
    Widget? leadingIcon,
    Widget? actionsIcon,
  }) : super(
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          backgroundColor: CustomColors.primaryPink,
          scrolledUnderElevation: 0,
          leading: leadingIcon ?? const SizedBox(),
          actions: [actionsIcon ?? const SizedBox()],
        );
}
