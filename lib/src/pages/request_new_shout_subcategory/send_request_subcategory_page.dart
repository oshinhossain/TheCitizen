import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/custom_textfield_with_dropdown.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';

class SendRequestSubCategoryPage extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KText(
                text: 'Category',
                fontSize: 16,
              ),
              CustomTextFieldWithDropdown(
                suffix: DropdownButton(
                  value: shoutC.selectedCategory.value!.categoryName,
                  underline: Container(),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: hexToColor('#80939D'),
                  ),
                  items: shoutC.shoutCategories.map((item) {
                    return DropdownMenuItem(
                      onTap: () {
                        shoutC.selectedCategory.value = item;
                        //  siteCompletionC.pId.value = item.id!;
                      },
                      value: item.categoryName,
                      child: SizedBox(
                        width: Get.width * .85,
                        child: KText(
                          text: item.categoryName,
                          fontSize: 13,
                          maxLines: 2,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (item) {
                    //// kLog('value');
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              KText(
                text: 'New Shout SubCategory',
                fontSize: 16,
              ),
              Obx(
                () => TextFormField(
                  decoration: InputDecoration(),
                  initialValue: reqShoutSubCategoryC.subCategoryName.value,
                  onChanged: reqShoutSubCategoryC.subCategoryName,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              KText(
                text: 'Description',
                fontSize: 16,
              ),
              Obx(
                () => TextFormField(
                  decoration: InputDecoration(),
                  initialValue: reqShoutSubCategoryC.description.value,
                  onChanged: reqShoutSubCategoryC.description,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    reqShoutSubCategoryC.addNewShoutSubCategory();
                  },
                  icon: Icon(
                    Icons.upload,
                    color: Colors.white,
                  ),
                  label: KText(
                    text: "Submit",
                    fontSize: 20,
                    color: Colors.white,
                    bold: true,
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                    backgroundColor: MaterialStateProperty.all<Color>(AppTheme.appFooterColor), //#78909C
                    fixedSize: MaterialStateProperty.all<Size>(Size.fromWidth(140)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
