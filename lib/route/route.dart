import 'package:aruna_test/feature/aruna_test/presentation/pages/detailPage.dart';
import 'package:aruna_test/feature/aruna_test/presentation/pages/homePage.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String HOMEPAGE = '/homePage';
  static const String DETAILPAGE = '/detailPage';
}

class RoutingClass {
  static List<GetPage<dynamic>> LISTPAGE = [
    GetPage(name: AppRoutes.HOMEPAGE, page: () => HomePage()),
    GetPage(name: AppRoutes.DETAILPAGE, page: () => DetailPage()),
  ];
}
