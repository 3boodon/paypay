/// Packages & Libraries

import 'package:flutter/material.dart';
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
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kTheme,
      title: 'PayPay',
      // defaultTransition: Transition.fadeIn,
      getPages: getAppRoutes(),
      initialRoute: check(),
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
