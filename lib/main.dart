import 'package:flutter/material.dart';
import 'package:hrushikesh_portfolio/routes.dart';
import 'package:hrushikesh_portfolio/src/controllers/contact_controller.dart';
import 'package:hrushikesh_portfolio/src/controllers/core/interface.dart';
import 'package:hrushikesh_portfolio/src/controllers/core/provider.dart';
import 'package:hrushikesh_portfolio/src/controllers/data_controller.dart';
import 'package:hrushikesh_portfolio/src/controllers/theme_controller.dart';
import 'package:hrushikesh_portfolio/src/data/repositories/contact_repository.dart';
import 'package:hrushikesh_portfolio/src/data/repositories/json_repository.dart';
import 'package:hrushikesh_portfolio/src/pages/home.dart';
import 'package:hrushikesh_portfolio/src/pages/routes/not-found.dart';
import 'package:hrushikesh_portfolio/src/widgets/scroll_behavior.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(
    MyApp(
      controllers: [
        ThemeController(),
        DataController(JsonRepository()),
        ContactController(ContactRepository()),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.controllers,
  });

  final List<Controller> controllers;

  ThemeController get themeController {
    return controllers.firstWhere((c) => c is ThemeController) as ThemeController;
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      controllers: controllers,
      child: StreamBuilder(
        stream: themeController.state,
        builder: (context, snapshot) {
          final isDarkMode = themeController.isDarkMode;
          final primary = isDarkMode ? Colors.lightBlue : Colors.lightBlue;
          final cardColor = isDarkMode ? Color(0xff1E1E1F) : Colors.white;
          return MaterialApp(
            title: 'Chetan Mali',
            theme: ThemeData(
              primarySwatch: Colors.lightBlue,
              brightness: isDarkMode ? Brightness.dark : Brightness.light,
              iconTheme: IconThemeData(
                color: primary,
              ),
              scaffoldBackgroundColor: isDarkMode ? Color(0xff121212) : Color.fromARGB(255, 247, 247, 247),
              textTheme: TextTheme(
                button: TextStyle(
                  color: primary,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.all(18)),
                ),
              ),
              cardTheme: CardTheme(
                color: cardColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                  side: BorderSide(width: 1, color: Color(0xff383838).withOpacity(isDarkMode ? 1 : 0.1)),
                ),
                elevation: 0,
                margin: EdgeInsets.all(12),
              ),
              tabBarTheme: TabBarTheme(
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: primary,
                unselectedLabelColor: isDarkMode ? Color.fromARGB(255, 209, 209, 209) : Color.fromARGB(255, 51, 51, 51),
              ),
            ),
            debugShowCheckedModeBanner: false,
            scrollBehavior: CustomScrollBehavior(),
            routes: routes,
            initialRoute: "/about",
            onUnknownRoute: (_) => MaterialPageRoute(builder: (_) => Home(routeChild: NotFoundRoute())),
          );
        },
      ),
    );
  }
}

int getRouteIndex(String name) {
  return routes.keys.toList().indexWhere((x) => x == name);
}
