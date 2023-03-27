import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:travel_app/core/constants/dismension_constants.dart';
import 'package:travel_app/representation/screens/app_bar_container.dart';
import 'package:travel_app/representation/widgets/button_widget.dart';

import '../../core/constants/color_constants.dart';

class SelectDateScreen extends StatelessWidget{

  static const String routeName ='/select_date_screen';

  DateTime? rangeStartDate;
  DateTime? rangeEndDate;

  SelectDateScreen({super.key});

  
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Select date',
      child: Column(
        children:  [
          SizedBox(
            height: kMediumPadding * 1.5,
          ),
          SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            monthViewSettings: DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
            selectionColor: ColorPalette.yellowColor,
            startRangeSelectionColor: ColorPalette.yellowColor,
            endRangeSelectionColor: ColorPalette.yellowColor,
            rangeSelectionColor: ColorPalette.yellowColor.withOpacity(0.25),
            todayHighlightColor: ColorPalette.yellowColor,
            toggleDaySelection: true,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              if (args.value is PickerDateRange) {
                rangeStartDate = args.value.startDate;
                rangeEndDate = args.value.endDate;
              }
              else{
                rangeStartDate = null;
                rangeEndDate = null;
              }
            },
          ),
          ButtonWidget(data:
            'Select',
            onTap: () {
            Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
            },
          ),
          SizedBox(height: kDefaultPadding,),
          ButtonWidget(data:
          'Cancel',
            onTap: () {
              Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
            },
          ),
        ],
      ),
    );
  }
  
}
