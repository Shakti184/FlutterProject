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
        child: (catalogModel.items!=null && catalogModel.items.isNotEmpty)? GridView.builder(
          gridDelegate: 
          SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            ),
          itemBuilder: (context,index){
            final item = catalogModel.items[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: GridTile(
                header: Container(
                  child: Text(
                    item.name,
                    style: TextStyle(color: Colors.white),
                  ),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 65, 36, 116),
                  ),
                  ),
                child: Image.network(item.image),
                footer: Container(
                  child: Text(
                    item.price.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 45, 35, 61),
                  ),
                  ),
              ),
            );
          },
          itemCount: catalogModel.items.length,
          )
          :Center(
            child: CircularProgressIndicator(),
          ),
      ),
          drawer: Mydrawer(),
      );
  }
}