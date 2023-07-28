import 'package:flutter/material.dart';
import 'package:hrushikesh_portfolio/src/controllers/core/provider.dart';
import 'package:hrushikesh_portfolio/src/controllers/data_controller.dart';
import 'package:hrushikesh_portfolio/src/controllers/theme_controller.dart';
import 'package:hrushikesh_portfolio/src/pages/routes/about-me.dart';
import 'package:hrushikesh_portfolio/src/pages/routes/contact.dart';
import 'package:hrushikesh_portfolio/src/pages/routes/experience.dart';
import 'package:hrushikesh_portfolio/src/pages/routes/portfolio.dart';
import 'package:hrushikesh_portfolio/src/utils/responsive_util.dart';
import 'package:hrushikesh_portfolio/theme.dart';
import 'package:rive/rive.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Home extends StatefulWidget {
  const Home({
    Key? key,
    this.routeIndex = 0,
    this.routeChild,
  }) : super(key: key);

  final int routeIndex;
  final Widget? routeChild;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool isMobile = false;

  int get routeIndex {
    return widget.routeIndex.clamp(0, 3);
  }

  int selectedMenu = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    checkScreenSize();
    tabController =
        TabController(length: 4, vsync: this, initialIndex: routeIndex);

    Provider.of<DataController>(context).loadAllData();
  }

  void checkScreenSize() {
    setState(() {
      isMobile = MediaQuery.of(context).size.shortestSide < 400;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);
    return StreamBuilder(
      stream: themeController.state,
      builder: (context, snapshot) {
        final isMediumScreenOrSmaller =
            Responsive.isMediumScreenOrSmaller(context);
        return Scaffold(
          body: Stack(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(Responsive.maxLargeSpacing(context)),
                  width: Responsive.maxContainerWidth(context, 800),
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: AboutMe(),
                      ),

                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Responsive.maxLargeSpacing(context)),
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      themeController.toggleTheme();
                    },
                    icon: Icon(
                      themeController.isDarkMode
                          ? Icons.dark_mode
                          : Icons.light_mode,
                    ),
                  ),
                ),
              ),
              // isMobile
              //     ? Container()
              //     : Positioned(
              //   child: Align(
              //     alignment: Alignment.bottomLeft,
              //     child: Padding(
              //       padding: const EdgeInsets.only(top: 5.0),
              //       child: AnimatedContainer(
              //         duration: Duration(milliseconds: 350),
              //         width: Responsive.maxSquareSize(context) * 2,
              //         height: Responsive.maxSquareSize(context) * 3,
              //         child: RiveAnimation.asset(
              //           "assets/rive/hero_background.riv",
              //           artboard: "LadScape",
              //           stateMachines: ['Motion'],
              //         ),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        );
      },
    );
  }
}
