import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dismension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';

class ItemBookingWidget extends StatelessWidget {
  const ItemBookingWidget(
      {Key? key,
      required this.icon,
      required this.title,
      required this.description, this.ontap})
      : super(key: key);

  final String icon;
  final String title;
  final String description;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(
          kDefaultPadding,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(kItemPadding)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  icon,
                  width: 36,
                  height: 36,
                ),
                SizedBox(
                  width: kDefaultPadding,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                    ),
                    SizedBox(
                      height: kItemPadding,
                    ),
                    Text(description,style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
