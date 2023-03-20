import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/helpers/route.dart';

class MyTeamLocationPage extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    //  teamLocationC.getMyAgencyTeamMember();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              teamLocationC.myTeam.clear();
              teamLocationC.myTeamMember.clear();
              teamLocationC.myTeamMembers.clear();
              back();
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        centerTitle: true,
        backgroundColor: AppTheme.backgroundColor,
        iconTheme: IconThemeData(
          color: AppTheme.textColor6,
        ),
        title: KText(
          text: "My Team Locations",
          bold: true,
          color: AppTheme.appBarTextColor,
        ),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () async {})],
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return Column(
            children: [
              Expanded(
                child: Obx(
                  () => Stack(
                    children: [
                      FlutterMap(
                        mapController: teamLocationC.mapCtl,
                        options: MapOptions(
                          center:
                              // teamLocationC.latLong != null
                              //     ? teamLocationC.latLong
                              //     :
                              LatLng(locationC.latLng.value.latitude, locationC.latLng.value.longitude),
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
                          MarkerLayer(markers: teamLocationC.teamMemberMarker),
                        ],
                      ),
                      Positioned(
                        right: 15.0,
                        bottom: 100,
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey,
                                spreadRadius: 1,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: FloatingActionButton(
                            shape: StadiumBorder(),
                            elevation: 0,
                            heroTag: 'refresh_button',
                            onPressed: () {
                              teamLocationC.myTeam.clear();
                              teamLocationC.myTeamMember.clear();
                              teamLocationC.myTeamMembers.clear();
                              teamLocationC.getMyAgencyTeamMember();
                            },
                            backgroundColor: hexToColor('#E8AA96'),
                            child: Image.asset(
                              'assets/icons/about_us_icon.png',
                              width: 45,
                              height: 45,
                              fit: BoxFit.cover,
                              color: hexToColor('#FFFFFF'),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 15.0,
                        bottom: 20,
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey,
                                spreadRadius: 1,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: FloatingActionButton(
                            shape: StadiumBorder(),
                            elevation: 0,
                            heroTag: 'show_current_position_button',
                            onPressed: () async {
                              teamLocationC.mapCtl.move(LatLng(locationC.latLng.value.latitude, locationC.latLng.value.longitude), 15);
                            },
                            backgroundColor: hexToColor('#B9B9B9'),
                            child: Image.asset(
                              'assets/icons/icon_my_location_map.png',
                              width: 45,
                              height: 45,
                              fit: BoxFit.cover,
                              color: hexToColor('#FFFFFF'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
