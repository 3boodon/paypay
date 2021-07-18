import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:paypay/BackEnd/Models/models.dart';
import 'package:paypay/BackEnd/services/models_services.dart';
import 'package:paypay/FrontEnd/constants/useful_functions.dart';
import 'package:paypay/FrontEnd/screens/HomeScreen/home_screen.dart';

addNewPurchse(
    {TextEditingController price,
    TextEditingController purchaseName,
    TextEditingController date}) async {
  //total

  // Save Locally
  Purchase _purchase = Purchase()
    ..price = double.parse(price.text)
    ..purchaseName = purchaseName.text
    ..date = date.text;
  ModelsService().savePurchaseToHive(_purchase);

  UserData s = UserData.fromJSON(Map<String, dynamic>.from(
      Hive.box(userDataBoxName).get(userDataKeyName)));

  s.budget += double.parse(price.text);
  s.totalPurchases += double.parse(price.text);
  s.signUpDate = smartDate(DateTime.now());

  ModelsService().saveUserDataToHive(s);
  // Navigate to Home
  Get.toNamed(HomeScreen.routeName);
}

addNewSpending(
    {TextEditingController price,
    TextEditingController spendingName,
    TextEditingController date}) async {
  // Save Locally
  Spending _spending = Spending()
    ..cost = double.parse(price.text) ?? 20
    ..spendingName = spendingName.text
    ..date = date.text;
  ModelsService().saveSpendingToHive(_spending);

  UserData s = UserData.fromJSON(Map<String, dynamic>.from(
      Hive.box(userDataBoxName).get(userDataKeyName)));

  s.budget -= double.parse(price.text);
  s.totalSpendings += double.parse(price.text);
  s.signUpDate = smartDate(DateTime.now());

  ModelsService().saveUserDataToHive(s);

  Get.toNamed(HomeScreen.routeName);
}

addNewDebt({
  TextEditingController debt,
  TextEditingController ownerName,
  TextEditingController debtDate,
  TextEditingController returnDate,
}) async {
  // Save Locally
  Debt _debt = Debt()
    ..debtAmount = double.parse(debt.text) ?? 20
    ..ownerName = ownerName.text
    ..debtDate = debtDate.text
    ..returnDate = returnDate.text;
  ModelsService().saveDebtToHive(_debt);
  print(ModelsService().getDebts());

  UserData s = UserData.fromJSON(Map<String, dynamic>.from(
      Hive.box(userDataBoxName).get(userDataKeyName)));

  // s.budget += double.parse(debt.text);
  s.totalDebts += double.parse(debt.text);
  s.signUpDate = smartDate(DateTime.now());
  ModelsService().saveUserDataToHive(s);

  Get.toNamed(HomeScreen.routeName);
}

editPurchasePrice(
    {int index, double newPrice, List<Purchase> purchases, String name}) {
  /// Get an instance of the stored user data
  UserData s = UserData.fromJSON(Map<String, dynamic>.from(
      Hive.box(userDataBoxName).get(userDataKeyName)));

  /// Get an instance of the purchase that we wanna edit
  Purchase h = Purchase.fromJson(
      Map<String, dynamic>.from(Hive.box(purchaseBoxName).getAt(index)));

  /// Just to Avoid Null Values
  double newValue = newPrice ?? h.price;
  String newName = name ?? h.purchaseName;

  /// here we are updating the Budget, Total Purchases & Saving the date
  s.totalPurchases -= (h.price) - newValue;
  s.budget += (h.price) - newValue;
  s.signUpDate = smartDate(DateTime.now());

  /// here we are updating the info depending on the user's whishes
  h
    ..price = newValue ?? purchases[index].price
    ..purchaseName = newName;

  /// here we are saving new edits to Hive
  Hive.box(purchaseBoxName).putAt(index, h.toMap());
  ModelsService().saveUserDataToHive(s);

  Get.back();
}

editSpendingPrice(
    {int index, double newCost, List<Spending> spendings, String name}) {
  /// Get an instance of the stored user data
  UserData s = UserData.fromJSON(Map<String, dynamic>.from(
      Hive.box(userDataBoxName).get(userDataKeyName)));

  /// Get an instance of the Spending that we wanna edit
  Spending h = Spending.fromJson(
      Map<String, dynamic>.from(Hive.box(spendingBoxName).getAt(index)));

  /// Just to Avoid Null Values
  double newValue = newCost ?? h.cost;
  String newName = name ?? h.spendingName;

  /// here we are updating the Budget, Total Spendings & Saving the date
  s.totalSpendings -= (h.cost) - newValue;
  s.budget += (h.cost) - newValue;
  s.signUpDate = smartDate(DateTime.now());

  /// here we are updating the info depending on the user's whishes
  h
    ..cost = newValue ?? spendings[index].cost
    ..spendingName = newName;

  /// here we are saving new edits to Hive
  Hive.box(spendingBoxName).putAt(index, h.toMap());
  ModelsService().saveUserDataToHive(s);

  Get.back();
}

editDebt({int index, double newDebt, List<Debt> debts, String ownerName}) {
  /// Get an instance of the stored user data
  UserData s = UserData.fromJSON(Map<String, dynamic>.from(
      Hive.box(userDataBoxName).get(userDataKeyName)));

  /// Get an instance of the Spending that we wanna edit
  Debt h = Debt.fromJson(
      Map<String, dynamic>.from(Hive.box(debtBoxName).getAt(index)));

  /// Just to Avoid Null Values
  double newValue = newDebt ?? h.debtAmount;
  String newName = ownerName ?? h.ownerName;

  /// here we are updating the Budget, Total Spendings & Saving the date
  s.totalDebts -= (h.debtAmount) - newValue;
  s.budget -= (h.debtAmount) - newValue;
  s.signUpDate = smartDate(DateTime.now());

  /// here we are updating the info depending on the user's whishes
  h
    ..debtAmount = newValue ?? debts[index].debtAmount
    ..ownerName = newName;

  /// here we are saving new edits to Hive
  Hive.box(debtBoxName).putAt(index, h.toMap());
  ModelsService().saveUserDataToHive(s);

  Get.back();
}
