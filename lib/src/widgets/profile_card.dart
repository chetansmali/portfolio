import 'package:flutter/material.dart';
import 'package:hrushikesh_portfolio/src/controllers/core/provider.dart';
import 'package:hrushikesh_portfolio/src/controllers/data_controller.dart';
import 'package:hrushikesh_portfolio/src/utils/responsive_util.dart';
import 'package:hrushikesh_portfolio/src/widgets/badge.dart';
import 'package:hrushikesh_portfolio/theme.dart';
import 'package:rive/rive.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dataController = Provider.of<DataController>(context);
    final isExtremelySmall = Responsive.isExtremelySmall(context);
    return Card(
      child: StreamBuilder(
        stream: dataController.state,
        builder: (context, snapshot) {
          final profile = dataController.profileData;
          return AnimatedContainer(
            duration: Duration(milliseconds: 350),
            padding: EdgeInsets.all(Responsive.maxMainSpacing(context) * 1.333),
            child: Row(
              mainAxisAlignment: isExtremelySmall
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                isExtremelySmall
                    ? SizedBox()
                    : AnimatedContainer(
                        duration: Duration(milliseconds: 350),
                        width: Responsive.maxSquareSize(context),
                        height: Responsive.maxSquareSize(context),
                        decoration: BoxDecoration(
                          color: backgroundOnCard(context),
                          border: Border.all(color: Colors.lightBlue,width: 3),
                          borderRadius: BorderRadius.circular(60),
                          image: DecorationImage(
                            image: Image.asset(
                              profile.imagePath,
                              width: Responsive.maxSquareSize(context),
                              height: Responsive.maxSquareSize(context),
                              fit: BoxFit.fill,
                            ).image,
                          ),
                        ),
                      ),
                SizedBox(
                    width: isExtremelySmall
                        ? 0
                        : Responsive.maxMainSpacing(context)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      profile.name,
                      style: Responsive.mainHeadline(context),
                    ),
                    SizedBox(height: Responsive.maxSmallSpacing(context)),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BadgeProfile(profile.role),
                        SizedBox(width: 8),
                        !Responsive.isVerySmall(context)
                            ? SizedBox()
                            : AnimatedContainer(
                                duration: Duration(milliseconds: 350),
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: Image.network(
                                      profile.techLogoUrl,
                                      width: 24,
                                      height: 24,
                                    ).image,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
                isExtremelySmall ? SizedBox() : Spacer(),
                Responsive.isVerySmall(context)
                    ? SizedBox()
                    : AnimatedContainer(
                        duration: Duration(milliseconds: 350),
                        width: Responsive.maxSquareSize(context) * 1,
                        height: Responsive.maxSquareSize(context) * 1,
                        child: RiveAnimation.asset(
                          "assets/rive/badass_grandpa.riv",
                          artboard: "cursor",
                          stateMachines: ['track'],
                        ),
                      ),
                isExtremelySmall ? SizedBox() : Spacer(),
                Responsive.isVerySmall(context)
                    ? SizedBox()
                    : AnimatedContainer(
                        duration: Duration(milliseconds: 350),
                        width: Responsive.maxSquareSize(context) * 0.65,
                        height: Responsive.maxSquareSize(context) * 0.65,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Image.network(
                              profile.techLogoUrl,
                              width: Responsive.maxSquareSize(context) * 0.65,
                              height: Responsive.maxSquareSize(context) * 0.65,
                            ).image,
                          ),
                        ),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
