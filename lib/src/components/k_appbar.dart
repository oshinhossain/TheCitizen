import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/route.dart';

import '../pages/search_category.dart';
import 'EmergencyShout.dart';
import 'EmergencyShoutHelper.dart';
import 'NotificationComponent.dart';

class KAppbar extends StatelessWidget with PreferredSizeWidget, Base {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // return AppBar(
    //   leading: GestureDetector(
    //     onTap: () {
    //       // menuC.globalKey.currentState!.openDrawer();
    //     },
    //     child: Container(
    //       color: Colors.transparent,
    //       child: Padding(
    //         padding: EdgeInsets.all(15),
    //         child: SvgPicture.asset(
    //           '${Constants.svgPath}/top_left.svg',
    //           color: AppTheme.textColor,
    //         ),
    //       ),
    //     ),
    //   ),
    //   title: SvgPicture.asset(
    //     '${Constants.svgPath}/workforce_text_logo.svg',
    //   ),
    //   titleSpacing: 0,
    //   surfaceTintColor: AppTheme.appbarColor,
    //   backgroundColor: AppTheme.appbarColor,
    //   systemOverlayStyle: SystemUiOverlayStyle(
    //     statusBarColor: AppTheme.appbarColor,
    //     statusBarBrightness: Brightness.dark,
    //     statusBarIconBrightness: Brightness.dark,
    //     systemNavigationBarIconBrightness: Brightness.dark,
    //     systemNavigationBarDividerColor: Colors.grey[50],
    //     systemNavigationBarColor: Colors.grey[50],
    //   ),
    //   actions: menuC.appbarMenus
    //       .map(
    //         (item) => GestureDetector(
    //           onTap: () {
    //             switch (menuC.appbarMenus.indexOf(item)) {
    //               case 4:
    //                 menuC.globalKey.currentState!.openEndDrawer();
    //                 break;
    //               default:
    //             }
    //           },
    //           child: Padding(
    //             padding: EdgeInsets.all(7),
    //             child: SvgPicture.asset(
    //               '${Constants.svgPath}/$item',
    //               color: AppTheme.textColor,
    //             ),
    //           ),
    //         ),
    //       )
    //       .toList(),
    // );
    return menuC.currentIndex.value == 2 || menuC.currentIndex.value == 3
        ? AppBar(
            //backgroundColor: AppColors.appBarColor,
            elevation: 0,
            backgroundColor: AppTheme.appHomePageColor,
            titleSpacing: 0.0,
            automaticallyImplyLeading: false,
            leading: IconButton(
              //icon: Icon(Icons.menu_rounded),
              icon: Icon(Icons.more_vert),
              color: Colors.black,
              iconSize: 24.0,
              onPressed: () => menuC.globalKey.currentState!.openDrawer(),
            ),
            title: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/shout_logo.png",
                  height: 40.0,
                ),
                Spacer(),
                EmergencyShout(),
                EmergencyShoutHelper(),
                // if (CtsSharedPreferences.getString(loginMode) == LoginMode.OFFLINE.name) _OfflineIcon(),
                NotificationComponent(),
              ],
            ),
            actions: [
              IconButton(
                //icon: Icon(Icons.more_vert),
                icon: Icon(Icons.menu_rounded),
                color: Colors.black,
                //color: Color(0xFF5293A6),.

                iconSize: 24.0,
                onPressed: () => menuC.globalKey.currentState!.openEndDrawer(),
              ),
            ],
          )
        : menuC.currentIndex.value == 1
            ? AppBar(
                elevation: 0,
                centerTitle: true,
                backgroundColor: AppTheme.backgroundColor,
                leading: SizedBox(),
                actions: [SizedBox()],
                iconTheme: IconThemeData(
                  color: AppTheme.textColor6,
                ),
                title: Text(
                  "Sync Offline Shout",
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 18.0,
                    color: AppTheme.appBarTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : menuC.currentIndex.value == 4
                ? AppBar(
                    elevation: 0,
                    centerTitle: true,
                    backgroundColor: AppTheme.backgroundColor,
                    leading: SizedBox(),
                    actions: [SizedBox()],
                    iconTheme: IconThemeData(
                      color: AppTheme.textColor6,
                    ),
                    title: Text(
                      "My Report List",
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 18.0,
                        color: AppTheme.appBarTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : menuC.currentIndex.value == 5
                    ? AppBar(
                        elevation: 0,
                        centerTitle: true,
                        backgroundColor: AppTheme.backgroundColor,
                        leading: SizedBox(),
                        actions: [SizedBox()],
                        iconTheme: IconThemeData(
                          color: AppTheme.textColor6,
                        ),
                        title: Text(
                          "Employee Services",
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 18.0,
                            color: AppTheme.appBarTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : AppBar(
                        actions: [
                          IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              push(IssueSearch());
                            },
                          )
                        ],
                        centerTitle: true,
                        backgroundColor: AppTheme.backgroundColor,
                        leading: SizedBox(),
                        iconTheme: IconThemeData(
                          color: AppTheme.textColor6,
                        ),
                        title: Text(
                          "Report Category",
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 18.0,
                            color: AppTheme.appBarTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
  }
}
