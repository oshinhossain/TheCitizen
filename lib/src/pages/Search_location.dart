import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/k_log.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/helpers/loading.dart';
import 'package:the_citizen_app/src/helpers/route.dart';

import '../config/app_theme.dart';

class SearchLocation extends StatefulWidget {
  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> with Base {
  final _controller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    shoutC.searchText.value = '';
    shoutC.isLoading.value = false;
    shoutC.searchKnownLocation.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppTheme.textColor13,
        foregroundColor: AppTheme.textColor15,
        leadingWidth: 30,
        title: Obx(
          () => Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: AppTheme.borderColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              controller: _controller,
              onChanged: (value) {
                shoutC.searchText.value = value;
                if (shoutC.searchText.value.isNotEmpty) {
                  1.delay();
                  shoutC.getUserDefinedLocation();
                }
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    shoutC.searchText.value.isNotEmpty
                        ? Icons.close_rounded
                        : Icons.search,
                    color: AppTheme.appBarColor,
                  ),
                  // onPressed: _controller.clear

                  onPressed: () {
                    _controller.clear();
                    shoutC.searchText.value = '';
                    shoutC.searchKnownLocation.clear();
                    FocusScope.of(context).unfocus();
                  },
                ),
                hintText: 'Search for Location...',
                hintStyle: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 14,
                  color: AppTheme.appBarColor,
                ),
                contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.borderColor, width: 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.borderColor, width: 1),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              shoutC.searchKnownLocation.isEmpty
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
                  : Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: ListView.builder(
                        itemCount: shoutC.searchKnownLocation.length,
                        shrinkWrap: true,
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          final item = shoutC.searchKnownLocation[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Card(
                              child: ListTile(
                                onTap: () {
                                  kLog(jsonEncode(item));
                                  shoutC.selectedLocation.value = item;
                                  back();
                                },
                                title: KText(
                                  text: '${item.address}',
                                  maxLines: 3,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
