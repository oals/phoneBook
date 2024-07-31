
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
  late TextEditingController _controller;
  late phoneItemInfo phoneBookInfo;
  @override
  void initState() {
    super.initState();
     phoneBookInfo = phoneBookServices().getPhoneInfoItem(widget.id);
    _controller = TextEditingController(text: phoneBookInfo.phoneMemo);
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
      body: SingleChildScrollView(
        child: Container(
          height: 1400,
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Container(
                  color: Colors.red,
                  child: Column(
                    children: [
                      Center(
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
                    SizedBox(
                      height: 5,
                    ),
                    Text('오민규',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: Colors.white
                      ),
                    ),
                      Text('010-1234-5678',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.white
                        ),)
                    ]
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
              SizedBox(
                height: 5,
              ),
              Flexible(
                flex: 2,
                child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '메모',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: Colors.white
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          controller: _controller,
                          maxLines: null,
                          onChanged: (text) {

                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '메모 입력',
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),

                        ),

                      ),
                    ),
                  ],
                ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                flex: 1,
                child: Container(
                  height: 50,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          children : [
                            Text('발신자 차단',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15,
                                  color: Colors.redAccent
                              ),
                            ),

                          ]
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                flex: 3,
                child: Container(color: Colors.green),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
