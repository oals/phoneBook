import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phonebook/models/phoneItem.dart';
import 'package:phonebook/services/phoneBookServices.dart';

import '../widgets/phoneBookItemWidget.dart';


class Phonebooklist extends StatefulWidget {

  const Phonebooklist({super.key});



  @override
  State<Phonebooklist> createState() => _PhonebooklistState();
}

class _PhonebooklistState extends State<Phonebooklist> {

  late List<phoneBook> phoneBookItemList = [];
  late List<phoneBook> searchPhoneBookItemList = [];
  bool searchBar = false;

  @override
  void initState() {
    super.initState();
    phoneBookItemList = phoneBookServices().getPhoneBookList();

  }

  void clickSearchBar(chkValue){
    setState(() {
      searchBar = chkValue;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: !searchBar ?AppBar(
        backgroundColor: Colors.black,
        title: Text('연락처',
          style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: 23,
        ),
        ),
      ) : null,
      body: Container(
          padding: EdgeInsets.all(10),
          color: Colors.black,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              GestureDetector(
              onTap: () => clickSearchBar(true),
      child: Container(
        width: double.infinity,
        height: 100, // Adjust as needed
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds:500),
              curve: Curves.easeInOut,
              bottom: !searchBar ? 0 : 30,
              left: 16,
              right: 16,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xff212221),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: !searchBar
                          ? Text('검색', style: TextStyle(color: Colors.grey))
                          : TextFormField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '검색어를 입력하세요',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    if (searchBar)
                      TextButton(
                        onPressed: () => clickSearchBar(false),
                        child: Text('취소', style: TextStyle(color: Colors.blueAccent)),
                      )
                    else
                      Icon(Icons.mic, color: Colors.grey),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
                
                
                
                
                SizedBox(
                  height: 13,
                ),
                Container(
                  child: Row(
                    children: [
                      Icon(Icons.account_circle_sharp,
                      color: Colors.grey,
                      size: 60,),
                      SizedBox(
                        width: 10,
                      ),
                      Text('내 카드',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),)
                    ],
                  ),
                ),

                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 0.4,
                        child: Container(
                          color: Colors.grey,
                        ),
                      );
                    },
                    itemCount: !searchBar ? phoneBookItemList.length : searchPhoneBookItemList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return phoneBookItemWidget(phoneBookItem: !searchBar ? phoneBookItemList[index] : searchPhoneBookItemList[index]);

                    },
                  ),
                ),
              ]
          ),


      )
    );


  }
}

