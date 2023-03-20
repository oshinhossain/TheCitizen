import 'package:flutter/material.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';

import '../config/app_theme.dart';
import '../helpers/k_text.dart';

class MyActivitySummary extends StatefulWidget {
  @override
  State<MyActivitySummary> createState() => _MyActivitySummaryState();
}

class _MyActivitySummaryState extends State<MyActivitySummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: AppTheme.backgroundColor,
        iconTheme: IconThemeData(
          color: AppTheme.textColor6,
        ),
        title: KText(
          text: 'My Activity Summary',
          color: hexToColor('#434969'),
          fontSize: 18,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: hexToColor('#FFFFFF'),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 34,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: hexToColor('#C2D8E0'),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(2),
                            topRight: Radius.circular(2),
                          ),
                        ),
                        child: KText(
                          text: '0',
                          color: hexToColor('#434969'),
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: hexToColor('#FFFFFF'),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(2),
                            bottomRight: Radius.circular(2),
                          ),
                          border: Border.all(
                            color: hexToColor('#C2D8E0'),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            KText(
                              text: 'Total',
                              color: hexToColor('#434969'),
                              fontSize: 14,
                            ),
                            KText(
                              text: 'Assigned',
                              color: hexToColor('#434969'),
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 34,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: hexToColor('#C2D8E0'),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(2),
                            topRight: Radius.circular(2),
                          ),
                        ),
                        child: KText(
                          text: '0',
                          color: hexToColor('#434969'),
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: hexToColor('#FFFFFF'),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(2),
                            bottomRight: Radius.circular(2),
                          ),
                          border: Border.all(
                            color: hexToColor('#C2D8E0'),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            KText(
                              text: 'Total',
                              color: hexToColor('#434969'),
                              fontSize: 14,
                            ),
                            KText(
                              text: 'Closed',
                              color: hexToColor('#434969'),
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 34,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: hexToColor('#C2D8E0'),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(2),
                            topRight: Radius.circular(2),
                          ),
                        ),
                        child: KText(
                          text: '0',
                          color: hexToColor('#434969'),
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: hexToColor('#FFFFFF'),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(2),
                            bottomRight: Radius.circular(2),
                          ),
                          border: Border.all(
                            color: hexToColor('#C2D8E0'),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            KText(
                              text: 'Dropped',
                              color: hexToColor('#434969'),
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 34,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: hexToColor('#C2D8E0'),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(2),
                            topRight: Radius.circular(2),
                          ),
                        ),
                        child: KText(
                          text: '0',
                          color: hexToColor('#434969'),
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: hexToColor('#FFFFFF'),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(2),
                            bottomRight: Radius.circular(2),
                          ),
                          border: Border.all(
                            color: hexToColor('#C2D8E0'),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            KText(
                              text: 'Pending',
                              color: hexToColor('#434969'),
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 34,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: hexToColor('#C2D8E0'),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(2),
                            topRight: Radius.circular(2),
                          ),
                        ),
                        child: KText(
                          text: '0',
                          color: hexToColor('#434969'),
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: hexToColor('#FFFFFF'),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(2),
                            bottomRight: Radius.circular(2),
                          ),
                          border: Border.all(
                            color: hexToColor('#C2D8E0'),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            KText(
                              text: 'Average Days',
                              color: hexToColor('#434969'),
                              fontSize: 14,
                            ),
                            KText(
                              text: 'to close',
                              color: hexToColor('#434969'),
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 34,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: hexToColor('#C2D8E0'),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(2),
                            topRight: Radius.circular(2),
                          ),
                        ),
                        child: KText(
                          text: '0.0',
                          color: hexToColor('#434969'),
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: hexToColor('#FFFFFF'),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(2),
                            bottomRight: Radius.circular(2),
                          ),
                          border: Border.all(
                            color: hexToColor('#C2D8E0'),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            KText(
                              text: 'Average User',
                              color: hexToColor('#434969'),
                              fontSize: 14,
                            ),
                            KText(
                              text: 'Rating',
                              color: hexToColor('#434969'),
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
