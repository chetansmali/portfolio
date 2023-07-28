import 'package:flutter/material.dart';
import 'package:hrushikesh_portfolio/src/utils/responsive_util.dart';

class NotFoundRoute extends StatelessWidget {
  const NotFoundRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "That page doesn't exist.",
            style: Responsive.mainHeadline(context),
          ),
          SizedBox(height: 24),
          Text(
            "ERROR 404",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
