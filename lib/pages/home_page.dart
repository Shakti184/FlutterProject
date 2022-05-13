import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgeds/item_widget.dart';
import 'package:flutter_application_1/widgeds/themes.dart';
import '../widgeds/drawer.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

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
      backgroundColor: MyTheme.creamColor,
      body:  SafeArea(
        child: Container(
          padding: Vx.m32,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClatalogHeader(),
              if(catalogModel.items!=null&&catalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
              Center(child: CircularProgressIndicator(),
              )
            ],
          ),
        ),
      ),
      );
  }
}


class ClatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
              "Trending Products".text.xl2.make(),
            ],
        );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: catalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog =catalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Items catalog;

  const CatalogItem({Key? key, required this.catalog}) : assert(catalog!=null), super(key: key);
  @override
  Widget build(BuildContext context) {
      return VxBox(
        child:Row(children: [
            CatalogImage(image: catalog.image,
            ),
            Expanded(child: Column(
              children: [
                catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: Vx.mOnly(right:16),
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    ElevatedButton(
                      onPressed: (){},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                        shape: MaterialStateProperty.all(StadiumBorder()),
                      ),
                      child: "Buy".text.make(),
                    )
                  ],
                )
              ],
            ))
          ],
      )
    ).white.roundedLg.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({ Key? key, required this.image }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
            image,
          ).box.rounded.p8.color(MyTheme.creamColor).make();
  }
}