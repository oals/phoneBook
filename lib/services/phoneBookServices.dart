import 'package:phonebook/models/phoneItem.dart';

class phoneBookServices {

  List<phoneBook> phoneBookList = [
    phoneBook(id: 1, name: "오민규", phoneNumber: "010-2424-5353", bookMark: true),
    phoneBook(id: 2, name: "김태균", phoneNumber: "010-5352-6436", bookMark: false),
    phoneBook(id: 3, name: "스꺼러", phoneNumber: "010-6436-7547", bookMark: false),
    phoneBook(id: 4, name: "햄스터", phoneNumber: "010-3263-7447", bookMark: true),
    phoneBook(id: 5, name: "다람쥐", phoneNumber: "010-7547-4574", bookMark: false),
    phoneBook(id: 6, name: "토끼", phoneNumber: "010-6743-7547", bookMark: false),
  ];



  List<phoneBook> getPhoneBookList(){
    return phoneBookList;
  }


}