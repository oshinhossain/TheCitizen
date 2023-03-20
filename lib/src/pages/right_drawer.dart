import 'package:flutter/material.dart';
import 'package:the_citizen_app/src/helpers/route.dart';
import 'package:the_citizen_app/src/pages/about.dart';
import '../config/base.dart';

class RightDrawer extends StatelessWidget with Base {
  final loginMode = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0, color: Color(0xFFC1DEEA)),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 67.0, vertical: 51.0),
            child: Center(
              child: Container(
                width: 169.11,
                height: 80.0,
                child: Image.asset(
                  'assets/images/shout_logo.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          if (!loginMode)
            SingleChildScrollView(
              //ExpansionPanelList.radio is for expanded only one element at a time
              //physics:  BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              child: ExpansionPanelList.radio(
                dividerColor: Color(0xFFB6B8C5),
                expandedHeaderPadding: EdgeInsets.zero,
                elevation: 0.0,
                expansionCallback: (index, isExpanded) {
                  print(isExpanded);
                },
                children: menuC.rightSidebar
                    .map(
                      (item) => ExpansionPanelRadio(
                        value: item.title!,
                        canTapOnHeader: true,
                        backgroundColor: Color(0xFFFFFFFF),
                        headerBuilder: (context, isExpanded) {
                          return ListTile(
                            visualDensity: VisualDensity(vertical: -4),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 0.0),
                            horizontalTitleGap: 10.0,
                            minVerticalPadding: 0.0,
                            leading:
                                //  RenderSvg(path: '{item.svgPath!}'),
                                item.iconPath!.isEmpty
                                    ? Icon(Icons.ac_unit,
                                        color: Color(0xFF2A3050))
                                    : ImageIcon(AssetImage(item.iconPath!),
                                        color: Color(0xFF2A3050)),
                            title: Text(
                              item.title!,
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 14.0,
                                color: item.title == 'Emergency Call'
                                    ? Colors.red
                                    : Color(0xFF2A3050),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        },
                        body: Column(
                          mainAxisSize: MainAxisSize.min,
                          //children: tile.titles.map(buildTile).toList(),
                          children: item.children!
                              .map(
                                (tile) => Container(
                                  //padding:  EdgeInsets.only(left: 15),
                                  //padding: EdgeInsets.zero,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE7F4F9),
                                    border: Border(
                                      //top: BorderSide(color: Color(0xFFE5EEE6)),
                                      bottom:
                                          BorderSide(color: Color(0xFFA3CCDC)),
                                    ),
                                  ),
                                  child: ListTile(
                                    visualDensity: VisualDensity(vertical: -4),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 0.0),
                                    tileColor: Color(0xFFC5DCE4),
                                    minLeadingWidth: 3.0,
                                    leading: Padding(
                                      padding: EdgeInsets.only(left: 7.0),
                                      child: ImageIcon(
                                          AssetImage(
                                              "assets/icons/dot_icon.png"),
                                          color: Color(0xFF2A3050)),
                                    ),
                                    title: Padding(
                                      padding: EdgeInsets.zero,
                                      child: Text(
                                        tile.title!,
                                        style: TextStyle(
                                            fontFamily: 'Manrope',
                                            fontSize: 14.0,
                                            color: Color(0xFF2A3050),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    onTap: () {
                                      back();
                                      menuC.pushRightMenu(tile.title!);
                                    },
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          Container(
              color: Color(0xFFB6B8C5), width: double.infinity, height: 1),
          Container(
            color: Colors.white,
            child: ListTile(
              //leading: Icon(Icons.people),
              //leading: ImageIcon(AssetImage('assets/icons/about_us_icon.png'), color: Color(0xFF2A3050)),
              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
              horizontalTitleGap: 10.0,
              minVerticalPadding: 0.0,
              //minLeadingWidth: 10.0,
              leading: ImageIcon(AssetImage("assets/icons/about_us_icon.png"),
                  color: Color(0xFF2A3050)),
              title: Text(
                'About Us',
                style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 14.0,
                    color: Color(0xFF2A3050),
                    fontWeight: FontWeight.w600),
              ),
              //trailing: Icon(Icons.people),
              onTap: () {
                push(AboutUs());
              },
            ),
          ),
          Container(
              color: Color(0xFFB6B8C5), width: double.infinity, height: 1),
        ],
      ),
    );
  }
}
