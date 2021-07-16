import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:paypay/BackEnd/Models/models.dart';
import 'package:paypay/BackEnd/services/models_services.dart';

import 'package:paypay/FrontEnd/screens/PurchasesScreens/purchase_list.dart';

import 'package:paypay/FrontEnd/widgets/header.dart';

import 'package:paypay/FrontEnd/widgets/search_input.dart';

import '../../../FrontEnd/widgets/new_page.dart';

class PurchasesScreen extends StatelessWidget {
  // This is the Route Name that We Are going to use whenever we need to navigate to this page
  static String routeName = '/PurchasesScreen';

  @override
  Widget build(BuildContext context) {
    return NewPage(
      children: [
        Header(
          date: Hive.box(userDataBoxName).get(userDataKeyName)["signUpDate"],
          title: "Purchases",
        ),
        Spacer(
          flex: 1,
        ),
        SearchInput(
          placeHolder: "Search Purchases",
          alignLeft: true,
          type: TextInputType.text,
          onChange: (value) {},
        ),
        Expanded(
          flex: 20,
          child: ValueListenableBuilder<Box<dynamic>>(
            valueListenable: Hive.box(purchaseBoxName).listenable(),
            builder: (context, value, _) {
              return PurchasesList(
                  purchases: value.values
                          .map((e) {
                            return Purchase.fromJson(
                                Map<String, dynamic>.from(e));
                          })
                          .toList()
                          .cast<Purchase>() ??
                      []);
            },
          ),
        ),
      ],
    );
  }
}
