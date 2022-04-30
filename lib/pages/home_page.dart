import 'package:flutter/material.dart';

import '../widgeds/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      backgroundColor: Color.fromARGB(255, 251, 252, 252),
          body: Center(
            child: Container(
              //color: Color.fromARGB(255, 121, 133, 154),
              child: Text("Wellcome"),
            ),
          ),
          drawer: Mydrawer(),
      );
  }
}