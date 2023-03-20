import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';

import 'package:latlong2/latlong.dart';
import 'package:metooltip/metooltip.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/k_log.dart';

class HomeScreenOsmMap extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    FlutterMap(
                      mapController: mapC.mapCtl,
                      options: MapOptions(
                        center: mapC.latLong != null
                            ? mapC.latLong
                            : LatLng(locationC.latLng.value.latitude, locationC.latLng.value.longitude),
                        //   center: state.centerLatLng ?? GlobalVariables.ctsOfficeLatLng,
                        // zoom: 15.0,
                        // minZoom: 1.0,
                        /* onPositionChanged: (MapPosition position, bool hasGesture) {
                          context.read<HomeBloc>().add(ShowMapVewChange(centerLatLng: position.center));
                        },*/
                      ),
                      children: [
                        TileLayer(
                          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          //urlTemplate: "http://123.49.35.90:8088/tilesBD/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c'],
                        ),
                        CircleLayer(circles: [
                          CircleMarker(
                              point: LatLng(locationC.latLng.value.latitude, locationC.latLng.value.longitude),
                              radius: 10,
                              borderStrokeWidth: 2,
                              color: Colors.lightBlue,
                              borderColor: Colors.blue)
                        ]),
                        MarkerLayer(markers: mapC.markers),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          // state.agencies.isNotEmpty ?
                          /*genButton(
                                    () {
                                      context.read<HomeBloc>().add(GetAssignShoutForMe());
                                    },
                                    Icons.location_history,
                                    'AssignShoutForMe',
                                    buttonColor: Colors.green,
                                  )*/
                          //buttonColor: state.isShowAssignShout ? Colors.green : AppColors.buttonColor)

                          if (agencyC.selectedAgency!.agencyId!.isNotEmpty)
                            Align(
                              alignment: Alignment.centerRight,
                              child: MeTooltip(
                                margin: EdgeInsets.only(left: 222.0),
                                triangleColor: Colors.white,
                                message: "My Shouts",
                                allOffset: 0,
                                preferOri: PreferOrientation.left,
                                textStyle: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontSize: 10.0,
                                  color: AppTheme.textColor6,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                // triangleColor: Colors.white,
                                child: (genButton(
                                  () {
                                    kLog('value');
                                    mapC.getShouts();
                                    //     context.read<HomeBloc>().add(GetMyShout());
                                  },
                                  'assets/icons/icon_my_shouts_map.png',
                                  //Icons.location_history,
                                  'MyShout',
                                  buttonColor: AppTheme.textColor31,
                                  // state.colorMyShout == true ? Colors.green : textColor31,
                                )),
                              ),
                            ),
                          if (agencyC.selectedAgency!.agencyId!.isNotEmpty)
                            Align(
                              alignment: Alignment.centerRight,
                              child: MeTooltip(
                                margin: EdgeInsets.only(left: 198.0),
                                triangleColor: Colors.white,
                                message: 'Assigned to Me',
                                allOffset: 0,
                                preferOri: PreferOrientation.left,
                                textStyle: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontSize: 10.0,
                                  color: AppTheme.textColor6,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                //   triangleColor: Colors.white,
                                child: genButton(
                                  () {
                                    //    context.read<HomeBloc>().add(GetAssignShoutForMe());
                                  },
                                  'assets/icons/icon_assigned_shouts_map.png',
                                  //Icons.location_history,
                                  'AssignShoutForMe',
                                  buttonColor: Color(0xFFA3CCDC),
                                  //state.colorAssignShout == true ? textColor40 : borderColor,
                                ),
                              ),
                            ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: MeTooltip(
                              margin: EdgeInsets.only(left: 190.0),
                              triangleColor: Colors.white,
                              message: 'Current Location',
                              allOffset: 0,
                              preferOri: PreferOrientation.left,
                              textStyle: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 10.0,
                                color: AppTheme.textColor6,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              //  triangleColor: Colors.white,
                              child: genButton(
                                () {
                                  mapC.mapCtl.move(LatLng(locationC.latLng.value.latitude, locationC.latLng.value.longitude), 15);
                                  // context.read<HomeBloc>().add(
                                  //   ShowMapViewChange(centerLatLng: state.currentPositionLatLng),
                                  // );
                                  // _mapCtl.move(state.currentPositionLatLng, 15);
                                },
                                'assets/icons/icon_my_location_map.png',
                                //Icons.location_searching,
                                "positionChange",
                                //  buttonColor: state.colorCurrentLocation == true ? Colors.blueGrey : textColor32,
                                buttonColor: AppTheme.textColor32,
                              ),
                            ),
                          ),
                          //    ((state.homeScreenMapStatus == HomeScreenMapStatus.SHOUT_FETCHING) ?
                          //     Center(
                          //       child: CircularProgressIndicator(),
                          //     ),
                          //   : SizedBox()
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            MeTooltip(
                              message: 'Assigned',
                              allOffset: 5,
                              triangleColor: Colors.white,
                              preferOri: PreferOrientation.up,
                              textStyle: TextStyle(
                                fontFamily: 'Mangrove',
                                fontSize: 10.0,
                                color: AppTheme.textColor6,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              //    triangleColor: Colors.white,
                              child: Container(
                                width: 30,
                                height: 15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppTheme.textColor33,
                                  //remove color to make it transpatent
                                  border: Border.all(
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                    color: AppTheme.textColor1,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 11,
                            ),
                            MeTooltip(
                              message: 'Started',
                              allOffset: 5,
                              triangleColor: Colors.white,
                              preferOri: PreferOrientation.up,
                              textStyle: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 10.0,
                                color: AppTheme.textColor6,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              //  triangleColor: Colors.white,
                              child: Container(
                                width: 30,
                                height: 15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppTheme.textColor10,
                                  //remove color to make it transpatent
                                  border: Border.all(
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                    color: AppTheme.textColor1,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 11,
                            ),
                            MeTooltip(
                              triangleColor: Colors.white,
                              message: 'My Shouts',
                              allOffset: 5,
                              preferOri: PreferOrientation.up,
                              textStyle: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 10.0,
                                color: AppTheme.textColor6,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              //   triangleColor: Colors.white,
                              child: Container(
                                width: 30,
                                height: 15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppTheme.textColor17,
                                  //remove color to make it transpatent
                                  border: Border.all(
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                    color: AppTheme.textColor1,
                                  ),
                                ),
                              ),
                            ),
                            // Tooltip(
                            //   waitDuration: Duration(seconds: 1),
                            //   showDuration: Duration(seconds: 2),
                            //   padding: EdgeInsets.only(left: 15, right: 15, bottom: 12, top: 12),
                            //   height: 19,
                            //   preferBelow: false,
                            //   textStyle: TextStyle(
                            //     fontFamily: 'Manrope',
                            //     fontSize: 10.0,
                            //     color: textColor6,
                            //     fontWeight: FontWeight.w400,
                            //   ),
                            //
                            //   decoration: ShapeDecoration(
                            //     shape: ToolTipCustomShape(),
                            //     color: Colors.white,
                            //   ),
                            //   // decoration: BoxDecoration(
                            //   //     // Set your color here
                            //   //     borderRadius: BorderRadius.circular(5),
                            //   //     color: Colors.white,
                            //   //
                            //   // ),
                            //   // verticalOffset: 100,
                            //   // triggerMode: TooltipTriggerMode.manual,
                            //   message: 'My Shouts',
                            //   child: Container(
                            //     width: 30,
                            //     height: 15,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(5),
                            //       color: textColor17, //remove color to make it transpatent
                            //       border: Border.all(
                            //         width: 1.0,
                            //         style: BorderStyle.solid,
                            //         color: textColor1,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget genButton(
    Function() function,
    String icon,
    String heroTag, {
    Color? buttonColor,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Column(
          children: [
            FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
              onPressed: function,
              //  () {
              //   kLog('value');
              //   mapC.getShouts();
              // },
              heroTag: heroTag,
              materialTapTargetSize: MaterialTapTargetSize.padded,
              backgroundColor: buttonColor ?? buttonColor,
              child: Image.asset(
                icon,
                width: 45,
                height: 45,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget genIconButton(Function function, Widget imageIcon, String heroTag, {Color? buttonColor}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: FloatingActionButton(
                onPressed: () {},
                heroTag: heroTag,
                materialTapTargetSize: MaterialTapTargetSize.padded,
                // backgroundColor: buttonColor ?? AppTheme.buttonColor,
                child: imageIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
