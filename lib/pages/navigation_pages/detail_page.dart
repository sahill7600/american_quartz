import 'package:american_quartz/pages/NavToNewPageBottomNav.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'locationpage.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 //     bottomNavigationBar: Example(),
        appBar: AppBar(
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) => (
                  Example()
                  )));},
                child: Text("Home",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.black),
              ),
            ),
          ],
        ),
      body: Container(

        margin: EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
        //  crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(
              image: AssetImage(
                'assets/images/logo_Aq.png',
              ),
              fit: BoxFit.contain,
              width: 150,
              height: 150,
            ),
            SizedBox(height: 50),

            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "About Us : ",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white, fontFamily: "Futura", fontSize: 18),
                  ),
                  Expanded(
                    child: Text(
                      "AmericanQuartzUSA crafts quartz materials with a focus on manufacturing and distribution. Their exquisite countertops originate from crushed stone, symbolizing the transformative journey from raw materials to stunning slabs—a testament to the philosophy that the whole exceeds the sum of its parts.",
                       // textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.white, letterSpacing: 1.5,
                          fontFamily: "Futura",
                          fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _makeEmail("info@americanquartzusa.com");
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.mail,
                        ),
                        SizedBox(width: 15),
                        Text(
                          "info@americanquartzusa.com",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Futura",
                              fontSize: 18),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: GestureDetector(
                onTap: () {
                  _makePhoneCall("1877-553-2323");
                },
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.call,
                        ),
                        SizedBox(width: 15),
                        Text(
                          "1877-553-2323",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Futura",
                              fontSize: 18),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapPage()),
                  );
                },
                child: Text(
                  "Contact Us",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white, fontFamily: "Futura", fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: StadiumBorder(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _makeEmail(String email) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    await launchUrl(launchUri);
  }
}
