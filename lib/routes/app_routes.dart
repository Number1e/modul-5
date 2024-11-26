import 'package:get/get.dart';
import '../pages/home_page.dart';

class AppRoutes {
  static const home = '/home';

  static List<GetPage> pages = [
    GetPage(
      name: home,
      page: () => HomePage(),
    ),
  ];
}
