import 'package:flutter/material.dart';
import 'package:hrushikesh_portfolio/src/pages/routes/contact.dart';
import 'package:hrushikesh_portfolio/src/pages/routes/experience.dart';
import 'package:hrushikesh_portfolio/src/pages/routes/portfolio.dart';
import 'package:hrushikesh_portfolio/src/widgets/about_card.dart';
import 'package:hrushikesh_portfolio/src/widgets/profile_card.dart';
import 'package:hrushikesh_portfolio/src/widgets/skills_card.dart';
import 'package:rive/rive.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          ProfileCard(),
          AboutCard(),
          Experience(),
          Portfolio(),
          SkillsCard(),
          Contact(),
        ],
      ),
    );
  }
}
