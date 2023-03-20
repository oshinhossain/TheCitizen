import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/helpers/route.dart';
import 'package:the_citizen_app/src/pages/update_my_profile_page.dart/update_profile_academy_page.dart';
import 'package:the_citizen_app/src/pages/update_my_profile_page.dart/update_profile_basic_data_page.dart';
import 'package:the_citizen_app/src/pages/update_my_profile_page.dart/update_profile_identity_page.dart';

import '../../config/app_theme.dart';

class UpdateMyProfile extends StatefulWidget {
  @override
  State<UpdateMyProfile> createState() => _UpdateMyProfilePageState();
}

class _UpdateMyProfilePageState extends State<UpdateMyProfile> with Base {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.newAppBarBackgroundColor,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Update My Profile',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 18.0,
              color: AppTheme.textColor6,
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: GestureDetector(
              onTap: () {
                back();
              },
              child: Icon(Icons.arrow_back)),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: Material(
              color: AppTheme.bannerColor1, // #78909C
              child: Container(
                height: 44.75,
                padding: EdgeInsets.only(left: 30.0, top: 14.75, right: 30.0, bottom: 0.0),
                child: Container(
                  //color: Colors.white.withOpacity(0.5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                    ),
                  ),
                  child: _tabBar,
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              TabBasicData(),
              TabNationalIdentity(),
              TabAcademyInfo(),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: hexToColor('#78909C'),
          onPressed: () async {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: CircularProgressIndicator(),
              ),
            );

            await updateProfileCreateC.updateProfile();
          },
          label: Container(
              width: Get.width,
              color: hexToColor('#78909C'),
              child: Center(
                  child: KText(
                text: 'Update',
                color: Colors.white,
                bold: true,
                fontSize: 18,
              ))),
          shape: RoundedRectangleBorder(
              // borderRadius: BorderRadius.circular(10.0),
              ),
        ),
      ),
    );
  }

  TabBar get _tabBar => TabBar(
        labelColor: AppTheme.textColor6,
        labelStyle: TextStyle(
          fontFamily: 'Manrope',
          fontSize: 14.0,
          color: AppTheme.textColor6,
          fontWeight: FontWeight.w700,
        ),
        indicator: BoxDecoration(
          borderRadius: _selectedIndex == 0
              ? BorderRadius.only(topLeft: Radius.circular(5.0))
              : _selectedIndex == 2
                  ? BorderRadius.only(topRight: Radius.circular(5.0))
                  : null,
          color: AppTheme.textColor1,
        ),
        indicatorWeight: 1,
        indicatorColor: AppTheme.textColor1,
        indicatorSize: TabBarIndicatorSize.tab,
        //unselectedLabelColor: Colors.blue,
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Manrope',
          fontSize: 14.0,
          color: AppTheme.textColor6,
          fontWeight: FontWeight.w700,
        ),
        isScrollable: false,
        physics: BouncingScrollPhysics(),
        tabs: [
          Tab(
            text: 'Basic Data',
          ),
          Tab(
            text: 'Identity',
          ),
          Tab(
            text: 'Academy',
          ),
        ],
        onTap: (tabIndex) {
          setState(
            () {
              _selectedIndex = tabIndex;
            },
          );
        },
      );
}
