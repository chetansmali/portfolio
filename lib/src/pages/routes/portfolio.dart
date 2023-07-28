import 'package:flutter/material.dart';
import 'package:hrushikesh_portfolio/src/controllers/core/provider.dart';
import 'package:hrushikesh_portfolio/src/controllers/data_controller.dart';
import 'package:hrushikesh_portfolio/src/utils/responsive_util.dart';
import 'package:hrushikesh_portfolio/src/widgets/portfolio_item.dart';
import 'package:hrushikesh_portfolio/theme.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    final dataController = Provider.of<DataController>(context);
    return SingleChildScrollView(
      primary: true,
      physics: BouncingScrollPhysics(),
      child: Card(
        child: StreamBuilder(
          stream: dataController.state,
          builder: (context, snapshot) {
            final projects = dataController.projects;
            final isMediumScreenOrSmaller = Responsive.isMediumScreenOrSmaller(context);
            return AnimatedContainer(
              duration: Duration(milliseconds: 350),
              width: double.infinity,
              padding: EdgeInsets.all(Responsive.maxMainSpacing(context) * 1.333),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Portfolio",
                    style: Responsive.mainHeadline(context),
                  ),
                  SizedBox(height: Responsive.maxSmallSpacing(context)),
                  Container(
                    height: 6,
                    width: 48,
                    decoration: BoxDecoration(
                      color: accentColor(context),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  SizedBox(height: Responsive.maxSmallSpacing(context)),
                  isMediumScreenOrSmaller
                      ? ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: projects.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 24),
                              child: PortfolioItem(projectData: projects[index]),
                            );
                          },
                        )
                      : GridView.builder(
                          itemCount: projects.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 28,
                            childAspectRatio: 0.9,
                          ),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return PortfolioItem(projectData: projects[index]);
                          },
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
