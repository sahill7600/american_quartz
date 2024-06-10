import 'package:american_quartz/pages/navigation_pages/favouritepage.dart';
import 'package:american_quartz/pages/navigation_pages/homepage.dart';
import "package:flutter/material.dart";
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'navigation_pages/aboutus.dart';
import 'navigation_pages/locationpage.dart';
import 'navigation_pages/promotionpage.dart';

void main() {
  runApp(new MaterialApp(
    theme: ThemeData(
      brightness: Brightness.dark,
      hintColor: Colors.white,
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
          .copyWith(background: Colors.black),
    ),
    home:Example()
  //  new Example(),
  ));
}

class Example extends StatefulWidget {
  @override
  ExampleState createState() => new ExampleState();
}

class ExampleState extends State<Example> {
  int currentTab = 0; // Index of currently opened tab.
  HomePage homePage = new HomePage(); // Page that corresponds with the first tab.
  FavouritePage favPage = new FavouritePage(); // Page that corresponds with the second tab.
  MapPage locationPage = new MapPage();
  AboutUsPage aboutUs = new AboutUsPage();
  PromotionScreen promotion = new PromotionScreen(); // Page that corresponds with the third tab.
  List<Widget> pages =
      <Widget>[]; // List of all pages that can be opened from our BottomNavigationBar.
  // Index 0 represents the page for the 0th tab, index 1 represents the page for the 1st tab etc...
  late Widget currentPage; // Page that is open at the moment.

  @override
  void initState() {
    super.initState();
    pages = [
      homePage,
      favPage,
      locationPage,
      aboutUs,
      promotion
    ]; // Populate our pages list.
    currentPage =
        homePage; // Setting the first page that we'd like to show our user.
    // Notice that pageOne is the 0th item in the pages list. This corresponds with our initial currentTab value.
    // These two should match at the start of our application.
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Here we create our BottomNavigationBar.
    final BottomNavigationBar navBar = new BottomNavigationBar(

      type: BottomNavigationBarType.fixed,
        ///Green Color Labels
   //  selectedItemColor: Colors.lightGreen[400],
     selectedItemColor: Colors.white,
     unselectedItemColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
     // backgroundColor: Colors.black12,
      backgroundColor: Colors.white30,
      selectedFontSize: 14,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedFontSize: 10,
      currentIndex: currentTab,
      // Our currentIndex will be the currentTab value. So we need to update this whenever we tab on a new page!
      onTap: (int numTab) {
        // numTab will be the index of the tab that is pressed.
        setState(() {
          // Setting the state so we can show our new page.
          print("Current tab: " +
              numTab.toString()); // Printing for debugging reasons.
          currentTab =
              numTab; // Updating our currentTab with the tab that is pressed [See 43].
          currentPage = pages[
              numTab]; // Updating the page that we'd like to show to the user.
        });
      },
      items: <BottomNavigationBarItem>[
        // Visuals, see docs for more information: https://docs.flutter.io/flutter/material/BottomNavigationBar-class.html
        new BottomNavigationBarItem(
            //numTab 0
            icon: new Icon(Icons.home),
            label: "Home",
        ),
        new BottomNavigationBarItem(
            //numTab 1
            icon: new Icon(Icons.star),
            label: "Favourite"),
        new BottomNavigationBarItem(
            //numTab 2
            icon: new Icon(Icons.location_on),
            label: "Location"),
        new BottomNavigationBarItem(
            //numTab 1
            icon: new Icon(Icons.account_box),
            label: "About Us"),
        new BottomNavigationBarItem(
            //numTab 1
            icon: new Icon(Icons.graphic_eq,color: Colors.red,),
            label: "Promotion",
        ),
      ],
    );

    return new Scaffold(
      bottomNavigationBar: navBar,
      //some widget ) ,
      body: currentPage, // The body will be the currentPage. Which we update when a tab is pressed.
    );
  }
}


// class Example extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<Example>
//     with SingleTickerProviderStateMixin {
//   String title = 'BottomNavigationBar';
//
//   TabController? _tabController;
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 5, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _tabController?.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body:
//       TabBarView(
//         children: <Widget>[
//           HomePage(),
//           FavouritePage(),
//           MapPage(),
//           AboutUsPage(),
//           PromotionScreen()
//           // Home(),
//           // Department(),
//           // Cart(),
//           // Search(),
//           // More(),
//         ],
//         // If you want to disable swiping in tab the use below code
//         physics: NeverScrollableScrollPhysics(),
//         controller: _tabController,
//       ),
//       bottomNavigationBar: Container(
//         padding: EdgeInsets.all(16.0),
//         child: ClipRRect(
//           borderRadius: BorderRadius.all(
//             Radius.circular(50.0),
//           ),
//           child: Container(
//             color: Colors.white24,
//             child: TabBar(
//               labelColor: Color(0xFFC41A3B),
//               unselectedLabelColor: Colors.white,
//               labelStyle: TextStyle(fontSize: 10.0),
//               // indicator: UnderlineTabIndicator(
//               //   borderSide: BorderSide(color: Colors.black54, width: 0.0),
//               //   insets: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 40.0),
//               // ),
//               //For Indicator Show and Customization
//               // indicatorColor: Colors.black54,
//               tabs: <Widget>[
//                 Tab(
//                   icon: Icon(
//                     Icons.home,
//                     size: 24.0,
//                   ),
//                   text: 'Home',
//                 ),
//                 Tab(
//                   icon: Icon(
//                     Icons.star,
//                     size: 24.0,
//                   ),
//                   text: 'Favourite',
//                 ),
//                 Tab(
//                   icon: Icon(
//                     Icons.location_on,
//                     size: 24.0,
//                   ),
//                   text: 'Location',
//                 ),
//                 Tab(
//                   icon: Icon(
//                     Icons.account_box,
//                     size: 24.0,
//                   ),
//                   text: 'About Us',
//                 ),
//                 Tab(
//                   icon: Icon(
//                     Icons.graphic_eq,
//                     size: 24.0,
//                   ),
//                   text: 'Promotion',
//                 ),
//               ],
//               controller: _tabController,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


