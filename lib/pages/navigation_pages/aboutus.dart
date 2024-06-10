import "package:flutter/material.dart";

class AboutUsPage extends StatelessWidget {
  // Creating a simple example page.
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          margin: new EdgeInsets.symmetric(vertical: 30.0),
          child: new Column(
            children: [
              SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: FittedBox(
                      child: Image.asset('assets/images/aboutusfirst.jpg'),
                      fit: BoxFit.fill)),
              SizedBox(height: 8),
              Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "American Quartz Stone",
                      style: TextStyle(
                          fontFamily: "RaleWay",
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  )),
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                    child: Text(
                      "American Quartz is headquartered in Dallas, TX. Our Quartz slabs are composed of 93% natural quartz and 7% resin which makes them the hardest and most durable non-precious stone on the market today.",
                      style: TextStyle(fontFamily: "OpenSense"),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: FittedBox(
                      child: Image.asset('assets/images/aboutussecond.jpg'),
                      fit: BoxFit.fill)),
              SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "With All These Qualities In Mind",
                      style: TextStyle(
                          fontFamily: "RaleWay",
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  )),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                    child: Text(
                      "American Quartz requires minimal maintenance making the stone a desirable choice for many applications. American Quartz prides itself on expert customer service and quality. Every surface is inspected to ensure the highest level of standards.",
                      style: TextStyle(fontFamily: "OpenSense"),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: FittedBox(
                      child: Image.asset('assets/images/aboutusthird.jpg'),
                      fit: BoxFit.fill)),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child:Text(
                  "Why American Quartz Stone?",
                  style: TextStyle(
                      fontFamily: "RaleWay", color: Colors.white, fontSize: 20),
                ),
                )
              ),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                    child: Text(
                      "With worldwide logistics available and innovation, We are happy to bring this cutting edge product to you.Please contact us today we are happy to help in your project needs and make your dreams into reality.",
                      style: TextStyle(fontFamily: "OpenSense"),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
