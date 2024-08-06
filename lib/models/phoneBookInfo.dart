import 'package:phonebook/models/CallHistory.dart';
import 'package:phonebook/models/phoneBook.dart';

class PhoneBookInfo {

  int id;
  String phoneMemo = "";
  PhoneBook phoneBookItem;
  List<PhoneCallHistoryItem> callHistory = [];

  PhoneBookInfo({
    required this.id,
    required this.phoneMemo,
    required this.phoneBookItem,
    required this.callHistory,
  });


}