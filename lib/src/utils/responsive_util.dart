import 'package:flutter/material.dart';

class Responsive {
  static Size _getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double maxContainerWidth(BuildContext context, double width) {
    return MediaQuery.of(context).size.width >= width ? width : double.infinity;
  }

  static double maxMainSpacing(BuildContext context) {
    return widthIsSmallerThan(context, 680) ? 12 : 24;
  }

  static double maxLargeSpacing(BuildContext context) {
    return maxMainSpacing(context) * 1.333;
  }

  static double maxSmallSpacing(BuildContext context) {
    return maxMainSpacing(context) * 0.75;
  }

  static double maxSquareSize(BuildContext context) {
    return widthIsSmallerThan(context, 680) ? 72 : 128;
  }

  static bool widthIsHigherThan(BuildContext context, double width) {
    return MediaQuery.of(context).size.width >= width;
  }

  static bool widthIsSmallerThan(BuildContext context, double width) {
    return MediaQuery.of(context).size.width <= width;
  }

  static TextStyle? mainHeadline(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return widthIsSmallerThan(context, 680) ? theme.headline6 : theme.headline5;
  }

  static TextStyle? subHeadline(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final style = theme.headline6!.copyWith(
      color: theme.bodySmall!.color,
    );
    return widthIsSmallerThan(context, 540)
        ? style.copyWith(
            fontSize: 14,
          )
        : style;
  }

  static bool isMediumScreenOrSmaller(BuildContext context) {
    return _getSize(context).width <= 580;
  }

  static bool isVerySmall(BuildContext context) {
    return _getSize(context).width <= 400;
  }

  static bool isExtremelySmall(BuildContext context) {
    return _getSize(context).width <= 340;
  }
}
