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

  @override
  void initState() {
    super.initState();
    phoneBookItemList = phoneBookServices().getPhoneBookList();

  }



  @override
  Widget build(BuildContext context) {

    return Flex(
        direction: Axis.horizontal,
        children: [
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
              itemCount: phoneBookItemList.length,
              itemBuilder: (BuildContext context, int index) {
                return phoneBookItemWidget(phoneBookItem: phoneBookItemList[index]);

              },
          ),
        ),
    ]
    );
  }
}

