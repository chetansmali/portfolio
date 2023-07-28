import 'package:flutter/material.dart';
import 'package:hrushikesh_portfolio/theme.dart';

class BadgeProfile extends StatelessWidget {
  const BadgeProfile(this.text, {Key? key, this.padding}) : super(key: key);

  final String text;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      padding: padding ?? EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: backgroundOnCard(context),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: theme.caption,
      ),
    );
  }
}
