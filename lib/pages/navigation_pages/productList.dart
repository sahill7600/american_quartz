import 'dart:async';
import 'dart:convert';
import 'package:american_quartz/pages/model/ProductListModel.dart';
import 'package:american_quartz/pages/productdetail.dart';
import 'package:american_quartz/pages/utils/api_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';


class ProductListPage extends StatefulWidget {
  final String title;
  final String catId;

  ProductListPage({
    required this.title,
    required this.catId,
  });

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            widget.title,
            style: TextStyle(fontFamily: 'RaleWay', color: Colors.white),
          ),
        ),
        body: Center(child: dynamicView(widget.catId)));
  }

  Future<List<ProductList>> _fetchJobs(String catId) async {
    print("Fetch ProductList Data ............");
    final jobsListAPIUrl =
        '${ApiConstants.baseURl}products/list?category_id=$catId';
    final response = await http.get(
      Uri.parse(jobsListAPIUrl),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
    );
    print("Fetch ProductList  :::::  " + response.statusCode.toString());
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      var jsonResponse = json.decode(response.body);
      List listdata = jsonResponse["data"];
      print(listdata);
      return listdata.map((job) => new ProductList.fromJson(job)).toList();
    } else if (response.statusCode == 400) {
      var jsonResponse = json.decode(response.body);
      throw Exception(jsonResponse["msg"]);
    } else if (response.statusCode == 401) {
      throw Exception('User Unauthorised');
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  dynamicView(String catId) {
    return FutureBuilder<List<ProductList>>(
      future: _fetchJobs(catId),
      builder: (context, snapshot) {
        if (snapshot.data != null && snapshot.hasData) {
          List<ProductList> data = snapshot.data!;

          if (data.isEmpty) {
            return Text("No Data Found !!",
                style: TextStyle(fontFamily: "RaleWay", fontSize: 18));
          } else {
            return _jobsListView(data);
          }
        } else if (snapshot.hasError) {}
        return CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
        );
      },
    );
  }

  GridView _jobsListView(data) {
    return GridView.builder(
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        childAspectRatio: MediaQuery.of(context).size.height / 800,
      ),
      itemBuilder: (context, index) {
     ///   print("hello>  :::::  " + ApiConstants.baseURl.toString());
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetail(
                        product_id: data[index].id,
                        title: data[index].product_name,
                        image: data[index].product_image,
                        size: data[index].size,
                        thickness: data[index].thickness,
                        finish: data[index].finish,
                        category_id: data[index].category_id,
                        category_name: data[index].category_name,
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
                              child: ZoomOverlay(
                                child: CachedNetworkImage(
                                    placeholder: (context, url) => new Align(
                                        alignment: Alignment.center,
                                        child: SizedBox(
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                new AlwaysStoppedAnimation<
                                                    Color>(Colors.white),
                                          ),
                                          height: 30.0,
                                          width: 30.0,
                                        )),
                                    imageUrl: data[index].product_image[0],
                                    errorWidget: (context, url, error) {
                                      return Center(
                                          child: Image.asset(
                                        'assets/images/placeholder_image.png',
                                        color: Colors.white,
                                      ));
                                    },
                                    fit: BoxFit.fitHeight),
                              ),
                              width: double.infinity,
                              height: 145),
                          SizedBox(height: 15),
                          new Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              margin: new EdgeInsets.symmetric(horizontal: 5.0),
                              child: new Column(
                                children: <Widget>[
                                  new Align(
                                      alignment: Alignment.centerLeft,
                                      child: new Text(
                                        data[index].product_name,
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
