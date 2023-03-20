import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/app_theme.dart';

class Expenses extends StatelessWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          'Expenses',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppTheme.appFooterColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmployeeSubCategoryCardItem(
              onTap: () {},
              themeColor: '789395',
              imagePath: 'assets/images/advance_application.png',
              titleText: 'Advance Application',
            ),
            EmployeeSubCategoryCardItem(
              onTap: () {},
              themeColor: '789395',
              imagePath: 'assets/images/reimbursement_claim.png',
              titleText: 'Reimbursement Claim',
            ),
          ],
        ),
      ),
    );
  }
}

class EmployeeSubCategoryCardItem extends StatelessWidget {
  final Function onTap;
  final String? themeColor;
  final String? imagePath;
  final String? titleText;

  const EmployeeSubCategoryCardItem({
    super.key,
    required this.onTap,
    required this.themeColor,
    required this.imagePath,
    required this.titleText,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Card(
          elevation: 10,
          shadowColor: AppTheme.appBarColor,
          // shadowColor: Colors.grey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: AppTheme.appBarColor, width: 1.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Center(
              child: ListTile(
                title: Text(titleText ?? ''),
                leading: ImageIcon(
                  AssetImage(imagePath!.isEmpty
                      ? 'assets/images/shout_logo.png'
                      : '${imagePath}'),
                  color: Color(0xFF2F8F9D),
                  size: 60, //category.imageSize,
                ),
                // trailing: Icon(Icons.arrow_forward),
                onTap: onTap as Function(),
              ),
            ),
          ),
        );
      },
    );
  }
}
