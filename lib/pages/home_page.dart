import 'package:flutter/material.dart';

import '../widgeds/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
          body: Center(
            child: Container(
              child: Text("Wellcome"),
            ),
          ),
          drawer: Mydrawer(),
      );
  }
}