import 'package:flutter/material.dart';
import 'package:kan_lazim/core/extensions.dart';
import 'package:kan_lazim/core/padding_borders.dart';

Container bloodTopContainer({required BuildContext context, required Widget child}) {
  return Container(
    alignment: Alignment.center,
    height: context.deviceHeight * 0.22,
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        color: Color(0xffe8315b)),
    child: Row(
      children: [
        child,
        const Padding(
          padding: PaddingBorderConstant.paddingOnlyRightHigh,
          child: Icon(
            Icons.water_drop_rounded,
            color: Colors.white,
            size: 60,
          ),
        )
      ],
    ),
  );
}
