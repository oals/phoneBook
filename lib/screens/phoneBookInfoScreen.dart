import 'package:flutter/material.dart';
import 'package:phonebook/widgets/ButtonWidget.dart';
import 'package:provider/provider.dart'; //
import 'package:phonebook/providers/phoneBookInfo_provider.dart';

class phoneBookInfoScreen extends StatefulWidget {
  final int id;

  phoneBookInfoScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<phoneBookInfoScreen> createState() => _phoneBookInfoScreenState();
}

class _phoneBookInfoScreenState extends State<phoneBookInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PhonebookinfoProvider>(
      create: (context) => PhonebookinfoProvider(widget.id),
      child: _PhoneBookInfoStatefulWidget(id : widget.id),
    );
  }
}

class _PhoneBookInfoStatefulWidget extends StatefulWidget {

  final int id;
  _PhoneBookInfoStatefulWidget({required this.id});

  @override
  State<_PhoneBookInfoStatefulWidget> createState() => _PhoneBookInfoState(id: id);
}

class _PhoneBookInfoState extends State<_PhoneBookInfoStatefulWidget> {
  late TextEditingController _controller;

  late int id;

  _PhoneBookInfoState({required this.id});

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void phoneInfoOption(int opt) {
    if (opt == 1) {
      print('메시지 클릭');
    } else if (opt == 2) {
      print('통화 클릭');
    } else if (opt == 3) {
      print('비디오 클릭');
    } else if (opt == 4) {
      print('메일 클릭');
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PhonebookinfoProvider>(context);
    final phoneInfo = provider.phoneInfo;

    _controller.text = phoneInfo.phoneMemo;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: SafeArea(
          child: Container(
            color: Color(0xff212221),
          ),
        ),
      ),
      body: Container(
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
                            child: Image.asset(
                              '../assets/winter.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        phoneInfo.phoneBookItem.name,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Center(
                                  child: ButtonWidget(
                                    buttonOpt: 1,
                                    buttonNm: "메세지",
                                    btnColor: Colors.white,
                                    callback: phoneInfoOption,
                                  )),
                            ),
                            Expanded(
                              child: Center(
                                  child: ButtonWidget(
                                    buttonOpt: 2,
                                    buttonNm: "통화",
                                    btnColor: Colors.white,
                                    callback: phoneInfoOption,
                                  )),
                            ),
                            Expanded(
                              child: Center(
                                  child: ButtonWidget(
                                    buttonOpt: 3,
                                    buttonNm: "비디오",
                                    btnColor: Colors.grey,
                                    callback: phoneInfoOption,
                                  )),
                            ),
                            Expanded(
                              child: Center(
                                  child: ButtonWidget(
                                    buttonOpt: 4,
                                    buttonNm: "Mail",
                                    btnColor: Colors.grey,
                                    callback: phoneInfoOption,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                  padding: EdgeInsets.only(top: 13, left: 7, right: 7),
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
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                '전화번호',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                phoneInfo.phoneBookItem.phoneNumber,
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
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child:  Container(
                              child: TextField(
                                controller: _controller,
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.white,

                                    fontSize: 14,
                                ),
                                onSubmitted: (text) {
                                  provider.updateMemo(id,text);
                                },
                                decoration: InputDecoration(
                                  labelText: '메모',
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              )
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
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '발신자 차단',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 15,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ],
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
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '연락처 공유',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 15,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ],
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
