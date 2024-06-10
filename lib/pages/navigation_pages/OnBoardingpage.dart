import 'package:american_quartz/pages/NavToNewPageBottomNav.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'aboutus.dart';
import 'detail_page.dart';

class OnBoarding extends StatefulWidget {

  @override
  State<OnBoarding > createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding > {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
    ),
    child:Scaffold(

      body: OnBoardingSlider(
        headerBackgroundColor: Colors.black,
        finishButtonTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),
        finishButtonText: 'Home Page',
        onFinish: (){
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => (Example())));
        },
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18), // <-- Radius
          ),
        ),

        skipTextButton:
        Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Skip',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white,),),
            Icon((Icons.arrow_forward),color: Colors.white,size: 20,)
          ],
        ),
        trailing: Text('About Us',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white,),
        ),
        trailingFunction: (){
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => (
              DetailPage()
             // Example()
           //   AboutUsPage()
          )));
        },
        background: [
          Image.asset('assets/images/aboutusfirstnew.jpg',
            width: MediaQuery.of(context).size.width,),
          Image.asset('assets/images/marbleseries.jpg',
            width: MediaQuery.of(context).size.width,),
          Image.asset('assets/images/elementseriesnew.jpg',
            width: MediaQuery.of(context).size.width,),
          Image.asset('assets/images/sparkleseriesnew.jpg',
            width: MediaQuery.of(context).size.width,),
        ],
        totalPage: 4,
        speed: 1.8,
        pageBodies: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 300,),
                    Text(
                      'Introduction',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),
                    ),
                  SizedBox(height: 5,),
                    Text(
                     "AmericanQuartz materials with a focus on manufacturing and distribution. Their exquisite countertops originate from crushed stone, symbolizing the transformative journey from raw materials to stunning slabs.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 300,),
                    Text(
                      'Marble Series',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),
                    ),
                  SizedBox(height: 5,),
                    Text(
                     "MarbleSeries redefines elegance,seamlessly blending natural beauty and expert craftsmanship.decor,it adds sophistication to spaces,perfect for both residential and commercial settings.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 300,),
                    Text(
                      'Element Series',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),
                    ),
                  SizedBox(height: 5,),
                    Text(
                     "AmericanQuartzUSA's Element Series blends natural beauty with expert craftsmanship. From countertops to decor, it redefines design luxury, enhancing residential and commercial spaces with sophistication.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 300,),
                Text(
                  'Sparkle Series',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),
                ),
                SizedBox(height: 5,),
                Text(
                  "Sparkle Series seamlessly blends natural allure with expert craftsmanship, redefining luxury in countertops and decor. Elevate spaces with the exquisite beauty of Sparkle Series, embodying sophistication and timeless charm.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

