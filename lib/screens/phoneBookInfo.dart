
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
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: SafeArea(
          child: Container(
            color: Color(0xff212221),
          ),
        ),
      ),
      body:  Container(
          color: Color(0xff212221),
          child: Column(
            children: <Widget>[
              Container(
                child: Flexible(
                  flex: 1,
                  child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: ClipOval(
                              child: SizedBox(
                                width: 100,
                                height: 100,
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
                            height: 10,
                          ),
                          Text('오민규',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                color: Colors.white
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Expanded(child: Center( child : phoneBookButtonWidget(buttonOpt: 1, buttonNm: "메세지",btnColor : Colors.white, callback : phoneInfoOption))),
                                Expanded(child: Center( child : phoneBookButtonWidget(buttonOpt: 2, buttonNm: "통화",btnColor : Colors.white,callback : phoneInfoOption))),
                                Expanded(child: Center( child : phoneBookButtonWidget(buttonOpt: 3, buttonNm: "비디오",btnColor : Colors.grey,callback : phoneInfoOption))),
                                Expanded(child: Center( child : phoneBookButtonWidget(buttonOpt: 4, buttonNm: "Mail",btnColor : Colors.grey,callback : phoneInfoOption))),
                              ],
                            ),
                          ),
                        ]
                    ),
                  ),
                ),
              ),

              Container(
                child: Flexible(
                  flex: 2,
                  child: Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    padding: EdgeInsets.only(top:13,left: 7,right: 7),
                    child: Column(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: 80,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xff272727),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch, // 가로 방향으로 늘어나게 설정
                              children: [
                                Text(
                                  '전화번호',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 10), // 간격을 추가하고 싶으면 사용
                                Text(
                                  '010-5050-0303',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15,
                                    color: Colors.blueAccent,
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
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Color(0xff272727),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '메모',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
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
                                color: Color(0xff272727),
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
                          flex: 1,
                          child: Container(
                            height: 50,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Color(0xff272727),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    children : [
                                      Text('연락처 공유',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 15,
                                            color: Colors.blueAccent
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

                      ],
                    ),
                  ),
                ),
              ),




            ],
          ),
        ),
    );
  }
}
