import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/helpers/route.dart';

import '../../config/app_theme.dart';
import '../../config/constants.dart';

class MobileNumberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppTheme.backgroundColor,
        iconTheme: IconThemeData(
          color: AppTheme.textColor6,
        ),
        leading: GestureDetector(
            onTap: () {
              back();
            },
            child: Icon(Icons.arrow_back)),
        title: Text(
          'Mobile Number',
          style: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 18.0,
            color: AppTheme.appBarTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                // Bottom rectangular box
                margin: EdgeInsets.only(top: 40),
                // to push the box half way below circle
                decoration: BoxDecoration(
                  color: hexToColor('#EEFDFF'),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.only(top: 60, left: 20, right: 20),
                // spacing inside the box
                child: Column(
                  children: <Widget>[
                    // Text(
                    //   'kjjknj',
                    //   style: Theme.of(context).textTheme.headline3,
                    // ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            KText(
                              text: 'Mobile No:',
                              fontSize: 13,
                              bold: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            KText(
                              text: 'SIM No:',
                              fontSize: 13,
                              bold: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            KText(
                              text: 'SIM Type:',
                              fontSize: 13,
                              bold: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            KText(
                              text: 'Date of Sale:',
                              fontSize: 13,
                              bold: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            KText(
                              text: 'Operator:',
                              fontSize: 13,
                              bold: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            KText(
                              text: 'Attachement:',
                              fontSize: 13,
                              bold: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            KText(
                              text: '01717448877',
                              fontSize: 13,
                              bold: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            KText(
                              text: '899100900250850783F',
                              fontSize: 13,
                              bold: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            KText(
                              text: 'Prepaid',
                              fontSize: 13,
                              bold: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            KText(
                              text: '12 August 2004',
                              fontSize: 13,
                              bold: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            KText(
                              text: 'Grameenphone',
                              fontSize: 13,
                              bold: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            KText(
                              text: 'NAJMA BEGUM',
                              fontSize: 13,
                              bold: true,
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        KText(
                          text: 'Attachment:',
                          fontSize: 13,
                          bold: true,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 270,
                          width: 220,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Image.asset(
                              '${Constants.imgPath}/passport.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        KText(
                          text: 'Status:',
                          fontSize: 13,
                          bold: true,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                              color: hexToColor('#FF5353'),
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                '${Constants.svgPath}/cross.svg',
                                width: 25,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Rejected',
                                style: TextStyle(
                                    fontSize: 17.0, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
              CircleAvatar(
                radius: 40,
                backgroundColor: hexToColor('#FF5353'),
                child: ImageIcon(
                  AssetImage("assets/images/book.png"),
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
