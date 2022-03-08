import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:testgeo/language/localiztion.dart';
import 'package:testgeo/routes/routes.dart';
import 'package:testgeo/utils/my_string.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale(GetStorage().read<String>('lang').toString()),
      fallbackLocale: Locale(ene),
      translations: LocaliztionApp(),
      title: 'Ichiraku'.toUpperCase(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: GetStorage().read<bool>("auth") == true
      //     ? MainScreen()
      //     : WelcomeScreen(),
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>("auth") == true
          ? Routes.mainScreen
          : Routes.welcomeScreen,
      getPages: AppRoutes.routes,
    );
  }
}
//
// SHA1: 59:FA:16:DA:36:EA:E8:AE:7A:E6:FF:80:39:11:E2:F9:1E:89:3C:25
// SHA-256: BC:19:A0:6B:C4:CE:61:8B:25:B8:E4:7F:F4:D6:34:8D:09:41:85:F7:66:A9:0F:8A:C3:38:86:78:D1:B2:C8:BF
