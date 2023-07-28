import 'package:hrushikesh_portfolio/src/controllers/core/interface.dart';

class ThemeController extends Controller<ThemeController> {
  bool isDarkMode = true;

  @override
  void setState({
    bool? isDarkMode,
  }) {
    this.isDarkMode = isDarkMode ?? this.isDarkMode;

    updateStream(this);
  }

  void toggleTheme() {
    setState(isDarkMode: !isDarkMode);
  }
}
