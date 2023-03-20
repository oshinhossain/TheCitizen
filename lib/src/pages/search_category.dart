import 'package:flutter/material.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/utility/utility.dart';

import '../helpers/route.dart';
import 'report_issue_page.dart';

class IssueSearch extends StatelessWidget with Base {
  //const IssueSearch({Key key}) : super(key: key);

  String query = '';
  var _controller = TextEditingController();
  // final ShoutSubCategories? subCategory;
  // IssueSearch({this.subCategory});

  @override
  Widget build(BuildContext context) {
    // shoutC.getShoutSubCategory();
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: hexToColor('#F5F9FC'),
        foregroundColor: hexToColor('#434969'),
        // leading: Container(
        //    // alignment: Alignment.center,
        //   //  padding: EdgeInsets.only(left: 5),
        //     child: ImageIcon(
        //       AssetImage('assets/images/back_icon.png'),
        //     )),
        leadingWidth: 30,
        title: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: hexToColor('#A3CCDC'),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            controller: _controller,
            onChanged: (value) {
              query = value;
              // setState(() {});
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: hexToColor('#78909C'),
              ),
              suffixIcon: query.isNotEmpty
                  ? IconButton(
                      icon: Icon(
                        Icons.close,
                        color: hexToColor('#78909C'),
                      ),
                      onPressed: _controller.clear)
                  : null,
              hintText: 'Search for issue',
              hintStyle: TextStyle(fontFamily: 'Manrope', fontSize: 16, color: hexToColor('#78909C')),
              contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: hexToColor('#A3CCDC'), width: 1),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(30),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: hexToColor('#A3CCDC'), width: 1),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ),
      body: buildSuggestions(context),
      // bottomNavigationBar: _BottomNavigationSheet(),
    );
  }

  Widget buildSuggestions(BuildContext context) {
    // //   final subCatDao = ReportSubCategoryDAO();
    // //  List<ReportSubCategoryModel> suggestionList = [];
    // if (query.isEmpty) {
    //   //   suggestionList = [];
    // }

    return Container(
      color: hexToColor('#F5F9FC'),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: shoutC.shoutSubCategories.length,
        // suggestionList.length,
        itemBuilder: (context, index) {
          final item = shoutC.shoutSubCategories[index];
          return Container(
            decoration: BoxDecoration(
              color: hexToColor('#F5F9FC'),
              boxShadow: [
                BoxShadow(
                  color: hexToColor('#8DA3AC'),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: ListTile(
              title: Text(
                item.categoryName!,
                //  suggestionList[index]?.categoryName ?? '',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                item.subcategoryName!,
                // suggestionList[index]?.subcategoryName ?? '',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 13.0,
                ),
              ),
              leading: item.subcategoryImage != null
                  ? ImageIcon(
                      MemoryImage(Utility.uint8ListFromBase64String(item.subcategoryImage!)),
                      size: 40,
                      color: item.sucThemeColor != null && item.sucThemeColor != ""
                          ? hexToColor(item.sucThemeColor!)
                          : AppTheme.appBarColor,
                    )
                  : ImageIcon(
                      AssetImage('assets/images/default_sub_cat_icon.png'),
                      size: 40,
                      color: AppTheme.appBarColor,
                    ),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: () {
                push(ReportIssuePage());
              },
            ),
          );
        },
      ),
    );
    // :
    // Container(
    //   color: hexToColor('#F5F9FC'),
    //   child: Center(
    //       child:
    //           //  query.isNotEmpty ?
    //           Text(
    //     'Type not found!',
    //     style: TextStyle(
    //       fontFamily: 'Manrope',
    //       fontSize: 16,
    //       color: hexToColor('#78909C'),
    //     ),
    //   )
    //       //  : '',
    //       ),
    // );
    // } else {
    //   return Container(
    //     color: hexToColor('#F5F9FC'),
    //   );
    // }
  }
}
