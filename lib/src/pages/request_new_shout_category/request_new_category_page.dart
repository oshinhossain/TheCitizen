import 'package:flutter/material.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/pages/request_new_shout_category/my_request_page.dart';

import 'package:the_citizen_app/src/pages/request_new_shout_category/send_request_page.dart';

class RequestNewShoutCategoryPage extends StatefulWidget {
  // final String? title;

  // RequestNewShoutCategoryPage({this.title});

  @override
  _RequestNewShoutCategoryPageState createState() => new _RequestNewShoutCategoryPageState();
}

class _RequestNewShoutCategoryPageState extends State<RequestNewShoutCategoryPage> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 2,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _tabController!.addListener(() {
      if (_tabController!.indexIsChanging) {
        setState(() {
          _activeIndex = _tabController!.index;
        });
      }
    });
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.newAppBarBackgroundColor,
        iconTheme: IconThemeData(color: AppTheme.newAppBarTextColor),
        centerTitle: true,
        elevation: 0,
        title: KText(
          text: 'Request New Shout Category',
          fontSize: 16,
          bold: true,
        ),
        bottom: PreferredSize(
          preferredSize: _tabBar.preferredSize,
          child: Material(
            color: AppTheme.appFooterColor, // #78909C
            child: Container(
              height: 44.75,
              padding: EdgeInsets.only(left: 29.0, top: 14.75, right: 29.0, bottom: 0.0),
              child: Container(
                //color: Colors.white.withOpacity(0.5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
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
      body: TabBarView(
        controller: _tabController,
        children: [
          SendRequestTab(),
          MyRequestTabPage(),
        ],
      ),
    );
  }

  TabBar get _tabBar => TabBar(
        controller: _tabController,
        labelColor: AppTheme.newAppBarTextColor,
        labelStyle: TextStyle(fontFamily: 'Manrope', fontSize: 14.0, color: AppTheme.newAppBarTextColor, fontWeight: FontWeight.w700),
        /*indicator: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0)),
        ), */ //Change background color from here
        labelPadding: EdgeInsets.all(0),
        indicator: BoxDecoration(
          borderRadius: _activeIndex == 0
              ? BorderRadius.only(topLeft: Radius.circular(5.0))
              : _activeIndex == 1
                  ? BorderRadius.only(topRight: Radius.circular(5.0))
                  : null,
          color: Colors.white,
        ),
        indicatorWeight: 1,
        indicatorColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,
        //unselectedLabelColor: Colors.blue,
        unselectedLabelStyle:
            TextStyle(fontFamily: 'Manrope', fontSize: 14.0, color: AppTheme.newAppBarTextColor, fontWeight: FontWeight.w700),
        isScrollable: false,
        physics: BouncingScrollPhysics(),
        tabs: [
          Tab(text: 'Send Request'),
          Tab(text: 'My Request'),
        ],
      );
}
