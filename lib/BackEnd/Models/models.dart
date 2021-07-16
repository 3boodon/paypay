import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class UserData extends HiveObject {
  bool loggedIn;
  String name;
  String signUpDate;
  double budget;
  String currency;
  double totalPurchases;
  double totalSpendings;
  double totalDebts;
  List<int> colors;
  UserData();

  UserData.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      // Sign Up Info
      loggedIn = jsonMap['loggedIn'] ?? '';
      name = jsonMap['name'] ?? "undefiend";
      signUpDate = jsonMap['signUpDate'] ?? "undefined";
      budget = jsonMap['budget'] ?? 0.0;
      currency = jsonMap['currency'] ?? "undefiend";

      // Total
      totalPurchases = jsonMap['totalPurchases'] ?? 0.0;
      totalSpendings = jsonMap['totalSpendings'] ?? 0.0;
      totalDebts = jsonMap['totalDebts'] ?? 0.0;

      // Lists
      colors = jsonMap['colors'] ??
          [
            0xff14c99f,
            0xff25dbb1,
            0xff000000,
            0xffffffff,
            0x25000000,
          ];
    } catch (e) {
      loggedIn = false;
      name = '';
      signUpDate = "";
      budget = 0.0;
      currency = "";
      totalPurchases = 0.0;
      totalSpendings = 0.0;
      totalDebts = 0.0;
      colors = [
        0xff14c99f,
        0xff25dbb1,
        0xff000000,
        0xffffffff,
        0x25000000,
      ];
    }
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["loggedIn"] = loggedIn ?? false;
    map["name"] = name ?? "";
    map["signUpDate"] = signUpDate ?? "";
    map["budget"] = budget ?? 0.0;
    map["currency"] = currency ?? "";
    map["totalPurchases"] = totalPurchases ?? 0.0;
    map["totalSpendings"] = totalSpendings ?? 0.0;
    map["totalDebts"] = totalDebts ?? 0.0;
    map['colors'] = colors ??
        [
          0xff14c99f,
          0xff25dbb1,
          0xff000000,
          0xffffffff,
          0x25000000,
        ];

    return map;
  }
}

// class PayPayColors {
//   PayPayColors();
//   List<int> colors;
//   PayPayColors.fromJSON(Map<String, dynamic> jsonMap) {
//     try {
//       colors = jsonMap['colors'] ??
//           [
//             0xff14c99f,
//             0xff25dbb1,
//             0xff000000,
//             0xffffffff,
//             0x25000000,
//           ];
//     } catch (e) {
//       colors = [
//         0xff14c99f,
//         0xff25dbb1,
//         0xff000000,
//         0xffffffff,
//         0x25000000,
//       ];
//     }
//   }

//   Map<String, dynamic> toMap() {
//     var map = new Map<String, dynamic>();
//     map['colors'] = colors;
//     return map;
//   }
// }

class Purchase {
  Purchase();

  String purchaseName;
  double price;
  String date;

  Purchase.fromJson(Map<String, dynamic> jsonMap) {
    try {
      purchaseName = jsonMap["purchaseName"] != null
          ? jsonMap["purchaseName"]
          : "undefined";
      price = jsonMap["price"] != null ? jsonMap["price"] : 0.0;
      date = jsonMap["date"] != null ? jsonMap["date"] : "undefined";
    } catch (e) {
      purchaseName = "";
      price = 0.0;
      date = "";
      print("error from Purchase Class ===== $e");
    }
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["purchaseName"] = purchaseName;
    map["price"] = price;
    map["date"] = date;
    return map;
  }
}

class Spending {
  Spending();

  String spendingName;
  double cost;
  String date;

  Spending.fromJson(Map<String, dynamic> jsonMap) {
    try {
      spendingName = jsonMap["spendingName"] != null
          ? jsonMap["spendingName"]
          : "undefined";
      cost = jsonMap["cost"] != null ? jsonMap["cost"] : 0.0;
      date = jsonMap["date"] != null ? jsonMap["date"] : "undefined";
    } catch (e) {
      spendingName = "";
      cost = 0.0;
      date = "";
      print("error from Spending Class ===== $e");
    }
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["spendingName"] = spendingName;
    map["cost"] = cost;
    map["date"] = date;
    return map;
  }
}

class Debt {
  Debt();

  String ownerName;
  double debtAmount;
  String debtDate;
  String returnDate;

  Debt.fromJson(Map<String, dynamic> jsonMap) {
    try {
      ownerName =
          jsonMap["ownerName"] != null ? jsonMap["ownerName"] : "undefined";
      debtAmount = jsonMap["debtAmount"] != null ? jsonMap["debtAmount"] : 0.0;
      debtDate =
          jsonMap["debtDate"] != null ? jsonMap["debtDate"] : "undefined";
      returnDate =
          jsonMap["returnDate"] != null ? jsonMap["returnDate"] : "undefined";
    } catch (e) {
      ownerName = "";
      debtAmount = 0.0;
      debtDate = "";
      returnDate = "";
      print("error from Debt Class ===== $e");
    }
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["ownerName"] = ownerName;
    map["debtAmount"] = debtAmount;
    map["debtDate"] = debtDate;
    map["returnDate"] = returnDate;
    return map;
  }
}
