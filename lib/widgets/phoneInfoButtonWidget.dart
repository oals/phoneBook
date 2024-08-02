
import 'package:flutter/material.dart';

class phoneBookButtonWidget extends StatefulWidget {

  late int buttonOpt;
  late String buttonNm;
  late Function callback;
  late Color btnColor;

  phoneBookButtonWidget({
    super.key,
    required this.buttonNm,
    required this.buttonOpt,
    required this.callback,
    required this.btnColor
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
        width: 80,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xff505050),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
                widget.buttonOpt == 1 ? Icons.message_rounded :
                widget.buttonOpt == 2 ? Icons.call :
                widget.buttonOpt == 3 ? Icons.video_camera_back :
                Icons.mail_rounded,
              color: widget.btnColor
            ),
            SizedBox(
              height: 3,
            ),
            Text(widget.buttonNm,
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w900,
              color: widget.btnColor
            ),)
          ],

        ),

      ),
    );
  }
}
