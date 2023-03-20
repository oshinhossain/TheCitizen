import 'package:flutter/material.dart';

import '../config/app_theme.dart';
import '../config/base.dart';

class BottomNavigationComponent extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      color: AppTheme.appFooterColor,
      padding: EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: MaterialButton(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                menuC.currentIndex.value = 0;
                print(menuC.currentIndex.value);
              },
              textColor: Color(0xFFF6FAFC),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageIcon(
                    AssetImage('assets/images/bottom_shout_icon.png'),
                    color: menuC.currentIndex.value == 0
                        ? AppTheme.focusedLineColor
                        : Colors.white,
                    size: 24.0,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'SHOUT',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 8.5,
                      color: menuC.currentIndex.value == 0
                          ? AppTheme.focusedLineColor
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            flex: 1,
          ),
          Flexible(
            child: MaterialButton(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                menuC.currentIndex.value = 1;
                print(menuC.currentIndex.value);
              },
              textColor: Color(0xFFF6FAFC),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageIcon(
                    AssetImage('assets/images/bottom_sync_icon.png'),
                    color: menuC.currentIndex.value == 1
                        ? AppTheme.focusedLineColor
                        : Colors.white,
                    size: 24.0,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'SYNC',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 8.5,
                      color: menuC.currentIndex.value == 1
                          ? AppTheme.focusedLineColor
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            flex: 1,
          ),
          Flexible(
            child: MaterialButton(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                if (menuC.isHomeActive.value && menuC.currentIndex.value == 2) {
                  menuC.currentIndex.value = 3;
                  menuC.isHomeActive.value = false;
                  print(menuC.currentIndex.value);
                } else {
                  menuC.currentIndex.value = 2;

                  menuC.isHomeActive.value = true;
                  print(menuC.currentIndex.value);
                }
              },
              textColor: Color(0xFFF6FAFC),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageIcon(
                    AssetImage(menuC.isHomeActive.value &&
                            menuC.currentIndex.value == 2
                        ? 'assets/images/bottom_map_icon.png'
                        : 'assets/images/bottom_home_icon.png'),
                    color: menuC.currentIndex.value == 2 ||
                            menuC.currentIndex.value == 3
                        ? AppTheme.focusedLineColor
                        : Colors.white,
                    size: 24.0,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    menuC.isHomeActive.value && menuC.currentIndex.value == 2
                        ? 'MAP'
                        : 'HOME',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 8.5,
                      color: menuC.currentIndex.value == 2 ||
                              menuC.currentIndex.value == 3
                          ? AppTheme.focusedLineColor
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            flex: 1,
          ),

          Flexible(
            child: MaterialButton(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                menuC.currentIndex.value = 4;
                print(menuC.currentIndex.value);
              },
              textColor: Color(0xFFF6FAFC),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageIcon(
                    AssetImage('assets/images/bottom_list_icon.png'),
                    color: menuC.currentIndex.value == 4
                        ? AppTheme.focusedLineColor
                        : Colors.white,
                    size: 24.0,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'LIST',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 8.5,
                      color: menuC.currentIndex.value == 4
                          ? AppTheme.focusedLineColor
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            flex: 1,
          ),
          Flexible(
            child: MaterialButton(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                menuC.currentIndex.value = 5;
                print(menuC.currentIndex.value);
                // if (!Utility.isEmptyString(
                //     CtsSharedPreferences.getString('agencyId'))) {
                //   setState(() {
                //     currentIndex = 5;
                //   });
                // } else {
                //   Toast.show(
                //     'This service only for the agency users.',
                //     context,
                //     gravity: Toast.CENTER,
                //     backgroundColor: Colors.blueGrey,
                //     textColor: Colors.white,
                //     duration: Toast.LENGTH_SHORT,
                //   );
                // }
              },
              textColor: Color(0xFFF6FAFC),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageIcon(
                    // AssetImage('assets/images/bottom_map_icon.png'),
                    AssetImage('assets/images/bottom_services_icon.png'),

                    color: menuC.currentIndex.value == 5
                        ? AppTheme.focusedLineColor
                        : Colors.white,
                    size: 24.0,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'SERVICE',
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 8.5,
                      color: menuC.currentIndex.value == 5
                          ? AppTheme.focusedLineColor
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            flex: 1,
          ),
          // fifthButtonPress != null
          //     ? Flexible(
          //         child: MaterialButton(
          //           onPressed: fifthButtonPress,
          //           textColor: Color(0xFFF6FAFC),
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [
          //               ImageIcon(
          //                 AssetImage(
          //                     'assets/images/bottom_services_icon.png'),
          //                 color: Color(0xFFFFFFFF),
          //                 size: 24.0,
          //               ),
          //               const SizedBox(height: 10.0),
          //               Text('SERVICES',
          //                   style: TextStyle(
          //                       fontFamily: 'Manrope', fontSize: 9.5),
          //                   overflow: TextOverflow.ellipsis),
          //             ],
          //           ),
          //         ),
          //         flex: 1,
          //       )
          //     : Container()
        ],
      ),
    );
  }
}
