import 'package:flutter/material.dart';
import 'package:hrushikesh_portfolio/src/data/experience.dart';
import 'package:hrushikesh_portfolio/theme.dart';

import '../utils/responsive_util.dart';

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({super.key, required this.experienceData});

  final ExperienceData experienceData;

  @override
  Widget build(BuildContext context) {
    final isVerySmall = Responsive.isVerySmall(context);
    return Card(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: isVerySmall ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: 56,
                  height: 56,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      experienceData.logoUrl,
                      width: 56,
                      height: 56,
                    ),
                  ),
                ),
                SizedBox(width: Responsive.maxSmallSpacing(context)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        experienceData.clientName,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      SizedBox(height: 8),
                      Text(
                        experienceData.date,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      SizedBox(height: isVerySmall ? 0 : 8),
                      isVerySmall
                          ? SizedBox()
                          : Text(
                              experienceData.summary,
                              style: Theme.of(context).textTheme.caption,
                            ),
                      SizedBox(height: isVerySmall ? 0 : 18),
                      isVerySmall
                          ? SizedBox()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: experienceData.notableTasks.map((e) => _ExperienceTask(name: e.name, description: e.description)).toList(),
                            ),
                    ],
                  ),
                ),
              ],
            ),
            ...isVerySmall
                ? [
                    SizedBox(height: 18),
                    Text(
                      experienceData.summary,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    SizedBox(height: 18),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: experienceData.notableTasks.map((e) => _ExperienceTask(name: e.name, description: e.description)).toList(),
                    ),
                  ]
                : [],
          ],
        ),
      ),
    );
  }
}

class _ExperienceTask extends StatelessWidget {
  const _ExperienceTask({
    required this.name,
    required this.description,
  });

  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      padding: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        border: BorderDirectional(
          start: BorderSide(
            color: accentColor(context).withOpacity(0.6),
            width: 2,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
