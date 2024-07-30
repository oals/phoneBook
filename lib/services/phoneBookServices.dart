
import 'package:phonebook/models/phoneCallHistoryItem.dart';
import 'package:phonebook/models/phoneItem.dart';
import 'package:phonebook/models/phoneItemInfo.dart';

class phoneBookServices {

  List<phoneBook> phoneBookList = [
    phoneBook(id: 1, name: "오민규", phoneNumber: "010-2424-5353", bookMark: true,profileImg: "../assets/winter.jpg"),
    phoneBook(id: 2, name: "김태균", phoneNumber: "010-5352-6436", bookMark: false,profileImg: "../assets/winter.jpg"),
    phoneBook(id: 3, name: "스꺼러", phoneNumber: "010-6436-7547", bookMark: false,profileImg: ""),
    phoneBook(id: 4, name: "햄스터", phoneNumber: "010-3263-7447", bookMark: true,profileImg: "../assets/winter.jpg"),
    phoneBook(id: 5, name: "다람쥐", phoneNumber: "010-7547-4574", bookMark: false,profileImg: ""),
    phoneBook(id: 6, name: "토끼", phoneNumber: "010-6743-7547", bookMark: false,profileImg: "../assets/winter.jpg"),
  ];

  List<phoneCallHistoryItem> phoneCallHistoryList = [
    phoneCallHistoryItem(missedCall: false, callDuration: "15:30", callTime: "00:40"),
    phoneCallHistoryItem(missedCall: true, callDuration: "15:40", callTime: "00:39"),
    phoneCallHistoryItem(missedCall: true, callDuration: "15:50", callTime: "00:38"),
  ];



  List<phoneBook> getPhoneBookList(){
    return phoneBookList;
  }

  phoneItemInfo getPhoneInfoItem(index){

    phoneBook phoneItem = phoneBookList[index];

    phoneItemInfo phoneBookInfoItem = phoneItemInfo(
        id: phoneItem.id,
        phoneMemo: "124124",
        phoneBookItem: phoneItem,
        callHistory: phoneCallHistoryList
    );

    return phoneBookInfoItem;
  }



}