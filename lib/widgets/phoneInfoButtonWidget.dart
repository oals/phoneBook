
import 'package:flutter/material.dart';

class phoneBookButtonWidget extends StatefulWidget {

  late int buttonOpt;
  late String buttonNm;
  late Function callback;

  phoneBookButtonWidget({
    super.key,
    required this.buttonNm,
    required this.buttonOpt,
    required this.callback
  });

  @override
  State<phoneBookButtonWidget> createState() => _phoneBookButtonWidgetState();
}

class _phoneBookButtonWidgetState extends State<phoneBookButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        widget.callback(widget.buttonOpt)
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(18)
        ),
        width: 100,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
                widget.buttonOpt == 1 ? Icons.message_rounded :
                widget.buttonOpt == 2 ? Icons.call :
                widget.buttonOpt == 3 ? Icons.video_camera_back :
                Icons.mail_rounded,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Text(widget.buttonNm,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Colors.white
            ),)
          ],

        ),

      ),
    );
  }
}
