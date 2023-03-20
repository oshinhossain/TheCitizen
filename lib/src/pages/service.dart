import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/helpers/route.dart';
import 'package:the_citizen_app/src/models/employee_service_model.dart';
import 'package:the_citizen_app/src/pages/employee_leave_application_page.dart';
import '../config/app_theme.dart';
import '../helpers/hex_color.dart';

class ServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int? selectedIndex;
    return Scaffold(
      body: Container(
        color: hexToColor('#F5F9FC'),
        child: ListView.builder(
          key: Key('builder ${selectedIndex.toString()}'),
          // key: Key('builder ${selectedIndex.toString()}'),
          padding: EdgeInsets.all(0),
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: EmployeeServiceList.employeeServiceList.length,
          itemBuilder: (BuildContext context, int index) {
            final item = EmployeeServiceList.employeeServiceList[index];

            return InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffF5F9Fc),
                      Color(0xffFFFFFF),
                      Color(0xffFFFFFF),
                      Color(0xffFFFFFF),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: hexToColor('#8DA3AC').withOpacity(.3),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.all(15),
                    key: Key(index.toString()),
                    iconColor: hexToColor('#8F94AC'),
                    textColor: Colors.black,
                    backgroundColor: hexToColor('#F5F9FC'),
                    childrenPadding: EdgeInsets.zero,
                    initiallyExpanded: false,
                    onExpansionChanged: (bool expanded) {
                      print(index);
                      print(expanded);
                    },
                    leading: ImageIcon(
                      AssetImage('${item.imagePath}'),
                      // AssetImage('assets/images/shout_logo.png'),
                      size: 40,
                      color: AppTheme.appBarColor,
                    ),
                    title: Text(
                      '${item.titleText}',
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    children: [
                      Container(
                        color: hexToColor('#E6EDF5'),
                        height: MediaQuery.of(context).size.height / 3,
                        child: GridView.builder(
                          itemCount: item.listItem.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.all(5),
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 130.0,
                            crossAxisCount: 3,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            final subItem = item.listItem[index];
                            return ReportSubCategoryWidget(
                              navigationTap: () {
                                push(EmployeeServiceList.timemanagement[index]);
                              },
                              subItem: subItem,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class EmployeeServiceGridItem extends StatelessWidget {
  final Function onTap;
  final String? themeColor;
  final String? imagePath;
  final String? titleText;
  const EmployeeServiceGridItem({
    Key? key,
    required this.onTap,
    required this.themeColor,
    required this.imagePath,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(5),
          child: Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: InkWell(
              onTap: onTap as Function(),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ImageIcon(
                      AssetImage(imagePath!.isEmpty
                          ? 'assets/images/shout_logo.png'
                          : '${imagePath}'),
                      color: Color(0xFF2F8F9D),
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, top: 20, right: 10, bottom: 0),
                      child: Text(
                        titleText!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ReportSubCategoryWidget extends StatelessWidget {
  EmployeeServiceListItem? subItem;
  VoidCallback navigationTap;

  ReportSubCategoryWidget(
      {super.key, required this.subItem, required this.navigationTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: Container(
        child: InkWell(
          onTap: () {
            Get.to(() => EmployeeLeaveApplicationpPage());
            // subItem!.titleText = 'Employee Attendance'
            //     ? Get.to(() => AttendancePage())
            //     : Get.to(() => EmployeeLeaveApplicationpPage());
          },
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      border: Border.all(color: hexToColor('#8F94AC')),
                    ),

                    child: ImageIcon(
                      AssetImage('${subItem!.imagePath}'),
                      // AssetImage('assets/images/default_sub_cat_icon.png'),
                      size: 40,
                      color: AppTheme.appBarColor,
                    ),

                    // color: subCategory.sucThemeColor != null ? hexToColor(subCategory.sucThemeColor!) :AppTheme .appBarColor,
                    // size: 40,
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 0),
                      child: Text(
                        '${subItem!.titleText}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontSize: 14.0,
                          height: 1.1,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      )
                      // : Text('No Name'),
                      )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
