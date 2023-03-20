import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_log.dart';
import 'package:the_citizen_app/src/helpers/loading.dart';
import 'package:the_citizen_app/src/helpers/route.dart';
import '../helpers/k_text.dart';
import '../models/shout_sub_categories.dart';
import '../utility/utility.dart';
import 'report_issue_page.dart';

class ReportCategoryPage extends StatefulWidget {
  @override
  State<ReportCategoryPage> createState() => _ReportCategoryPageState();
}

class _ReportCategoryPageState extends State<ReportCategoryPage> with Base {
  int? selectedIndex;
  final int max = 10;
  int selected = -1;
  @override
  Widget build(BuildContext context) {
    5.delay();
    shoutC.getShoutCategory();
    //shoutC.getShoutSubCategory();
    return Scaffold(
      body: Obx(
        () => shoutC.shoutCategories.isEmpty
            ? shoutC.isLoading.value
                ? SizedBox(
                    height: Get.height / 1.5,
                    child: Center(
                      child: Loading(),
                    ),
                  )
                : SizedBox(
                    height: Get.height / 1.5,
                    child: Center(child: KText(text: 'No data found')),
                  )
            : Container(
                color: hexToColor('#F5F9FC'),
                child: ListView.builder(
                  key: Key('builder ${selectedIndex.toString()}'),
                  // key: Key('builder ${selectedIndex.toString()}'),
                  padding: EdgeInsets.all(0),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: shoutC.shoutCategories.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = shoutC.shoutCategories[index];

                    return InkWell(
                      onTap: () {
                        kLog('value');
                        //  shoutC.getShoutSubCategory(item.categoryCode!);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // gradient: LinearGradient(
                          //   begin: Alignment.topCenter,
                          //   end: Alignment.bottomCenter,
                          //   colors: [
                          //     Color(0xffF5F9Fc),
                          //     Color(0xffFFFFFF),
                          //     Color(0xffFFFFFF),
                          //     Color(0xffFFFFFF),
                          //   ],
                          // ),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: hexToColor('#8DA3AC'),
                          //     spreadRadius: 3,
                          //     blurRadius: 5,
                          //     offset:
                          //         Offset(0, 3), // changes position of shadow
                          //   ),
                          // ],
                        ),
                        child: Theme(
                          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
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
                              shoutC.getShoutSubCategory(item.categoryCode!);
                            },
                            leading: item.categoryImage != null
                                ? ImageIcon(
                                    MemoryImage(Utility.uint8ListFromBase64String(item.categoryImage!)),
                                    size: 40,
                                    color: item.themeColor != null && item.themeColor != ""
                                        ? hexToColor('${item.themeColor!}')
                                        : AppTheme.appBarColor,
                                  )
                                : ImageIcon(
                                    AssetImage('assets/images/shout_logo.png'),
                                    size: 40,
                                    color: AppTheme.appBarColor,
                                  ),
                            title: Text(
                              item.categoryName != "" ? '${item.categoryName}' : 'No Titel ',
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
                                child: shoutC.getShoutSubCategoryById(code: item.categoryCode!) != null
                                    ? GridView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        padding: EdgeInsets.all(5),
                                        physics: const BouncingScrollPhysics(),
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisExtent: 130.0,
                                          crossAxisCount: 3,
                                        ),
                                        itemBuilder: (BuildContext context, int index) {
                                          final subItems = shoutC.getShoutSubCategoryById(code: item.categoryCode!)[index];

                                          return ReportSubCategoryWidget(
                                            subCategory: subItems,
                                          );
                                        },
                                        itemCount: shoutC.getShoutSubCategoryById(code: item.categoryCode!).length,
                                      )
                                    : Container(
                                        child: Center(
                                          child: Text('Type not available!'),
                                        ),
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
      ),

      // bottomNavigationBar: _BottomNavigationSheet(),
    );
  }
}

class ReportSubCategoryWidget extends StatelessWidget with Base {
  final ShoutSubCategories subCategory;

  ReportSubCategoryWidget({
    super.key,
    required this.subCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: Container(
        child: InkWell(
          onTap: () {
            if (subCategory.categoryName != 'My Queries') push(ReportIssuePage(subCategory: subCategory));
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

                    child: subCategory.subcategoryImage != null
                        ? ImageIcon(
                            MemoryImage(Utility.uint8ListFromBase64String(subCategory.subcategoryImage!)),
                            size: 40,
                            color: subCategory.sucThemeColor != null && subCategory.sucThemeColor != ""
                                ? hexToColor(subCategory.sucThemeColor!)
                                : AppTheme.appBarColor,
                          )
                        : ImageIcon(
                            AssetImage('assets/images/default_sub_cat_icon.png'),
                            size: 40,
                            color: AppTheme.appBarColor,
                          ),

                    // color: subCategory.sucThemeColor != null ? hexToColor(subCategory.sucThemeColor!) :AppTheme .appBarColor,
                    // size: 40,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 0),
                      child: Text(
                        subCategory.subcategoryName!,
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
