import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_log.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/helpers/route.dart';
import 'package:the_citizen_app/src/pages/search_officers_page.dart';

class LocationTracesPage extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              back();
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        centerTitle: true,
        backgroundColor: AppTheme.backgroundColor,
        iconTheme: IconThemeData(
          color: AppTheme.textColor6,
        ),
        title: KText(
          text: "Location Traces",
          bold: true,
          color: AppTheme.appBarTextColor,
        ),
      ),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              InkWell(
                focusColor: AppTheme.textColor1,
                splashColor: AppTheme.textColor1,
                highlightColor: AppTheme.textColor1,
                borderRadius: BorderRadius.zero,
                onTap: () async {
                  locationTraceC.selectedOfficer.value = '';
                  kLog(locationTraceC.selectedOfficer.value);
                  push(SearchOfficersPage());
                },
                child: Container(
                  padding: EdgeInsets.only(left: 5),
                  margin: EdgeInsets.only(bottom: 15),
                  width: Get.width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppTheme.textColor1, //remove color to make it transpatent
                    border: Border.all(
                      width: 1,
                      style: BorderStyle.solid,
                      color: Colors.grey,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      KText(
                        text: locationTraceC.selectedOfficer.value != '' ? locationTraceC.selectedOfficer.value : 'Search Officer..',
                        bold: locationTraceC.selectedOfficer.value != '' ? true : false,
                      ),
                      IconButton(
                        padding: const EdgeInsets.all(0.0),
                        icon: (locationTraceC.query.value.isEmpty)
                            ? Icon(Icons.search)
                            : (locationTraceC.query.value == '')
                                ? Icon(Icons.search)
                                : Icon(Icons.close),
                        onPressed: () {
                          locationTraceC.selectedOfficer.value = '';
                          kLog(locationTraceC.selectedOfficer.value);
                          push(SearchOfficersPage());
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                margin: EdgeInsets.only(bottom: 15),
                width: Get.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppTheme.textColor1, //remove color to make it transpatent
                  // border: Border.all(
                  //   width: 1,
                  //   style: BorderStyle.solid,
                  //   color: Colors.grey,
                  // ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    KText(
                      text: locationTraceC.selectedDate.value != '' ? locationTraceC.selectedDate.value : 'Select your date',
                      bold: locationTraceC.selectedDate.value != '' ? true : false,
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(0.0),
                      icon: Icon(Icons.calendar_month),
                      onPressed: () {
                        locationTraceC.selectDate();
                        //  locationTraceC.selectedDate.value != '' ? locationTraceC.getLocation() : null;
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    FlutterMap(
                      mapController: locationTraceC.mapCtl,
                      options: MapOptions(
                        center: LatLng(locationC.latLng.value.latitude, locationC.latLng.value.longitude),
                        zoom: 13,
                        maxZoom: 90,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          //urlTemplate: "http://123.49.35.90:8088/tilesBD/{z}/{x}/{y}.png",
                          // userAgentPackageName: ['a', 'b', 'c'],
                        ),
                        CircleLayer(circles: [
                          CircleMarker(
                              point: LatLng(locationC.latLng.value.latitude, locationC.latLng.value.longitude),
                              radius: 10,
                              borderStrokeWidth: 2,
                              color: Colors.lightBlue,
                              borderColor: Colors.blue)
                        ]),
                        MarkerLayer(markers: locationTraceC.pointMarker),
                        PolylineLayer(
                          polylineCulling: false,
                          polylines: locationTraceC.polyline,
                        ),
                      ],
                    ),
                    Positioned(
                      right: 15.0,
                      top: 20,
                      child: Container(
                        // padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueGrey,
                              spreadRadius: 1,
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: FloatingActionButton.small(
                          shape: StadiumBorder(),
                          elevation: 0,
                          heroTag: 'show_current_position_button',
                          onPressed: () async {
                            locationTraceC.mapCtl.move(LatLng(locationC.latLng.value.latitude, locationC.latLng.value.longitude), 15);

                            locationTraceC.getLocation();
                          },
                          backgroundColor: hexToColor('#B9B9B9'),
                          child: Image.asset(
                            'assets/icons/icon_my_location_map.png',
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                            color: hexToColor('#FFFFFF'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
