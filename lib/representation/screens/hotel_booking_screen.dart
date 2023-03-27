import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dismension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representation/screens/app_bar_container.dart';
import 'package:travel_app/representation/screens/guest_and_room_screen.dart';
import 'package:travel_app/representation/screens/hotel_screen.dart';
import 'package:travel_app/representation/screens/select_date_screen.dart';
import 'package:travel_app/representation/widgets/button_widget.dart';
import 'package:travel_app/representation/widgets/item_booking_widget.dart';
import 'package:travel_app/core/extensions/date_ext.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({Key? key}) : super(key: key);

  static const String routeName = '/hotel_booking_screen';

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? dateSlected;

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Hotel booking',
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: kMediumPadding * 2,
            ),
            ItemBookingWidget(
              icon: AssetHelper.icoLocation,
              title: 'Destination',
              description: 'South Korea',
              ontap: () {},
            ),
            SizedBox(
              height: kMediumPadding,
            ),
            ItemBookingWidget(
              icon: AssetHelper.icoCalendal,
              title: 'Select date',
              description: dateSlected ?? '13 Feb - 18 Feb 2021',
              ontap: () async {
                final result = await Navigator.of(context)
                    .pushNamed(SelectDateScreen.routeName);
                if (!(result as List<DateTime?>)
                    .any((element) => element == null)) {
                  dateSlected =
                      '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                  setState(() {});
                }
              },
            ),
            SizedBox(
              height: kMediumPadding,
            ),
            ItemBookingWidget(
              icon: AssetHelper.icoBed,
              title: 'Guest and Room ',
              description: '2 Guest, 1 Room',
              ontap: () {
                Navigator.of(context).pushNamed(GuestAndRoomScreen.routeName);
              },
            ),
            SizedBox(
              height: kMediumPadding,
            ),
            ButtonWidget(
              data: 'Search',
              onTap: () {
                Navigator.of(context).pushNamed(HotelScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
