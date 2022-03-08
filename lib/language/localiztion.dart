import 'package:get/route_manager.dart';
import 'package:testgeo/language/ar.dart';
import 'package:testgeo/language/en.dart';
import 'package:testgeo/language/fr.dart';
import 'package:testgeo/utils/my_string.dart';

class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        frf: fr,
      };
}
