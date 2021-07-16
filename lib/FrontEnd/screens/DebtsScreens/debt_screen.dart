import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:paypay/BackEnd/Models/models.dart';
import 'package:paypay/BackEnd/services/models_services.dart';
import 'package:paypay/FrontEnd/screens/DebtsScreens/debts_list.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:paypay/FrontEnd/widgets/header.dart';
import '../../../FrontEnd/widgets/search_input.dart';

import '../../../FrontEnd/widgets/new_page.dart';

class DebtScreen extends StatelessWidget {
  // This is the Route Name that We Are going to use whenever we need to navigate to this page
  static String routeName = '/DebtScreen';

  @override
  Widget build(BuildContext context) {
    return NewPage(
      children: [
        Header(
          date: Hive.box(userDataBoxName).get(userDataKeyName)["signUpDate"],
          title: "Debts",
        ),
        const Spacer(
          flex: 1,
        ),
        const SearchInput(
          placeHolder: "Search Debts",
          alignLeft: true,
          type: TextInputType.text,
        ),
        Expanded(
          flex: 20,
          child: ValueListenableBuilder<Box<dynamic>>(
            valueListenable: Hive.box(debtBoxName).listenable(),
            builder: (context, value, _) {
              return DebtsList(
                  debts: value.values
                          .map((e) {
                            return Debt.fromJson(Map<String, dynamic>.from(e));
                          })
                          .toList()
                          .cast<Debt>() ??
                      []);
            },
          ),
        ),
      ],
    );
  }
}
