import 'package:flutter/material.dart';
import 'package:hrushikesh_portfolio/theme.dart';

class AccentWidget extends StatelessWidget {
  const AccentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: 48,
      decoration: BoxDecoration(
        color: accentColor(context),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
