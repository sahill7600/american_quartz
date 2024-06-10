import 'dart:io';
import 'package:american_quartz/pages/navigation_pages/productList.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import "package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import ' Resources/Data-Sheet.dart';
import ' Resources/FAQ.dart';
import ' Resources/careScreen.dart';
import ' Resources/privacyPolicy.dart';
import 'Trade/WarrantyRegistration.dart';
import 'Trade/distributorScreen.dart';
import 'Trade/orderSamples.dart';
import 'gallerylistpage.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomePage extends StatefulWidget {
  // Creating a simple example page.
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var rmicons = false;
  var renderOverlay = true;
  var visible = true;
  var switchLabelPosition = false;
  var extend = false;
  var mini = false;
  var customDialRoot = false;
  var closeManually = false;
  var useRAnimation = true;
  var speedDialDirection = SpeedDialDirection.up;
  var isDialOpen = ValueNotifier<bool>(false);
  var buttonSize = const Size(56.0, 56.0);
  var selectedfABLocation = FloatingActionButtonLocation.endDocked;
  @override
  Widget build(BuildContext context) {
    _checkInternetConnectivity();
    return Scaffold(
      floatingActionButton: SpeedDial(
        backgroundColor: Colors.white38,
        icon: Icons.add,
        activeIcon: Icons.close,
        spacing: 3,
        mini: mini,
        foregroundColor: Colors.white,
        openCloseDial: isDialOpen,
        childPadding: const EdgeInsets.all(5),
        spaceBetweenChildren: 4,
        dialRoot: customDialRoot
            ? (ctx, open, toggleChildren) {
                return ElevatedButton(
                  onPressed: toggleChildren,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 18),
                  ),
                  child: const Text(
                    "Custom Dial Root",
                    style: TextStyle(fontSize: 17),
                  ),
                );
              }
            : null,
        buttonSize: buttonSize,
        label: extend ? const Text("Open") : null,

        activeLabel: extend ? const Text("Close") : null,
        visible: visible,
        direction: speedDialDirection,
        switchLabelPosition: switchLabelPosition,

        /// If true user is forced to close dial manually
        closeManually: closeManually,

        /// If false, backgroundOverlay will not be rendered.
        renderOverlay: renderOverlay,

        onOpen: () => debugPrint('OPENING DIAL'),
        onClose: () => debugPrint('DIAL CLOSED'),
        useRotationAnimation: useRAnimation,
        tooltip: 'Open Speed Dial',
        heroTag: 'speed-dial-hero-tag',

        elevation: 8.0,
        animationCurve: Curves.elasticInOut,
        isOpenOnStart: false,
        shape: customDialRoot
            ? const RoundedRectangleBorder()
            : const StadiumBorder(),
        // childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        children: [
          SpeedDialChild(
              foregroundColor: Colors.white,
              label: "Become A Distributor",
              //'Show Snackbar',
              visible: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Distributor()),
                );
              }
              ),
          SpeedDialChild(
              foregroundColor: Colors.white,
              label: "Order Samples",
              //'Show Snackbar',
              visible: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderSamples()),
                );
              }
              ),
          SpeedDialChild(
              //  child: !rmicons ?  Image.asset(AppIcons.jobReport, cacheHeight: 25) : null,
              //      backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              label: "Manual DataSheet and Warranty",
              //'Second',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DataSheet()),
                );
              }
              //() => debugPrint('SECOND CHILD'),
              ),
          SpeedDialChild(
              label: "Privacy Policy",
              //'Second',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicy()),
                );
              }
              //() => debugPrint('SECOND CHILD'),
              ),
          SpeedDialChild(
              label: "FAQ Quartz",
              //'Show Snackbar',
              visible: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FAQ()),
                );
              }
              //() => ScaffoldMessenger.of(context).showSnackBar(
              //    const SnackBar(content: Text(("Third Child Pressed")))),
              // onLongPress: () => debugPrint('THIRD CHILD LONG PRESS'),
              ),
          SpeedDialChild(
              //   child: !rmicons ?     Image.asset(AppIcons.addAgent, cacheHeight: 25): null,
              //  backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              label: "Warranty Registration",
              //'Second',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WarrantyRegistration()),
                );
              }
              //() => debugPrint('SECOND CHILD'),
              ),
          SpeedDialChild(
              label: "Care and Maintenance",
              //'First',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CareScreen()),
                );
              }
              //() => setState(() => rmicons = !rmicons),
              ),
        ],
      ),
      body:  SingleChildScrollView(
        child: Container(
          margin: new EdgeInsets.symmetric(vertical: 30.0),
          child: new Column(
            children: <Widget>[
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                child: InkWell(
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                   // alignment: Alignment.centerLeft,
                    children: <Widget>[
                      SizedBox(
                          width: double.infinity,
                          height: 180,
                          child: FittedBox(
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.3),
                                  BlendMode.dstATop),
                              child: Image.asset('assets/images/marbleseries.jpg'),
                            ),
                            fit: BoxFit.fill,
                          )),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Marble Series",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "RaleWay",
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                              fontSize: 26.0,
                              letterSpacing: 0.5),
                        ),
                      ),
                    ],
                  ),
                  onTap: () => {
                    //4
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductListPage(
                                title: "Marble Series",
                                catId: "4",
                              )),
                    )
                  },
                ),
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                child: InkWell(
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                  //  alignment: Alignment.centerLeft,
                    children: <Widget>[
                      SizedBox(
                          width: double.infinity,
                          height: 180,
                          child: FittedBox(
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.3),
                                    BlendMode.dstATop),
                                child: Image.asset(
                                    'assets/images/elementseries.jpg'),
                              ),
                              fit: BoxFit.fill)),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Element Series",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 26.0,
                            letterSpacing: 0.5,
                            fontFamily: "RaleWay",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () => {
                    //2

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductListPage(
                                title: "Element Series",
                                catId: "2",
                              )),
                    )
                  },
                ),
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                child: InkWell(
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    //alignment: Alignment.centerLeft,
                    children: <Widget>[
                      SizedBox(
                          width: double.infinity,
                          height: 180,
                          child: FittedBox(
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.3),
                                    BlendMode.dstATop),
                                child: Image.asset(
                                    'assets/images/sparkleseries.jpg'),
                              ),
                              fit: BoxFit.fill)),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Sparkle Series",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 26.0,
                            letterSpacing: 0.5,
                            fontFamily: "RaleWay",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  //6
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductListPage(
                                title: "Sparkle Series",
                                catId: "6",
                              )),
                    )
                  },
                ),
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                child: InkWell(
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    //alignment: Alignment.centerLeft,
                    children: <Widget>[
                      SizedBox(
                          width: double.infinity,
                          height: 180,
                          child: FittedBox(
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.3),
                                    BlendMode.dstATop),
                                child: Image.asset(
                                    'assets/images/naturalseries.jpg'),
                              ),
                              fit: BoxFit.fill)),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Natural Series",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 26.0,
                            letterSpacing: 0.5,
                            fontFamily: "RaleWay",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () => {
                    //5
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductListPage(
                                title: "Natural Series",
                                catId: "5",
                              )),
                    )
                  },
                ),
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                child: InkWell(
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                   // alignment: Alignment.centerLeft,
                    children: <Widget>[
                      SizedBox(
                          width: double.infinity,
                          height: 180,
                          child: FittedBox(
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.3),
                                    BlendMode.dstATop),
                                child: Image.asset(
                                    'assets/images/naturalseries.jpg'),
                              ),
                              fit: BoxFit.fill)),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Gallery",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 26.0,
                            letterSpacing: 0.5,
                            fontFamily: "RaleWay",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () => {
                    //1
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GalleryListPage()),
                    )
                  },
                ),
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                child: InkWell(
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                  //  alignment: Alignment.centerLeft,
                    children: <Widget>[
                      SizedBox(
                          width: double.infinity,
                          height: 180,
                          child: FittedBox(
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.3),
                                    BlendMode.dstATop),
                                child: Image.asset(
                                    'assets/images/liveinventory.png'),
                              ),
                              fit: BoxFit.fill)),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Live Inventory",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 26.0,
                            letterSpacing: 0.5,
                            fontFamily: "RaleWay",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () => {
                    //3
                    UrlLauncher.launch(
                        'http://americanquartz.stoneprofitsweb.com/')
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showDialog(title, text) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(
              title,
              style: TextStyle(color: Colors.black),
            ),
            content: Text(
              text,
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            actions: <Widget>[
              MaterialButton(
                child: Text(
                  'Ok',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  exit(0);
                },
              )
            ],
          );
        });
  }

  _checkInternetConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _showDialog('No internet', "You're not connected to a network");
    } else {}
  }
}
