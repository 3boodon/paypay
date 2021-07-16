import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:paypay/BackEnd/Models/models.dart';
import 'package:paypay/BackEnd/services/models_services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:paypay/FrontEnd/constants/constants.dart';
import 'package:paypay/FrontEnd/constants/useful_functions.dart';
import 'package:paypay/FrontEnd/responsive/UI/device_data.dart';
import 'package:paypay/FrontEnd/screens/DebtsScreens/add_debt_screen.dart';
import 'package:paypay/FrontEnd/screens/DebtsScreens/debt_screen.dart';
import 'package:paypay/FrontEnd/screens/PurchasesScreens/add_purchase_screen.dart';
import 'package:paypay/FrontEnd/screens/PurchasesScreens/purchases_screen.dart';
import 'package:paypay/FrontEnd/screens/SpendingsScreens/add_spending_page.dart';
import 'package:paypay/FrontEnd/screens/SpendingsScreens/spendings_screen.dart';
import '../../widgets/new_page.dart';
import '../../widgets/header.dart';
import './components/small_card.dart';
import './components/big_card.dart';

class HomeScreen extends StatefulWidget {
  static String routeName =
      '/HomeScreen'; // This is the Route Name that We Are going to use whenever we need to navigate to this page

  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var formatNumber = NumberFormat("###.0#", "en_US");
  @override
  Widget build(BuildContext context) {
    UserData data = UserData.fromJSON(Map<String, dynamic>.from(
        Hive.box(userDataBoxName).get(userDataKeyName)));

    return NewPage(
      // This is a custome widget
      children: [
        // This Is The Header kinda like the AppBar
        Header(
          isHome: true,
          date: null,
        ),

        // The Budget of the user
        DeviceData(
          builder: (context, device) => Container(
            height: device.screenHeight * .66,
            child: ListView(
              physics: BouncingScrollPhysics(),
              clipBehavior: Clip.antiAlias,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .2,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Budget",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.07,
                              height: .3),
                        ),

                        // budget
                        ValueListenableBuilder<Box<dynamic>>(
                          valueListenable:
                              Hive.box(userDataBoxName).listenable(),
                          builder: (context, value, _) {
                            UserData data2 = UserData.fromJSON(
                                Map<String, dynamic>.from(
                                    value.get(userDataKeyName)));
                            return AutoSizeText(
                              smartNumber(data2.budget),
                              maxLines: 1,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.13),
                            );
                          },
                        ),

                        /// date
                        Text(
                          "Last Update on ${data.signUpDate}",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035,
                              height: .3),
                        ),
                      ],
                    ),
                  ),
                ),
                // This Row Contains Both Spendings & Purchases Cards
                DeviceData(builder: (context, device) {
                  double aspectRatio =
                      (device.screenWidth / device.screenHeight);
                  return Container(
                    margin: EdgeInsets.only(bottom: device.screenHeight * .03),
                    height: getHeightBasedOnAspectRatio(
                        aspectRatio,
                        device.screenHeight -
                            MediaQuery.of(context).padding.top),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Spendings Card
                        ValueListenableBuilder<Box<dynamic>>(
                          valueListenable:
                              Hive.box(userDataBoxName).listenable(),
                          builder: (context, value, _) {
                            return SmallCard(
                              date: data.signUpDate,
                              title: "Spendings",
                              spentMoney: Map<String, dynamic>.from(
                                  value.get(userDataKeyName))["totalSpendings"],
                              onButtonPressed: () {
                                Get.toNamed(NewSpendingScreen.routeName);
                              },
                              onCardPressed: () {
                                Get.toNamed(SpendingsScreen.routeName);
                              },
                            );
                          },
                        ),

                        //Purchases Card
                        ValueListenableBuilder<Box<dynamic>>(
                          valueListenable:
                              Hive.box(userDataBoxName).listenable(),
                          builder: (context, value, _) {
                            return SmallCard(
                              date: data.signUpDate,
                              title: "Purchases",
                              spentMoney: Map<String, dynamic>.from(
                                  value.get(userDataKeyName))["totalPurchases"],
                              onButtonPressed: () {
                                Get.toNamed(NewPurchaseScreen.routeName);
                              },
                              onCardPressed: () {
                                Get.toNamed(PurchasesScreen.routeName);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }),

                // Debts Card
                Container(
                  child: ValueListenableBuilder<Box<dynamic>>(
                    valueListenable: Hive.box(userDataBoxName).listenable(),
                    builder: (context, value, _) {
                      return BigCard(
                        debt: Map<String, dynamic>.from(
                            value.get(userDataKeyName))["totalDebts"],
                        onButtonPressed: () {
                          Get.toNamed(NewDebtScreen.routeName);
                        },
                        onCardPressed: () {
                          Get.toNamed(DebtScreen.routeName);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
