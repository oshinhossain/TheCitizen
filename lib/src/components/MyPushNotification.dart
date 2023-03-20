import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';

class MyPushNotification extends StatelessWidget {
  bool selectingmode = false;
  var listItem;
  final myDateFormat = new DateFormat('dd-MMM-yyyy');

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          backgroundColor: AppTheme.backgroundColor,

          appBar: AppBar(
            elevation: 1,
            title: Text(
              'Notifications',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 18.0,
                color: AppTheme.appBarTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            iconTheme: IconThemeData(
              color: AppTheme.textColor6,
            ),
            backgroundColor: AppTheme.backgroundColor,
          ),
          body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      color: AppTheme.backgroundColor,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        color: AppTheme.textColor1,
                        child: ListTile(
                          //title: Text(widget.notifications[index].title != null ? widget.notifications[index].title.toString() : ''),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '22 Aug 2022',
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontSize: 12.0,
                                  color: AppTheme.textColor15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'Your password has been changed. Please login again',
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontSize: 14.0,
                                  color: AppTheme.textColor15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 0,
                                    child: Text(
                                      '01-2-22',
                                      style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontSize: 12.0,
                                        color: AppTheme.textColor15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 0,
                                    child: Text(
                                      ' > ',
                                      style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontSize: 12.0,
                                        color: AppTheme.textColor15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      '12-02-22',
                                      style: TextStyle(
                                        fontFamily: 'Manrope',
                                        fontSize: 12.0,
                                        color: AppTheme.textColor15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: Icon(Icons.done),
                          selectedColor: AppTheme.appBarColor,
                          onLongPress: () {},
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    // Row(
                    //   children: <Widget>[
                    //     const Spacer(),
                    //     Container(
                    //       height: 40.0,
                    //       width: 40.0,
                    //       decoration: BoxDecoration(
                    //         color: AppTheme.appBarColor,
                    //         border: Border.all(color: Colors.blue),
                    //         borderRadius: BorderRadius.circular(5),
                    //       ),
                    //       child: IconButton(
                    //         padding: new EdgeInsets.all(0),
                    //         icon: Icon(Icons.close),
                    //         iconSize: 24,
                    //         color: AppTheme.textColor1,
                    //         onPressed: () {},
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 6,
                    //     ),
                    //     Container(
                    //       height: 40.0,
                    //       width: 40.0,
                    //       decoration: BoxDecoration(
                    //         color: AppTheme.textColor10,
                    //         border: Border.all(color: Colors.blue),
                    //         borderRadius: BorderRadius.circular(5),
                    //       ),
                    //       child: IconButton(
                    //         padding: new EdgeInsets.all(0),
                    //         icon: Icon(Icons.delete),
                    //         iconSize: 24,
                    //         color: AppTheme.textColor1,
                    //         onPressed: () {},
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 6,
                    // ),
                  ],
                );
              },
            ),
          ),
          floatingActionButton: null,
          // bottomNavigationBar: (orientation == Orientation.portrait)
          //     ? _BottomNavigationSheet()
          //     : null,
        );
      },
    );
  }
}

// class _BottomNavigationSheet extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return bottomNavigationForOtherPage();
//   }
// }
