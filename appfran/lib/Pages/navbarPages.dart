import 'package:flutter/material.dart';

class NavbarPages extends StatelessWidget implements PreferredSizeWidget {
  final String formattedDate;

  const NavbarPages(this.formattedDate);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(63, 210, 199, 0.99),
      //title: Text('Login'),
      actions: <Widget>[
        Container(
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: Row(
            children: [
              Text(
                formattedDate,
                style: TextStyle(color: Colors.black, fontSize: 15.0),
                textAlign: TextAlign.start,
              ),
              Spacer(),
              Icon(
                Icons.watch_later_outlined,
                color: Colors.black54,
              ),
              //SizedBox(width: 10),
            ],
          ),
        ),
      ],
    );
  }
}
