// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:hrushikesh_portfolio/src/data/project.dart';
import 'package:hrushikesh_portfolio/src/utils/responsive_util.dart';
import 'package:hrushikesh_portfolio/src/widgets/badge.dart';
import 'package:hrushikesh_portfolio/theme.dart';
import 'dart:html' as html;

void showProjectDialog(BuildContext context, ProjectData projectData) {
  showDialog(context: context, builder: (_) => _PortfolioItemDialog(projectData: projectData));
}

class _PortfolioItemDialog extends StatelessWidget {
  const _PortfolioItemDialog({
    required this.projectData,
  });

  final ProjectData projectData;

  bool get hasPreviewLink => projectData.previewLink.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        padding: EdgeInsets.all(Responsive.maxMainSpacing(context)),
        width: 480,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  projectData.name,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Spacer(),
                IconButton(
                  onPressed: !hasPreviewLink
                      ? null
                      : () {
                          html.window.open(projectData.previewLink, '');
                        },
                  icon: Icon(
                    Icons.open_in_new,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              projectData.fullDescription,
              style: Theme.of(context).textTheme.caption?.copyWith(
                    height: 1.5,
                  ),
            ),
            SizedBox(height: Responsive.maxSmallSpacing(context)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: projectData.tags
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: BadgeProfile(e),
                        ))
                    .toList(),
              ),
            ),
            SizedBox(height: Responsive.maxSmallSpacing(context)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: borderColor(context), width: 1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  projectData.previewImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
