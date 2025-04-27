import 'package:relief_fund/pages/homepage.dart';
import 'package:relief_fund/pages/openin.dart';
import 'package:relief_fund/pages/slidepage.dart';

class AppRoutes {
  static final pages = {
    opening: (context) => Opening(),
    slidepages: (context) => SlidePages(),
    home: (context) => const Homepage(),
  };

  static const opening = '/opening';
  static const slidepages = '/slidepages';
  static const home = '/home';
}
