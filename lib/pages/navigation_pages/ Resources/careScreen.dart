import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CareScreen extends StatefulWidget {

  @override
  State<CareScreen> createState() => _CareScreenState();
}

class _CareScreenState extends State<CareScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
         "Maintenance",
          style: TextStyle(fontFamily: 'RaleWay', color: Colors.white),
        ),
      ),
      body: Container(
        child:
        Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0,top: 10,right: 10),
                child: Text("HOW TO CLEAN AMERICAN QUARTZ ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              ),
            ),
            Text("COUNTERTOPS",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              alignment: Alignment.topLeft,
                child: Text("Items needed:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(Icons.check,color: Colors.green,size: 22,),SizedBox(width: 8,),
                      Text("Soft Scrub with bleach already mixed in")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(Icons.check,color: Colors.green,size: 22,),SizedBox(width: 8,),
                      Text("Green and Yellow sponge")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(Icons.check,color: Colors.green,size: 22,),SizedBox(width: 8,),
                      Text("Paper Towels")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(Icons.check,color: Colors.green,size: 22,),SizedBox(width: 8,),
                      Text("Water")
                    ],
                  ),
                ),
              ],
            ),
            Text("Steps to follow:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("● Get the green and yellow sponge wet\n● Apply soft scrub on the green side of the sponge\n● In a circular motion scrub, the area to be cleaned on the counters.\n● Allow the soiled area to set for 5- 7 minutes\n● Wet the paper towels\n● Clean off the area treated thoroughly with the wet paper towels\n● Wipe the area down with a dry paper towel\n● JOB WELL DONE.\n● You can repeat this process once a week if desired, your countertops will look good as new.",
                style: TextStyle(fontSize: 16)
                 ),
            )

          ],
        ),
      ),
    );
  }
}
