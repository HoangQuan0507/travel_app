import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dismension_constants.dart';
import 'package:travel_app/representation/screens/home_screen.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  static const routeName = 'main_app';

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  int _crrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _crrentIndex,
        children: [
          HomeScreen(),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.amber,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.orange,
          ),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _crrentIndex,
        onTap: (index) {
          setState(() {
            _crrentIndex = index;
          });
        },
        selectedItemColor: ColorPalette.primaryColor,
        unselectedItemColor: ColorPalette.primaryColor.withOpacity(0.2),
        margin: EdgeInsets.symmetric(
            horizontal: kMediumPadding, vertical: kMediumPadding),
        items: [
          SalomonBottomBarItem(
              icon: Icon(
                FontAwesomeIcons.house,
                size: kMediumPadding,
              ),
              title: Text('Home')),
          SalomonBottomBarItem(
              icon: Icon(
                FontAwesomeIcons.solidHeart,
                size: kMediumPadding,
              ),
              title: Text('Likes')),
          SalomonBottomBarItem(
              icon: Icon(
                FontAwesomeIcons.briefcase,
                size: kMediumPadding,
              ),
              title: Text('Booking')),
          SalomonBottomBarItem(
              icon: Icon(
                FontAwesomeIcons.solidUser,
                size: kMediumPadding,
              ),
              title: Text('Profile')),
        ],
      ),
    );
  }
}
