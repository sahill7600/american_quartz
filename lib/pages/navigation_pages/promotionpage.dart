import 'dart:convert';
import 'dart:developer';
import 'package:american_quartz/pages/model/Promotion.dart';
import 'package:american_quartz/pages/utils/api_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

class PromotionScreen extends StatefulWidget {
  const PromotionScreen({Key? key}) : super(key: key);

  @override
  _PromotionScreenState createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen> {
  List<Promotion> data = <Promotion>[];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: dynamicView(),
    );
  }

  dynamicView() {
    return FutureBuilder<List<Promotion>>(
      future: _fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.data != null && snapshot.hasData) {
          data = snapshot.data!;
          log(data.toString());
          return Center(
              child: data.isEmpty
                  ? Text("No Data Found !!")
                  : _jobsListView(data));
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Future<List<Promotion>> _fetchJobs() async {
    print("Fetch ProductList Data ............");
    final jobsListAPIUrl = '${ApiConstants.baseURl}promotionsList';
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
      return listdata.map((job) => new Promotion.fromJson(job)).toList();
    } else if (response.statusCode == 400) {
      var jsonResponse = json.decode(response.body);
      throw Exception(jsonResponse["msg"]);
    } else if (response.statusCode == 401) {
      throw Exception('User unauthorised');
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  ListView _jobsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 2,
            child: new Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    // add this
                    children: <Widget>[
                      /* Image.asset(data[index].file_name, height: 200, fit: BoxFit.fill),*/
                      ZoomOverlay(
                        child: CachedNetworkImage(
                          height: 200,
                          fit: BoxFit.fill,
                          imageUrl: data[index].promotion_image,
                          placeholder: (context, url) => new Align(
                            alignment: Alignment.center,
                            child: Center(
                              child: Container(
                                height: 30,
                                width: 30,
                                margin: EdgeInsets.all(85),
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.0,
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.blue),
                                ),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) {
                            return Center(
                                child: Image.asset(
                              'assets/images/placeholder_image.png',
                              color: Colors.white,
                            ));
                          },
                        ),
                        maxScale: 2.5,
                      ),

                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  data[index].promotion_label,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: "Schyler", fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Text(
                                  "\$" + data[index].price,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: "Schyler", fontSize: 18),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
