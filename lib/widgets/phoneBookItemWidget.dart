import 'package:flutter/material.dart';
import 'package:phonebook/models/phoneItem.dart';
import 'package:phonebook/screens/phoneBookInfo.dart';

class phoneBookItemWidget extends StatelessWidget {

  late phoneBook phoneBookItem;

  phoneBookItemWidget({
    super.key,
    required this.phoneBookItem,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        navigateToPhoneBookInfo(context,phoneBookItem.id)
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    phoneBookItem.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


void navigateToPhoneBookInfo(BuildContext context, int id) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return phoneBookInfo(id: id);
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    ),
  );
}