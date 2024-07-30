
import 'package:flutter/material.dart';
import 'package:phonebook/models/phoneItemInfo.dart';
import 'package:phonebook/services/phoneBookServices.dart';
import 'package:phonebook/widgets/phoneInfoButtonWidget.dart';

class phoneBookInfo extends StatefulWidget {
  final int id;

  phoneBookInfo({Key? key, required this.id}) : super(key: key);

  @override
  State<phoneBookInfo> createState() => _phoneBookInfoState();
}

class _phoneBookInfoState extends State<phoneBookInfo> {

  late phoneItemInfo phoneBookInfo;
  @override
  void initState() {
    super.initState();
     phoneBookInfo = phoneBookServices().getPhoneInfoItem(widget.id);
  }

  void phoneInfoOption(opt) {
    if (opt == 1) {
     print('메시지 클릭');
    } else if (opt == 2) {
      print('통화클릭');
    } else if (opt == 3) {
      print('비디오클릭');
    } else if (opt == 4) {
      print('메일클릭');
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.red,
              child: Center(
                child: ClipOval(
                  child: SizedBox(
                    width: 200,

                    child: Hero(
                      tag: phoneBookInfo.id,
                      child: Image.asset(
                        '../assets/winter.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
                color: Colors.blue,
                child: Row(
                  children: [
                    Expanded(child: Center( child : phoneBookButtonWidget(buttonOpt: 1, buttonNm: "메세지",callback : phoneInfoOption))),
                    Expanded(child: Center( child : phoneBookButtonWidget(buttonOpt: 2, buttonNm: "통화",callback : phoneInfoOption))),
                    Expanded(child: Center( child : phoneBookButtonWidget(buttonOpt: 3, buttonNm: "비디오",callback : phoneInfoOption))),
                    Expanded(child: Center( child : phoneBookButtonWidget(buttonOpt: 4, buttonNm: "Mail",callback : phoneInfoOption))),

                  ],
                ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(color: Colors.green),
          ),
          Flexible(
            flex: 1,
            child: Container(color: Colors.green),
          ),
          Flexible(
            flex: 1,
            child: Container(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
