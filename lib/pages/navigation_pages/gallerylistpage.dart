import 'dart:async';
import 'dart:convert';
import 'package:american_quartz/pages/model/Gallery.dart';
import 'package:american_quartz/pages/utils/api_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'fullscrennimage.dart';

class GalleryListPage extends StatefulWidget {
  @override
  _GalleryListPageState createState() => _GalleryListPageState();
}

class _GalleryListPageState extends State<GalleryListPage> {
  List<Gallery> data = <Gallery>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Gallery",
          style: TextStyle(fontFamily: 'RaleWay', color: Colors.white),
        ),
      ),
      backgroundColor: const Color(0xFF2E2E2E),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: dynamicView()),
    );
  }

  Future<List<Gallery>> _fetchJobs() async {
    var result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.none) {
      _showDialog('No internet', "You're not connected to a network");
      throw Exception('No Internet connection');
    } else {
      print("Fetch ProductList Data ............");
      final jobsListAPIUrl = '${ApiConstants.baseURl}gallery/images';
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
        return listdata.map((job) => Gallery.fromJson((job))).toList();
      } else if (response.statusCode == 400) {
        var jsonResponse = json.decode(response.body);
        throw Exception(jsonResponse["msg"]);
      } else {
        throw Exception('Failed to load jobs from API');
      }
    }
  }

  GridView _jobsListView(data) {
    return GridView.builder(
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            /*Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductDetail()),
            );*/
          },
          child: new Container(
            child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                child: FittedBox(
                  child: InkWell(
                    child: CachedNetworkImage(
                      placeholder: (context, url) => new Align(
                        alignment: Alignment.center,
                        child: Center(
                          child: Container(
                            height: 10,
                            width: 10,
                            margin: EdgeInsets.all(30),
                            child: CircularProgressIndicator(
                              strokeWidth: 1.0,
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            ),
                          ),
                        ),
                      ),
                      imageUrl: data[index].image,
                      errorWidget: (context, url, error) {
                        return Center(
                            child: Image.asset(
                          'assets/images/placeholder_image.png',
                          color: Colors.white,
                        ));
                      },
                    ),
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FullScreenImage(
                                  image: data[index].image,
                                )),
                      )
                    },
                  ),
                  fit: BoxFit.fitHeight,
                )),
          ),
        );
      },
    );
  }

  dynamicView() {
    return FutureBuilder<List<Gallery>>(
      future: _fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.data != null && snapshot.hasData) {
          data = snapshot.data!;
          return data.length > 0
              ? Center(child: _jobsListView(data))
              : Center(child: Text("No Data Found !!"));
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  _showDialog(title, text) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(text),
            actions: <Widget>[
              MaterialButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }
}
