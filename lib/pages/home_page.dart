import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgeds/item_widget.dart';
import '../widgeds/drawer.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  
  @override

  void initState(){
      super.initState();
      loadData();
  }

  loadData() async {
      await Future.delayed(Duration(seconds: 0));
      final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
      final decodeData =jsonDecode(catalogJson);
      var productData = decodeData["products"];
      catalogModel.items=List.from(productData).map<Items>((items) => Items.fromMap(items)).toList();
      setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (catalogModel.items!=null && catalogModel.items.isNotEmpty)? ListView.builder(
          itemCount: catalogModel.items.length,
          itemBuilder: (context,index){
            return Itemwidget(
              item: catalogModel.items[index] ,
            );
          }
          )
          :Center(
            child: CircularProgressIndicator(),
          ),
      ),
          drawer: Mydrawer(),
      );
  }
}