import 'package:hive/hive.dart';
import 'package:paypay/BackEnd/Models/models.dart';

String userDataBoxName = "UserData";
String userDataKeyName = "UserDataKey";
String purchaseBoxName = "Purchases";
String spendingBoxName = "Spendings";
String debtBoxName = "Debts";

class ModelsService {
  Box _box;
// All About User Data
  Future saveUserDataToHive(UserData userData) async {
    _box = await Hive.openBox(userDataBoxName);
    var map = userData.toMap();
    await _box.put(userDataKeyName, map);

    // for debug
    print('Value of UserDataFromHive is ${_box.get(userDataKeyName)}');
  }

// All About Purchases
  Future savePurchaseToHive(Purchase purchase) async {
    _box = await Hive.openBox(purchaseBoxName);
    var map = purchase.toMap();
    // await _box.putAt(0,map);
    await _box.add(map);

    // for debug
    print('savePurchaseToHive details Heeeere  ${_box.values.toList()}');
  }

  Future<List<Purchase>> getPurchases() async {
    _box = await Hive.openBox(purchaseBoxName);
    List<Purchase> data = _box.values
        .map((e) => Purchase.fromJson(Map<String, dynamic>.from(e)))
        .toList()
        .cast<Purchase>();

    return data;
  }

  void deletePurchases(int index) async {
    _box = await Hive.openBox(purchaseBoxName);
    _box.deleteAt(index);
  }

// All About Spendings
  Future saveSpendingToHive(Spending spending) async {
    _box = await Hive.openBox(spendingBoxName);
    var map = spending.toMap();
    await _box.add(map);

    // for debug
    print('saveSpendingToHive');
  }

  Future<List<Spending>> getSpendings() async {
    _box = await Hive.openBox(spendingBoxName);
    List<Spending> data = _box.values
        .map((e) => Spending.fromJson(Map<String, dynamic>.from(e)))
        .toList()
        .cast<Spending>();
    return data;
  }

  void deleteSpending(int index) async {
    _box = await Hive.openBox(spendingBoxName);
    _box.deleteAt(index);
  }

// All About Debts
  Future saveDebtToHive(Debt debt) async {
    _box = await Hive.openBox(debtBoxName);
    var map = debt.toMap();
    await _box.add(map);

    // for debug
    print('saveDebtToHive');
  }

  Future<List<Debt>> getDebts() async {
    _box = await Hive.openBox(debtBoxName);
    List<Debt> data = _box.values
        .map((e) => Debt.fromJson(Map<String, dynamic>.from(e)))
        .toList()
        .cast<Debt>();
    return data;
  }

  void deleteDebt(int index) async {
    _box = await Hive.openBox(debtBoxName);
    _box.deleteAt(index);
  }
}
