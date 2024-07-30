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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => phoneBookInfo(id : phoneBookItem.id))
        ),
      },
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            phoneBookItem.profileImg == "" ?  Icon(
              Icons.account_circle_rounded,
              size: 50,
            ) : ClipOval(
              child: Container(
                width: 43,
                height: 43,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Hero(
                  tag: phoneBookItem.id,
                  child: Image.asset(
                    phoneBookItem.profileImg,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            )

            ,
            SizedBox(
              width: 11,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    phoneBookItem.name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    phoneBookItem.phoneNumber,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              phoneBookItem.bookMark ? Icons.star_outlined : Icons.star_border_purple500_outlined,
              size: 30,
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}