import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'localDb/dbmanager.dart';
import 'localDb/favouriteModel.dart';

class ProductDetail extends StatefulWidget {
  final int product_id;
  final String title;
  final List<String> image;
  final String size;
  final String thickness;
  final String finish;
  final int category_id;
  final String category_name;

  ProductDetail(
      {required this.product_id,
      required this.title,
      required this.image,
      required this.size,
      required this.thickness,
      required this.finish,
      required this.category_id,
      required this.category_name});

  @override
  ProductDetailState createState() {
    return ProductDetailState();
  }
}

class ProductDetailState extends State<ProductDetail> {
  Color _iconColor = Colors.black54;
  final DbFavouriteManager dbmanager = new DbFavouriteManager();

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.image
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    final CarouselController _controller = CarouselController();

    dynamicVasmass();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.title,
          style: TextStyle(fontFamily: 'RaleWay', color: Colors.white),
        ),
      ),
      body: Container(
        child: Container(
          child: new Column(
            children: <Widget>[
              /*InkWell(
                child: CachedNetworkImage(
                  placeholder: (context, url) => new Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        child: CircularProgressIndicator(),
                        height: 35.0,
                        width: 35.0,
                      )),
                  imageUrl: widget.image,
                  fit: BoxFit.fill,
                  height: 225,
                  width: double.infinity,
                ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FullScreenImage(image: widget.image)),
                  )
                },
              ),*/
              CarouselSlider(
                items: imageSliders,
                carouselController: _controller,
                options: CarouselOptions(
                    autoPlay: false,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                        print("current $_current");
                      });
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.image.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 25),
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 25.0),
                child: new Column(
                  children: <Widget>[
                    new Align(
                      alignment: Alignment.centerLeft,
                      child: new Text(
                        widget.title,
                        style: TextStyle(
                          fontFamily: "RaleWay",
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Divider(color: Colors.white),
                    SizedBox(height: 5),
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text(
                            "Size",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "RaleWay",
                            ),
                          ),
                          new Text(widget.size,
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "RaleWay",
                              ))
                        ]),
                    SizedBox(height: 5),
                    Divider(color: Colors.white),
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text(
                            "Thickness",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "RaleWay",
                            ),
                          ),
                          new Text(widget.thickness,
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "RaleWay",
                              ))
                        ]),
                    SizedBox(height: 5),
                    Divider(color: Colors.white),
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text(
                            "Finish",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "RaleWay",
                            ),
                          ),
                          new Text(widget.finish,
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "RaleWay",
                              ))
                        ])
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2, // match_parent
                  child: MaterialButton(
                    textColor: Colors.black,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Icon(Icons.image_search),
                        Text(
                          "Request Sample",
                          style: TextStyle(
                              fontFamily: 'RaleWay',
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    onPressed: () {
                      UrlLauncher.launch(
                          'http://americanquartzusa.com/order-samples/');
                    },
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(90.0),
                    ),
                  )),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            onPressed: () {
                              UrlLauncher.launch('tel:+1(877)555-2323');
                            },
                            elevation: 2.0,
                            fillColor: Colors.white,
                            child: Icon(
                              Icons.call,
                              size: 25.0,
                              color: Colors.black54,
                            ),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                          ),
                          SizedBox(height: 10),
                          RawMaterialButton(
                            onPressed: () {
                              UrlLauncher.launch(
                                  'mailto:info@americanquartzusa.com');
                            },
                            elevation: 2.0,
                            fillColor: Colors.white,
                            child: Icon(
                              Icons.mail,
                              size: 25.0,
                              color: Colors.black54,
                            ),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                          ),
                          RawMaterialButton(
                            onPressed: () async {
                              // ignore: unrelated_type_equality_checks
                              int count = await dbmanager.getCount(
                                  widget.category_id, widget.product_id);
                              if (count == 0) {
                                String myImages = widget.image.join("#");

                                FavouriteModel st = new FavouriteModel(
                                    product_id: widget.product_id,
                                    product_name: widget.title,
                                    product_image: myImages,
                                    size: widget.size,
                                    thickness: widget.thickness,
                                    finish: widget.finish,
                                    category_id: widget.category_id,
                                    category_name: widget.category_name);
                                dbmanager.insertStudent(st);

                                setState(() {
                                  _iconColor = Colors.red;
                                });

                                Fluttertoast.showToast(
                                  msg: "Product added to favourite",
                                  toastLength: Toast.LENGTH_SHORT,
                                );
                              } else {
                                dbmanager.deleteFavourite(
                                    widget.category_id, widget.product_id);

                                setState(() {
                                  _iconColor = Colors.black54;
                                });

                                Fluttertoast.showToast(
                                  msg: "Product removed from favourite",
                                  toastLength: Toast.LENGTH_SHORT,
                                );
                              }
                            },
                            elevation: 2.0,
                            fillColor: Colors.white,
                            child: Icon(
                              Icons.favorite,
                              size: 25.0,
                              color: _iconColor,
                            ),
                            padding: EdgeInsets.all(15.0),
                            shape: CircleBorder(),
                          ),
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  dynamicVasmass() async {
    int count = await dbmanager.getCount(widget.category_id, widget.product_id);

    if (count == 0) {
      if (this.mounted) {
        setState(() {
          _iconColor = Colors.black54;
        });
      }
    } else {
      if (this.mounted) {
        setState(() {
          _iconColor = Colors.red;
        });
      }
    }
  }
}
