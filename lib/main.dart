/// Packages & Libraries

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:paypay/BackEnd/services/models_services.dart';

/// Local Files Import
import './FrontEnd/constants/constants.dart';

import 'FrontEnd/constants/useful_functions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(userDataBoxName);
  await Hive.openBox(purchaseBoxName);
  await Hive.openBox(spendingBoxName);
  await Hive.openBox(debtBoxName);
  getColors();
  var delegate = await LocalizationDelegate.create(
    basePath: "assets/languages/",
    fallbackLocale: 'en_US',
    supportedLocales: const [
      'en_US',
      "ar",
    ],
  );
  runApp(LocalizedApp(delegate, MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final localizationDelegate = LocalizedApp.of(context).delegate;
    Constants.appLanguageCode = localizationDelegate.currentLocale.languageCode;
    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: GetMaterialApp(
        supportedLocales: localizationDelegate.supportedLocales,
        locale: localizationDelegate.currentLocale,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          localizationDelegate
        ],
        debugShowCheckedModeBanner: false,
        theme: kTheme,
        title: 'PayPay',
        // defaultTransition: Transition.fadeIn,
        getPages: getAppRoutes(),
        initialRoute: check(),
      ),
    );
  }

  @override
  void initState() {
    print(Hive.box(userDataBoxName).get(userDataKeyName));
    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
