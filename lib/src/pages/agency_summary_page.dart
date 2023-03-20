import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:the_citizen_app/src/helpers/route.dart';

import '../config/app_theme.dart';
import '../helpers/hex_color.dart';

class AgencySummaryPage extends StatefulWidget {
  @override
  State<AgencySummaryPage> createState() => _AgencySummaryPageState();
}

class _AgencySummaryPageState extends State<AgencySummaryPage> {
  List<String> _locations = [
    'Mobile Apps',
  ];
  final ScrollController scrollController = ScrollController();

  // Option 2
  String? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppTheme.backgroundColor,
        iconTheme: IconThemeData(
          color: AppTheme.textColor6,
        ),
        leading: GestureDetector(
            onTap: () {
              back();
            },
            child: Icon(Icons.arrow_back)),
        title: Text(
          'Agency Summary',
          style: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 18.0,
            color: AppTheme.appBarTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 5),
          child: Column(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Unit',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 13.0,
                    color: hexToColor('#72778F'),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  height: 60,
                  child: DropdownButton(
                    isExpanded: true,
                    iconSize: 24,
                    elevation: 16,
                    underline: Container(
                      height: 1.5,
                      color: hexToColor('#A3CCDC'),
                    ),
                    icon: ImageIcon(
                      AssetImage("assets/images/down_arrow.png"),
                      color: Color(0xFF8C8D92),
                    ),
                    items: _locations.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                    hint: Container(
                      child: Text(
                        'Mobile Apps',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 14.0,
                          color: hexToColor('#141C44'),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        selectedLocation = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 13.0,
                    color: hexToColor('#72778F'),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  height: 60,
                  child: DropdownButton(
                    isExpanded: true,
                    iconSize: 24,
                    elevation: 16,
                    underline: Container(
                      height: 1.5,
                      color: hexToColor('#A3CCDC'),
                    ),
                    icon: ImageIcon(
                      AssetImage("assets/images/down_arrow.png"),
                      color: Color(0xFF8C8D92),
                    ),
                    items: _locations.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                    hint: Container(
                      child: Text(
                        'All Locations',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 14.0,
                          color: hexToColor('#141C44'),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        selectedLocation = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Type',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 13.0,
                    color: hexToColor('#72778F'),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  height: 60,
                  child: DropdownButton(
                    isExpanded: true,
                    iconSize: 24,
                    elevation: 16,
                    underline: Container(
                      height: 1.5,
                      color: hexToColor('#A3CCDC'),
                    ),
                    icon: ImageIcon(
                      AssetImage("assets/images/down_arrow.png"),
                      color: Color(0xFF8C8D92),
                    ),
                    items: _locations.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                    hint: Container(
                      child: Text(
                        'Select one',
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 14.0,
                          color: hexToColor('#141C44'),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        selectedLocation = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: (AdaptiveScrollbar(
                underColor: hexToColor('#EFEFEF'),
                sliderDefaultColor: hexToColor('#D9D9D9'),
                sliderActiveColor: hexToColor('#D9D9D9'),
                controller: scrollController,
                width: 5,
                sliderHeight: 102,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: DataTable(
                            headingRowHeight: 35,
                            columnSpacing: 20,
                            showCheckboxColumn: false,
                            horizontalMargin: 10,
                            dividerThickness: 1,
                            showBottomBorder: true,
                            headingRowColor: MaterialStateColor.resolveWith(
                                (states) => hexToColor('#EFF6FF')),
                            columns: <DataColumn>[
                              DataColumn(
                                  label: Text(
                                "Subject",
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontSize: 15.0,
                                  color: hexToColor('#141C44'),
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                              DataColumn(
                                  label: Text(
                                "Today",
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontSize: 15.0,
                                  color: hexToColor('#141C44'),
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                              DataColumn(
                                  label: Text(
                                "This Week",
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontSize: 15.0,
                                  color: hexToColor('#141C44'),
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                              DataColumn(
                                  numeric: false,
                                  label: Text(
                                    "This Month",
                                    style: TextStyle(
                                      fontFamily: 'Manrope',
                                      fontSize: 15.0,
                                      color: hexToColor('#141C44'),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )),
                              DataColumn(
                                  label: Text(
                                "This year",
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontSize: 15.0,
                                  color: hexToColor('#141C44'),
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                              DataColumn(
                                  label: Text(
                                "Total to Date",
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontSize: 15.0,
                                  color: hexToColor('#141C44'),
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                            ],
                            rows: [
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(
                                    '',
                                    style: TextStyle(
                                      fontFamily: 'Manrope',
                                      fontSize: 12.0,
                                      color: hexToColor('#524B6B'),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )),
                                  DataCell(Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontSize: 12.0,
                                        color: hexToColor('#524B6B'),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )),
                                  DataCell(Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontSize: 12.0,
                                        color: hexToColor('#524B6B'),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )),
                                  DataCell(Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontSize: 12.0,
                                        color: hexToColor('#524B6B'),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )),
                                  DataCell(Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontSize: 12.0,
                                        color: hexToColor('#524B6B'),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )),
                                  DataCell(Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontSize: 12.0,
                                        color: hexToColor('#524B6B'),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )),
                                ],
                              ),
                            ]))),
              )),
            ),
          ])),
    );
  }
}
