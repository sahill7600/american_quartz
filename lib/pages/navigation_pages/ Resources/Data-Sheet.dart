import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_media_downloader/flutter_media_downloader.dart';

class DataSheet extends StatefulWidget {

  @override
  State<DataSheet> createState() => _DataSheetState();
}

class _DataSheetState extends State<DataSheet> {
  final _flutterDownload = MediaDownload();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Data Sheet",
          style: TextStyle(fontFamily: 'RaleWay', color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            // Image.asset('assets/images/marbleseries.jpg',
            //   width: MediaQuery.of(context).size.width,),
            Center(child: Text("American-Quartz-Manual", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18))),
            Container(
              height: 150,
              padding: new EdgeInsets.all(12.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                elevation: 10,
                child:  InkWell(
                  child: Center(
                    child: ListTile(
                      leading:   Image(image: AssetImage('assets/images/download/bg1.gif'),fit: BoxFit.fill, ),
                      title: Text(
                          'Installation Manual',
                          style: TextStyle(fontSize: 20.0,color: Colors.black)
                      ),
                      // subtitle: Text(
                      //     'Download',
                      //     style: TextStyle(fontSize: 18.0,color: Colors.black)
                      // ),
                    ),
                  ),
                  onTap:
                        () async{
                      _flutterDownload.downloadMedia(context, 'https://americanquartzusa.com/wp-content/uploads/2022/05/American-Quartz-Installation-Guide-1-1.pdf');
                  },
                ),
              ),
            ),
            Container(
              height: 150,
              padding: new EdgeInsets.all(12.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                elevation: 10,
                child:  InkWell(
                  child: Center(
                    child: ListTile(
                      leading:   Image(image: AssetImage('assets/images/download/bg1.gif'),fit: BoxFit.fill, ),
                      title: Text(
                          'Data-Sheet',
                          style: TextStyle(fontSize: 20.0,color: Colors.black)
                      ),
                      // subtitle: Text(
                      //     'Download',
                      //     style: TextStyle(fontSize: 18.0,color: Colors.black)
                      // ),
                    ),
                  ),
                  onTap:
                        () async{
                      _flutterDownload.downloadMedia(context, 'https://americanquartzusa.com/wp-content/uploads/2022/10/American-Quartz-Data-Sheet.pdf');

                  },
                ),
              ),
            ),
            Container(
              height: 150,
              padding: new EdgeInsets.all(12.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                elevation: 10,
                child:  InkWell(
                  child: Center(
                    child: ListTile(
                      leading:   Image(image: AssetImage('assets/images/download/bg1.gif'),fit: BoxFit.fill, ),
                      title: Text(
                          'Limited Year Warranty',
                          style: TextStyle(fontSize: 20.0,color: Colors.black)
                      ),
                      // subtitle: Text(
                      //     'Download',
                      //     style: TextStyle(fontSize: 18.0,color: Colors.black)
                      // ),
                    ),
                  ),
                  onTap: () async{
                      _flutterDownload.downloadMedia(context, 'https://americanquartzusa.com/wp-content/uploads/2022/05/American-Quartz-Limited-Lifetime-Warranty-English.pdf');

                  },
                ),
              ),
            ),
            // Text("Please Download this Data-Sheet"),
          ],
        ),
      ),
    );
  }
}
