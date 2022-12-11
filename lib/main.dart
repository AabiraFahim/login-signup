import 'dart:math';
import 'package:login_signup/view/onboarding/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'Constant/constant.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();


  // Firebase.initializeApp().then((value) {
  //   Get.put(UserController());
  //   Get.put(FacultyController());
  //   Get.put(AdminController());
  //   Get.put(TableController());
  //   Get.put(FacultyTimeTableController());
  // });

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }
  int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Canteen Ordering',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: generateMaterialColor(kButtonColor),
        primaryColor: kButtonColor,
        brightness: Brightness.light,
        primaryColorDark: kBackgroundColor,
        iconTheme: const IconThemeData(
            color: kButtonColor
        ),
        appBarTheme: const AppBarTheme(
            backgroundColor: kBackgroundColor,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(
                color: kButtonColor
            )
        ),
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      home: const Splash(),
    );
  }
}



