import 'package:american_quartz/pages/localDb/dbmanager.dart';
import 'package:american_quartz/pages/localDb/favouriteModel.dart';
import 'package:american_quartz/pages/productdetail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";

class FavouritePage extends StatefulWidget {
  // Creating a simple example page.
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  FavouriteModel? student;
  List<FavouriteModel> studlist = <FavouriteModel>[];
  final DbFavouriteManager dbmanager = new DbFavouriteManager();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FavouriteModel>>(
      future: dbmanager.getAllFavouriteList(),
      builder: (context, snapshot) {
        if (snapshot.data != null && snapshot.hasData) {
          studlist = snapshot.data!;
          if (studlist.isEmpty) {
            return Center(
                child: Text("No Data Found !!",
                    style: TextStyle(fontFamily: "RaleWay", fontSize: 18)));
          } else {
            return GridView.builder(
              itemCount: studlist.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.height / 800,
              ),
              itemBuilder: (context, index) {
                List<String> myList =
                    studlist[index].product_image!.split("#").cast<String>();

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetail(
                                product_id: studlist[index].product_id ?? 0,
                                title: studlist[index].product_name ?? '',
                                image: myList,
                                size: studlist[index].size ?? '',
                                thickness: studlist[index].thickness ?? '',
                                finish: studlist[index].finish ?? '',
                                category_id: studlist[index].category_id ?? 0,
                                category_name:
                                    studlist[index].category_name ?? '',
                              )),
                    );
                  },
                  child: new Container(
                    child: Wrap(children: <Widget>[
                      SizedBox(
                          height: 200,
                          child: Card(
                              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                              child: Wrap(
                                children: <Widget>[
                                  Container(
                                      child: CachedNetworkImage(
                                          placeholder: (context, url) =>
                                              new Align(
                                                  alignment: Alignment.center,
                                                  child: SizedBox(
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          new AlwaysStoppedAnimation<
                                                                  Color>(
                                                              Colors.white),
                                                    ),
                                                    height: 30.0,
                                                    width: 30.0,
                                                  )),
                                          imageUrl: myList[0],
                                          errorWidget: (context, url, error) {
                                            return Center(
                                                child: Image.asset(
                                              'assets/images/placeholder_image.png',
                                              color: Colors.white,
                                            ));
                                          },
                                          fit: BoxFit.fitHeight),
                                      width: double.infinity,
                                      height: 145),
                                  SizedBox(height: 15),
                                  new Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Container(
                                      margin: new EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: new Column(
                                        children: <Widget>[
                                          new Align(
                                              alignment: Alignment.centerLeft,
                                              child: new Text(
                                                studlist[index].product_name ??
                                                    '',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontFamily: "Schyler",
                                                    fontSize: 12),
                                              )),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )))
                    ]),
                  ),
                );
              },
            );
          }
        }
        return new Center(
            child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
        ));
      },
    );
  }
}
