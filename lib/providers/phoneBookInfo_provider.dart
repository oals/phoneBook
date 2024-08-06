import 'package:flutter/material.dart';
import 'package:phonebook/models/phoneBookInfo.dart';
import 'package:phonebook/services/phoneBookServices.dart';

class PhonebookinfoProvider with ChangeNotifier{

  late PhoneBookInfo _phoneInfo;

  PhonebookinfoProvider(int id) {
    _phoneInfo = phoneBookServices().getPhoneInfoItem(id);
  }

  PhoneBookInfo get phoneInfo => _phoneInfo;

  void updateMemo(int id,String newMemo) {
    phoneBookServices().setPhoneInfoMemo(id,newMemo);
    phoneBookServices().getPhoneInfoItem(id);
    notifyListeners();
  }

}