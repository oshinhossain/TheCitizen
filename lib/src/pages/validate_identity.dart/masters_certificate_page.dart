import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/helpers/route.dart';
import '../../config/app_theme.dart';
import '../../config/constants.dart';

class MasterCertificatePage extends StatelessWidget {
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
          'Masters Certificate',
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
                              text: 'Certificate No::',
                              fontSize: 13,
                              bold: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            KText(
                              text: 'Subject ',
                              fontSize: 13,
                              bold: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            KText(
                              text: 'University/Institution:',
                              fontSize: 13,
                              bold: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            KText(
                              text: 'Passing Year:',
                              fontSize: 13,
                              bold: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            KText(
                              text: 'Result:',
                              fontSize: 13,
                              bold: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            KText(
                              text: 'Father:',
                              fontSize: 13,
                              bold: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            KText(
                              text: 'Mother:',
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
                              text: 'No Data',
                              fontSize: 13,
                              bold: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            KText(
                              text: 'MD. ARAFAT KABIR',
                              fontSize: 13,
                              bold: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            KText(
                              text: '10 January 1982',
                              fontSize: 13,
                              bold: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            KText(
                              text: 'Male',
                              fontSize: 13,
                              bold: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            KText(
                              text: 'No Data',
                              fontSize: 13,
                              bold: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            KText(
                              text: 'MD. SHAHJAHAN KABIR',
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
                            SizedBox(
                              height: 10,
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
                          height: 150,
                          width: 220,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Image.asset(
                              '${Constants.imgPath}/no_image.png',
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
                          width: 60,
                        ),
                        Container(
                          height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                              color: hexToColor('#78909C'),
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                              child: KText(
                            text: 'Validate',
                            fontSize: 17.0,
                            color: Colors.white,
                          )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 40,
                backgroundColor: hexToColor('#004C3F'),
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
