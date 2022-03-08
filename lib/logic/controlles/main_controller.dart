import 'package:get/get.dart';
import 'package:testgeo/view/screens/category_screen.dart';
import 'package:testgeo/view/screens/favorite_screen.dart';
import 'package:testgeo/view/screens/home_screen.dart';
import 'package:testgeo/view/screens/setting_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    SettingScreen(),
  ].obs;

  final titles = [
    "ICHIRAKO",
    "Categories",
    'Favourites',
    "Settings",
  ].obs;
}
