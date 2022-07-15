import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/donatorinformation.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/about_us.dart';
import 'package:flutter_catalog/pages/donate.dart';
import 'package:flutter_catalog/pages/receive.dart';
import 'package:flutter_catalog/pages/receiverinformation.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = "https://studentprojectguide.com/wp-content/uploads/2021/10/online-charity.png";

    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(color: Colors.deepPurple
                      // color: Colors.deepPurple
                      ),
                  accountName: Text("Online Charity"),
                  accountEmail: Text("onlinecharity@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                )),
            ListTile(
              onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage()));
              },
              leading: Icon(
                CupertinoIcons.house_fill,
                color: Colors.deepPurple,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),

            ListTile(
              onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=> donate()));
              },
              leading: Icon(
                CupertinoIcons.gift_fill,
                color: Colors.deepPurple,
              ),
              title: Text(
                "Donate",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),

            ListTile(
              onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=> receive()));
              },
              leading: Icon(
                CupertinoIcons.envelope_open_fill,
                color: Colors.deepPurple,
              ),
              title: Text(
                "Recieve",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),

            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DonatorInformation()));
              },
              leading: Icon(
                CupertinoIcons.person_alt_circle_fill,
                color: Colors.deepPurple,
              ),
              title: Text(
                "Donator Information",
                textScaleFactor: 1.2,

                style: TextStyle(
                  color: Colors.deepPurple
                ),
              ),
            ),

             ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Receiverinformation()));
              },
              leading: Icon(
                CupertinoIcons.person_alt_circle_fill,
                color: Colors.deepPurple,
              ),
              title: Text(
                "Receiver Information",
                textScaleFactor: 1.2,

                style: TextStyle(
                  color: Colors.deepPurple
                ),
              ),
            ),

            ListTile(
              onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=> about_us()));
              },
              leading: Icon(
                CupertinoIcons.person_circle_fill,
                color: Colors.deepPurple,
              ),
              title: Text(
                "About us",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
