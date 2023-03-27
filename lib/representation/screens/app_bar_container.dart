import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dismension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';

import '../../core/constants/textstyle_constants.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer(
      {Key? key,
      required this.child,
      this.title,
      this.implementLeading = true,
      this.titleString,
      this.implementTraLing = true})
      : super(key: key);

  final Widget child;
  final Widget? title;
  final String? titleString;
  final bool implementLeading;
  final bool implementTraLing;

  get subTitleString => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 186,
            child: AppBar(
              title: title ??
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (implementLeading)
                          GestureDetector(
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
                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  titleString ?? '',
                                  style: TextStyles.defaultStyle.fontHeader.whiteTextColor.bold,
                                ),
                                if (subTitleString != null)
                                  Padding(
                                    padding: const EdgeInsets.only(top: kMediumPadding),
                                    child: Text(
                                      subTitleString!,
                                      style: TextStyles.defaultStyle.fontCaption.whiteTextColor,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        if (implementTraLing)
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                kDefaultPadding,
                              ),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(kItemPadding),
                            child: Icon(
                              FontAwesomeIcons.bars,
                              size: kDefaultPadding,
                              color: Colors.black,
                            ),
                          ),
                      ],
                    ),
                  ),
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xff8F67E8), Color(0xff6357CC)],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: ImageHelper.loadFromAsset(
                      AssetHelper.icoOvalTop,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: ImageHelper.loadFromAsset(
                      AssetHelper.icoOvalBottom,
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 90,
              backgroundColor: ColorPalette.backgroundScaffoldColor,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 156),
            padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
            child: child,
          ),
        ],
      ),
    );
  }
}
