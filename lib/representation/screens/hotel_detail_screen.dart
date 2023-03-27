import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dismension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/data/models/hotel_model.dart';
import 'package:travel_app/representation/screens/select_room_screen.dart';
import 'package:travel_app/representation/widgets/button_widget.dart';

import '../widgets/item_utility_widget.dart';

class HotelDetailScreen extends StatefulWidget {
  const HotelDetailScreen({Key? key, required this.hotelModel})
      : super(key: key);

  static const String routeName = '/hotel_detail_screen';

  final HotelModel hotelModel;

  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageHelper.loadFromAsset(AssetHelper.hotelScreen,
                fit: BoxFit.fill),
          ),
          Positioned(
            top: kMediumPadding * 3,
            left: kMediumPadding,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    kDefaultPadding,
                  ),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(kItemPadding),
                child: Icon(
                  FontAwesomeIcons.arrowLeft,
                  size: kDefaultPadding,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            top: kMediumPadding * 3,
            right: kMediumPadding,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    kDefaultPadding,
                  ),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(kItemPadding),
                child: Icon(
                  FontAwesomeIcons.solidHeart,
                  size: kDefaultPadding,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            maxChildSize: 0.8,
            minChildSize: 0.3,
            builder: (context, scrollController) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 2),
                    topRight: Radius.circular(kDefaultPadding * 2),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: kItemPadding),
                      height: 5,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(kItemPadding),
                        ),
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.hotelModel.hotelName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '\$${widget.hotelModel.price}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(' /night')
                            ],
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Row(
                            children: [
                              ImageHelper.loadFromAsset(
                                (AssetHelper.icoLocationBlank),
                              ),
                              SizedBox(
                                width: kMediumPadding,
                              ),
                              Text(widget.hotelModel.location),
                            ],
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Row(
                            children: [
                              ImageHelper.loadFromAsset(
                                (AssetHelper.icoStar),
                              ),
                              SizedBox(
                                width: kMediumPadding,
                              ),
                              Text('${widget.hotelModel.star}/5'),
                              Text(
                                '(${widget.hotelModel.numberOfReview})',
                                style: TextStyle(
                                    color: ColorPalette.subTitleColor),
                              )
                            ],
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Text(
                            'Infomation',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Text(
                            '''You will find every comfort because many of the services that the hotel offers for travellers and of course the hotel is very comfortable.''',
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          ItemUtilityWidget(),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Text(
                            'Location',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Text(
                            '''Located in the famous neighborhood of Seoul, Grand Luxury’s is set in a building built in the 2010s.''',
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          ImageHelper.loadFromAsset(AssetHelper.imageMap,),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          ButtonWidget(data: 'Select Rroom',
                          onTap: () {
                            Navigator.of(context).pushNamed(SelectRoomScreen.routeName);
                          },),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
