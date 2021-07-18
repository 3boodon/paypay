import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:paypay/BackEnd/services/models_services.dart';
import 'package:paypay/FrontEnd/screens/AuthScreens/sign_in_screen.dart';
import 'package:paypay/FrontEnd/screens/AuthScreens/sign_up_screen.dart';
import 'package:paypay/FrontEnd/screens/DebtsScreens/add_debt_screen.dart';
import 'package:paypay/FrontEnd/screens/DebtsScreens/debt_screen.dart';
import 'package:paypay/FrontEnd/screens/PurchasesScreens/add_purchase_screen.dart';
import 'package:paypay/FrontEnd/screens/PurchasesScreens/purchases_screen.dart';
import 'package:paypay/FrontEnd/screens/SettingsScreen/about_page.dart';
import 'package:paypay/FrontEnd/screens/SettingsScreen/change_colors.dart';
import 'package:paypay/FrontEnd/screens/SettingsScreen/lang_screen.dart';
import 'package:paypay/FrontEnd/screens/SettingsScreen/profile.dart';
import 'package:paypay/FrontEnd/screens/SettingsScreen/reset_page.dart';
import 'package:paypay/FrontEnd/screens/SettingsScreen/settings_page.dart';
import 'package:paypay/FrontEnd/screens/SettingsScreen/share_app_page.dart';
import 'package:paypay/FrontEnd/screens/SettingsScreen/team_page.dart';
import 'package:paypay/FrontEnd/screens/SpendingsScreens/add_spending_page.dart';
import 'package:paypay/FrontEnd/screens/SpendingsScreens/spendings_screen.dart';
import 'package:paypay/FrontEnd/screens/WelcomeScreen/welcome_screen.dart';
import 'package:paypay/FrontEnd/screens/HomeScreen/home_screen.dart';

double getHeightBasedOnAspectRatio(double aspectRatio, height) {
  if (aspectRatio == 0.47337278106508873) {
    return height * .24;
  } else if (aspectRatio == 0.5) {
    print("applied");
    return height * .26;
  } else if (aspectRatio == 0.5633802816901409) {
    print("applied");
    return height * .26;
  } else if (aspectRatio == 0.45) {
    print("applied");
    return height * .22;
  } else if (aspectRatio == 0.5013927576601671) {
    print("applied");
    return height * .25;
  } else if (aspectRatio == 0.5625) {
    return height * .28;
  } else if (aspectRatio == 0.562390158172232) {
    return height * .27;
  } else if (aspectRatio == 0.5622435020519836) {
    return height * .28;
  } else {
    return height * .23;
  }
}

String smartNumber(double number) {
  var numberFormat = NumberFormat(",###");
  return numberFormat.format(number);
}

String smartDate(DateTime date) {
  return DateFormat.yMMMMd().format(date);
}

/// Just to put all defferent Routes in one place
List<GetPage> getAppRoutes() {
  return [
    GetPage(name: HomeScreen.routeName, page: () => HomeScreen()),
    GetPage(name: NewDebtScreen.routeName, page: () => NewDebtScreen()),
    GetPage(name: NewPurchaseScreen.routeName, page: () => NewPurchaseScreen()),
    GetPage(name: NewSpendingScreen.routeName, page: () => NewSpendingScreen()),
    GetPage(name: PurchasesScreen.routeName, page: () => PurchasesScreen()),
    GetPage(name: DebtScreen.routeName, page: () => DebtScreen()),
    GetPage(name: SpendingsScreen.routeName, page: () => SpendingsScreen()),
    GetPage(name: SignInScreen.routeName, page: () => SignInScreen()),
    GetPage(name: SignUpScreen.routeName, page: () => SignUpScreen()),
    GetPage(name: SettingsScreen.routeName, page: () => SettingsScreen()),
    GetPage(name: WelcomeScreen.routeName, page: () => WelcomeScreen()),
    GetPage(name: AboutScreen.routeName, page: () => AboutScreen()),
    GetPage(name: ResetPage.routeName, page: () => ResetPage()),
    GetPage(name: ShareAppScreen.routeName, page: () => ShareAppScreen()),
    GetPage(name: TeamScreen.routeName, page: () => TeamScreen()),
    GetPage(name: LanguageScreen.routeName, page: () => LanguageScreen()),
    GetPage(name: ChangeColorScreen.routeName, page: () => ChangeColorScreen()),
    GetPage(name: Profile.routeName, page: () => Profile()),
  ];
}

String check() {
  var box = Hive.box(userDataBoxName);
  bool loggedIn = box.get(userDataKeyName) != null
      ? box.get(userDataKeyName)["loggedIn"]
      : false;

  if (box.get(userDataKeyName) != null && loggedIn)
    return HomeScreen.routeName;
  else
    return WelcomeScreen.routeName;
}
