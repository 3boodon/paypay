import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:paypay/BackEnd/Models/models.dart';
import 'package:paypay/BackEnd/services/models_services.dart';

class HomeController extends GetxController {
  // Budget
  var budget = 0.toDouble().obs;

  changeBudget() async {
    var box = await Hive.openBox(userDataBoxName);
    var data = UserData.fromJSON(box.get(userDataKeyName));
    budget.value = data.budget;
  }

  // currency
  var currency = "SR".obs;

  changeCurrency(String selectedCurrency) {
    currency.value = selectedCurrency;
  }

  // Purchase
  //total purchases
  var totalPurchasesCost = 0.toDouble();
  updatePurchaseTotal() async {
    var box = await Hive.openBox(userDataBoxName);
    var data = UserData.fromJSON(box.get(userDataKeyName));
    totalPurchasesCost = data.totalPurchases;
    update();
  }

  //purchases list
  List<Purchase> purchasesList = <Purchase>[];
  updatePurchasesList() async {
    await Hive.openBox(purchaseBoxName);

    purchasesList = await ModelsService().getPurchases();
    update();
  }

  // Spendings

  //total spendings
  var totalSpendingsCost = 0.toDouble().obs;
  updateSpendingTotal() async {
    var box = await Hive.openBox(userDataBoxName);
    var data = UserData.fromJSON(box.get(userDataKeyName));
    // totalSpendingsCost.value = data.totalSpendings;
  }

  // spendings list
  List<Spending> spendingsList = <Spending>[].obs;
  updateSpendingsList() async {
    await Hive.openBox(spendingBoxName);

    spendingsList = await ModelsService().getSpendings();
  }

  // Debts
  //total debts
  var totalDebtsCost = 0.toDouble().obs;
  updateDebtsTotal() async {
    var box = await Hive.openBox(userDataBoxName);
    // totalDebtsCost.value = data.totalSpendings;
  }

  //debts List
  List<Debt> debtsList = <Debt>[].obs;
  updateDebtsList() async {
    await Hive.openBox(debtBoxName);
    debtsList = await ModelsService().getDebts();
    // update();
  }

  //Date
  var lastUpdateDate = ''.obs;
  changeLastUpdateDate(String date) {
    lastUpdateDate.value = date;
    // update();
  }
}
