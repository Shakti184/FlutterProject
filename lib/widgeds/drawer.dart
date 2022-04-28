import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl="https://picfiles.alphacoders.com/176/thumb-1920-176163.png";
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 121, 133, 154),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(color: Color.fromARGB(240, 16, 2, 92)),
                accountName: Text("Shakti Maddeshiya",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                accountEmail: Text("shaktimaddeshiya184@gmail.com",style: TextStyle(color: Colors.white),),
                currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(imageUrl),
                ),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Color.fromARGB(255, 252, 253, 253),
                  ),
                title: Text(
                  "Home",
                  textScaleFactor: 1.3,
                  style: TextStyle(
                    color: Color.fromARGB(255, 2, 238, 254),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.mail,
                  color: Color.fromARGB(255, 253, 254, 254),
                  ),
                title: Text(
                  "E-Mail",
                  textScaleFactor: 1.3,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 249, 237),
                  ),
                ),
              ),ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Color.fromARGB(255, 254, 255, 255),
                  ),
                title: Text(
                  "Profile",
                  textScaleFactor: 1.3,
                  style: TextStyle(
                    color: Color.fromARGB(255, 1, 236, 253),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}