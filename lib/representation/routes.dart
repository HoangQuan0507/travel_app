import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/data/models/hotel_model.dart';
import 'package:travel_app/representation/screens/check_out_screen.dart';
import 'package:travel_app/representation/screens/guest_and_room_screen.dart';
import 'package:travel_app/representation/screens/hotel_booking_screen.dart';
import 'package:travel_app/representation/screens/hotel_detail_screen.dart';
import 'package:travel_app/representation/screens/hotel_screen.dart';
import 'package:travel_app/representation/screens/intro_screen.dart';
import 'package:travel_app/representation/screens/main_app.dart';
import 'package:travel_app/representation/screens/select_date_screen.dart';
import 'package:travel_app/representation/screens/select_room_screen.dart';
import 'package:travel_app/representation/screens/splash_screen.dart';

import '../data/models/room_model.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainApp.routeName: (context) => const MainApp(),
  HotelScreen.routeName: (context) => const HotelScreen(),
  HotelBookingScreen.routeName: (context) => const HotelBookingScreen(),
  SelectDateScreen.routeName: (context) => SelectDateScreen(),
  GuestAndRoomScreen.routeName: (context) => GuestAndRoomScreen(),
  SelectRoomScreen.routeName: (context) => SelectRoomScreen(),

};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case HotelDetailScreen.routeName:
      return MaterialPageRoute(
          builder: (context) {
        final HotelModel hotelModel = (settings.arguments as HotelModel);
        return HotelDetailScreen(
          hotelModel: hotelModel,
        );
      });
    case CheckOutScreen.routeName:
      final RoomModel roomModel = (settings.arguments as RoomModel);
      return MaterialPageRoute<dynamic>(
        settings: settings,
        builder: (context) => CheckOutScreen(
          roomModel: roomModel,
        ),
      );

    // case HotelBookingScreen.routeName:
    //   final String? destination = (settings.arguments as String?);
    //   return MaterialPageRoute<dynamic>(
    //     settings: settings,
    //     builder: (context) => HotelBookingScreen(
    //       destination: destination,
    //     ),
    //   );
    // default:
    //   return null;
  }
}
