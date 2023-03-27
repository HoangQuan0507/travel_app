import 'package:flutter/material.dart';
import 'package:travel_app/core/helpers/image_helper.dart';

import '../../core/constants/dismension_constants.dart';
import '../../core/helpers/asset_helper.dart';

class ItemUtilityWidget extends StatelessWidget {
  ItemUtilityWidget({Key? key}) : super(key: key);

  final List<Map<String, String>> listUnitily = [
    {'icon': AssetHelper.icoWifi, 'name': 'Free\nWifi'},
    {'icon': AssetHelper.icoNonRefund, 'name': 'Non-\nRefundable'},
    {'icon': AssetHelper.icoBreakfast, 'name': 'Free-\nBreakfast'},
    {'icon': AssetHelper.icoNonSmoke, 'name': 'Non-\nSmoking'},
  ];

  Widget _builItemUtilityHotel(String icon, String title) {
    return Column(
      children: [
        ImageHelper.loadFromAsset(
          icon,
        ),
        SizedBox(
          height: kTopPadding,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: kDefaultPadding,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: listUnitily.map((e) => _builItemUtilityHotel(e['icon']!, e['name']!)).toList(),
      ),
    );
  }
}
