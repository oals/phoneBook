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
        title: Text('연락처',
          style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          fontSize: 23,
        ),),
      ) : null,
      body: Container(
        padding: EdgeInsets.all(10),
        color: Colors.blue,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => {
                  clickSearchBar(true)
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.purple
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.search),
                        SizedBox(width: 8),
                        Expanded(
                          child: !searchBar
                              ? Text('검색')
                              : TextFormField(
                              maxLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '검색어를 입력하세요',
                                hintStyle: TextStyle(color: Colors.white),
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                            ),
                          ),
                        ),
                        if (searchBar)
                          TextButton(
                            onPressed: () => {
                              clickSearchBar(false)
                            },
                            child: Text('취소',
                              style: TextStyle(
                                color: Colors.blueAccent
                              ),
                            ),
                        )
                      ]
                  ),
                ),
              ),

              Expanded(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 1,
                      child: Container(
                        color: Colors.black,
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

