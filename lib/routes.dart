import 'package:hrushikesh_portfolio/src/pages/home.dart';

var routes = {
  "/about": (_) => const Home(routeIndex: 0),
  "/portfolio": (_) => const Home(routeIndex: 1),
  "/experience": (_) => const Home(routeIndex: 2),
  "/contact": (_) => const Home(routeIndex: 3),
};
