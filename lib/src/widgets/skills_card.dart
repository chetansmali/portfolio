import 'package:flutter/material.dart';
import 'package:hrushikesh_portfolio/src/controllers/core/provider.dart';
import 'package:hrushikesh_portfolio/src/controllers/data_controller.dart';
import 'package:hrushikesh_portfolio/src/data/skill.dart';
import 'package:hrushikesh_portfolio/src/utils/responsive_util.dart';
import 'package:hrushikesh_portfolio/src/widgets/accent_widget.dart';

class SkillsCard extends StatelessWidget {
  const SkillsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataController = Provider.of<DataController>(context);
    return Card(
      child: StreamBuilder(
        stream: dataController.state,
        builder: (context, snapshot) {
          final skills = dataController.skills;
          return AnimatedContainer(
            duration: Duration(milliseconds: 350),
            width: double.infinity,
            padding: EdgeInsets.all(Responsive.maxMainSpacing(context) * 1.333),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Skills",
                  style: Responsive.mainHeadline(context),
                ),
                SizedBox(height: Responsive.maxSmallSpacing(context)),
                AccentWidget(),
                SizedBox(height: Responsive.maxSmallSpacing(context)),
                Column(
                  children: skills.map((e) => _SkillItem(skillData: e)).toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _SkillItem extends StatelessWidget {
  const _SkillItem({required this.skillData});

  final SkillData skillData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 36,
            height: 36,
            child: Image.asset(
              skillData.techLogoPath,
              width: 36,
              height: 36,
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
                  skillData.name,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(height: Responsive.maxSmallSpacing(context) / 2),
                Text(
                  skillData.description,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
