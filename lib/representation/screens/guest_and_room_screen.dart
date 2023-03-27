import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dismension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representation/screens/app_bar_container.dart';

import '../widgets/button_widget.dart';
import '../widgets/item_change_guest_and_room_screen.dart';

class GuestAndRoomScreen extends StatefulWidget {
  const GuestAndRoomScreen({Key? key}) : super(key: key);

  static const String routeName = '/guest_and_room_screen';

  @override
  State<GuestAndRoomScreen> createState() => _GuestAndRoomScreenState();
}

class _GuestAndRoomScreenState extends State<GuestAndRoomScreen> {

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Add Guest And Room',
      child: Column(
        children:  [
          SizedBox(
            height: kMediumPadding * 1.5,
          ),
          ItemChangeGuestAndRoom(
            title: 'Guest',
            icon: AssetHelper.icoGuest,
            initData: 2,
          ),
          ItemChangeGuestAndRoom(
            title: 'Room',
            icon: AssetHelper.icoRoom,
            initData: 1,
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          ButtonWidget(data:
          'Select',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          SizedBox(height: kDefaultPadding,),
          ButtonWidget(data:
          'Cancel',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),);
  }
}
