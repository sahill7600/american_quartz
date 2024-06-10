import "package:flutter/material.dart";
import 'package:photo_view/photo_view.dart';

class FullScreenImage extends StatefulWidget {
  final String image;

  FullScreenImage({
    required this.image,
  });

  // Creating a simple example page.
  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Center(
            child: /*PinchZoomImage(
        image: CachedNetworkImage(
          placeholder: (context, url) => new Align(
              alignment: Alignment.center,
              child: SizedBox(
                child: CircularProgressIndicator(),
                height: 35.0,
                width: 35.0,
              )),
          imageUrl: widget.image,
          fit: BoxFit.fill,
          height: 250,
          width: double.infinity,
        ),
        hideStatusBarWhileZooming: true,
      ),*/
                PhotoView(
          imageProvider: NetworkImage(widget.image),
        )));
  }
}
