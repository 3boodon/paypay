import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:paypay/BackEnd/Models/models.dart';
import 'package:paypay/BackEnd/services/models_services.dart';
import 'package:paypay/FrontEnd/screens/SpendingsScreens/spendings_list.dart';

import 'package:paypay/FrontEnd/widgets/header.dart';
import '../../../FrontEnd/widgets/search_input.dart';
import '../../../FrontEnd/widgets/new_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SpendingsScreen extends StatefulWidget {
  // This is the Route Name that We Are going to use whenever we need to navigate to this page
  static String routeName = '/SpendingsScreen';

  @override
  _SpendingsScreenState createState() => _SpendingsScreenState();
}

class _SpendingsScreenState extends State<SpendingsScreen> {
  @override
  void initState() {
    Hive.openBox(spendingBoxName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NewPage(
      children: [
        Header(
          date: Hive.box(userDataBoxName).get(userDataKeyName)["signUpDate"],
          title: "Spendings",
        ),

        const Spacer(
          flex: 1,
        ),
        const SearchInput(
          placeHolder: "Search Spendings",
          alignLeft: true,
          type: TextInputType.text,
        ),
        // SpendingsListView(),
        Expanded(
          flex: 20,
          child: ValueListenableBuilder<Box<dynamic>>(
            valueListenable: Hive.box(spendingBoxName).listenable(),
            builder: (context, value, _) {
              return SpendingsList(
                  spendings: value.values
                          .map((e) {
                            return Spending.fromJson(
                                Map<String, dynamic>.from(e));
                          })
                          .toList()
                          .cast<Spending>() ??
                      []);
            },
          ),
        ),
      ],
    );
  }
}
