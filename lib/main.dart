import 'dart:async';
import 'package:american_quartz/pages/localDb/dbmanager.dart';
import 'package:american_quartz/pages/navigation_pages/OnBoardingpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.red,
      brightness: Brightness.dark,
      hintColor: Colors.redAccent,
    ),
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  static String tag = 'splashScreen';

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  final DbFavouriteManager dbmanager = new DbFavouriteManager();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => (OnBoarding())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
     //const Color(0xFFFFFFFF),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(image: AssetImage('assets/images/logo_Aq.png')),
                    SizedBox(height: 80),
                    SizedBox(
                      child: CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.black),
                      ),
                      height: 30.0,
                      width: 30.0,
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

