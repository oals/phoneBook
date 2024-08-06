
import 'package:phonebook/models/CallHistory.dart';
import 'package:phonebook/models/phoneBook.dart';
import 'package:phonebook/models/phoneBookInfo.dart';

class phoneBookServices {

 static List<PhoneBook> phoneBookList = [
    PhoneBook(id: 0, name: "오민규", phoneNumber: "010-2424-5353", bookMark: true,profileImg: "../assets/winter.jpg"),
    PhoneBook(id: 1, name: "김태균", phoneNumber: "010-5352-6436", bookMark: false,profileImg: "../assets/winter.jpg"),
    PhoneBook(id: 2, name: "스꺼러", phoneNumber: "010-6436-7547", bookMark: false,profileImg: ""),
    PhoneBook(id: 3, name: "햄스터", phoneNumber: "010-3263-7447", bookMark: true,profileImg: "../assets/winter.jpg"),
    PhoneBook(id: 4, name: "다람쥐", phoneNumber: "010-7547-4574", bookMark: false,profileImg: ""),
    PhoneBook(id: 5, name: "토끼", phoneNumber: "010-6743-7547", bookMark: false,profileImg: "../assets/winter.jpg"),
    PhoneBook(id: 6, name: "스꺼러", phoneNumber: "010-6436-7547", bookMark: false,profileImg: ""),
    PhoneBook(id: 7, name: "햄스터", phoneNumber: "010-3263-7447", bookMark: true,profileImg: "../assets/winter.jpg"),
    PhoneBook(id: 8, name: "다람쥐", phoneNumber: "010-7547-4574", bookMark: false,profileImg: ""),
    PhoneBook(id: 9, name: "토끼", phoneNumber: "010-6743-7547", bookMark: false,profileImg: "../assets/winter.jpg"),
    PhoneBook(id: 10, name: "스꺼러", phoneNumber: "010-6436-7547", bookMark: false,profileImg: ""),
    PhoneBook(id: 11, name: "햄스터", phoneNumber: "010-3263-7447", bookMark: true,profileImg: "../assets/winter.jpg"),
    PhoneBook(id: 12, name: "다람쥐", phoneNumber: "010-7547-4574", bookMark: false,profileImg: ""),
    PhoneBook(id: 13, name: "토끼", phoneNumber: "010-6743-7547", bookMark: false,profileImg: "../assets/winter.jpg"),
  ];

  static List<PhoneCallHistoryItem> phoneCallHistoryList = [
    PhoneCallHistoryItem(missedCall: false, callDuration: "15:30", callTime: "00:40"),
    PhoneCallHistoryItem(missedCall: true, callDuration: "15:40", callTime: "00:39"),
    PhoneCallHistoryItem(missedCall: true, callDuration: "15:50", callTime: "00:38"),
  ];

  static List<PhoneBookInfo> phoneBookinfoList = [
    PhoneBookInfo(id: 0, phoneMemo: "랍온어비트",phoneBookItem: phoneBookList[0],callHistory: phoneCallHistoryList),
    PhoneBookInfo(id: 1, phoneMemo: "",phoneBookItem: phoneBookList[1],callHistory: phoneCallHistoryList),
    PhoneBookInfo(id: 2, phoneMemo: "랍온어비트",phoneBookItem: phoneBookList[2],callHistory: phoneCallHistoryList),
    PhoneBookInfo(id: 3, phoneMemo: "랍온어비트",phoneBookItem: phoneBookList[3],callHistory: phoneCallHistoryList),
    PhoneBookInfo(id: 4, phoneMemo: "랍온어비트",phoneBookItem: phoneBookList[4],callHistory: phoneCallHistoryList),
    PhoneBookInfo(id: 5, phoneMemo: "랍온어비트",phoneBookItem: phoneBookList[5],callHistory: phoneCallHistoryList),
  ];


  List<PhoneBook> getPhoneBookList(){
    return phoneBookList;
  }


  void setPhoneInfoMemo(index,newMemo){
    phoneBookinfoList[index].phoneMemo = newMemo;
  }


  PhoneBookInfo getPhoneInfoItem(index){
    return phoneBookinfoList[index];

  }



}