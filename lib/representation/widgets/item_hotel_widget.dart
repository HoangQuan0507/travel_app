import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dismension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/data/models/hotel_model.dart';
import 'package:travel_app/representation/screens/hotel_detail_screen.dart';
import 'package:travel_app/representation/widgets/button_widget.dart';
import 'package:travel_app/representation/widgets/dashline_widget.dart';

import '../../core/constants/textstyle_constants.dart';

class ItemHotelWidget extends StatelessWidget {
  const ItemHotelWidget({Key? key, required this.hotelModel, this.onTap})
      : super(key: key);

  final HotelModel hotelModel;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(bottom: kMediumPadding),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(right: kDefaultPadding),
            child: ImageHelper.loadFromAsset(hotelModel.hotelImage,
                radius: BorderRadius.only(
                  topLeft: Radius.circular(
                    kDefaultPadding,
                  ),
                  bottomRight: Radius.circular(
                    kDefaultPadding,
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(
              kDefaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelModel.hotelName,
                  style: TextStyles.defaultStyle.fontHeader.bold,
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(AssetHelper.icoLocationBlank),
                    SizedBox(
                      width: kMinPadding,
                    ),
                    Text(hotelModel.location),
                    Text(
                      ' -${hotelModel.awayKilometer} from destination',
                      style: TextStyles.defaultStyle.subTitleTextColor.fontCaption,
                      maxLines: 2,
                     // overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(AssetHelper.icoStar),
                    SizedBox(
                      width: kDefaultPadding,
                    ),
                    Text(hotelModel.star.toString()),
                    Text(
                      '( ${hotelModel.awayKilometer} reviews)',
                      style: TextStyles.defaultStyle.subTitleTextColor,
                    ),
                  ],
                ),
                DashLineWidget(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$${hotelModel.price.toString()}',
                            style: TextStyles.defaultStyle.fontHeader.bold,
                          ),
                          SizedBox(
                            height: kMinPadding,
                          ),
                          Text(
                            '/night',
                            style: TextStyles.defaultStyle.fontCaption,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ButtonWidget(
                        data: 'Book a room',
                        onTap:  () {
                          Navigator.of(context).pushNamed(
                              HotelDetailScreen.routeName,
                              arguments: hotelModel);
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
