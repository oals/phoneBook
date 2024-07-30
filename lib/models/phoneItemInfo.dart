import 'package:phonebook/models/phoneCallHistoryItem.dart';
import 'package:phonebook/models/phoneItem.dart';

class phoneItemInfo {

  int id;
  String phoneMemo = "";
  phoneBook phoneBookItem;
  List<phoneCallHistoryItem> callHistory = [];

  phoneItemInfo({
    required this.id,
    required this.phoneMemo,
    required this.phoneBookItem,
    required this.callHistory,
  });


}