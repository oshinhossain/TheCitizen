import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/pages/validate_my_Identity/bachelorsCertificatePage.dart';
import 'package:the_citizen_app/src/pages/validate_my_Identity/birth_certificate_page.dart';
import 'package:the_citizen_app/src/pages/validate_my_Identity/hscCertificatePage.dart';
import 'package:the_citizen_app/src/pages/validate_my_Identity/mastersCertificatePage.dart';
import 'package:the_citizen_app/src/pages/validate_my_Identity/mobile_validate_page.dart';
import 'package:the_citizen_app/src/pages/validate_my_Identity/motorDrivingLicencePag.dart';
import 'package:the_citizen_app/src/pages/validate_my_Identity/national_id_page.dart';
import 'package:the_citizen_app/src/pages/validate_my_Identity/passport_page.dart';
import 'package:the_citizen_app/src/pages/validate_my_Identity/sscCertificatePage.dart';
import 'package:the_citizen_app/src/pages/validate_my_Identity/tin_page.dart';
import '../../config/app_theme.dart';
import '../../config/constants.dart';
import '../../helpers/hex_color.dart';
import '../../helpers/route.dart';

class ValidateMyIdentityPage extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    ValidateIdentityC.getValidateIdentityStatusGet();
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
            'Validate My Identity',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 18.0,
              color: AppTheme.appBarTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [

          //       // SizedBox(height: 10),
          //       // Row(
          //       //   children: [
          //       //     Expanded(
          //       //       child: biometricCardContainer(
          //       //         context: context,
          //       //         cardColor: Colors.redAccent,
          //       //         splashColor: Colors.green,
          //       //         icon: Icons.record_voice_over,
          //       //         title: 'Passport',
          //       //         subtitle: 'Rejected',
          //       //         color: hexToColor('#FF5353'),
          //       //         statusIcon: 'cross.svg',
          //       //         buttonPress: () {
          //       //           push(PassportPage());
          //       //           // snackbar();
          //       //         },
          //       //       ),
          //       //     ),
          //       //     SizedBox(width: 10),
          //       //     Expanded(
          //       //       child: biometricCardContainer(
          //       //         context: context,
          //       //         cardColor: hexToColor('#004C3F'),
          //       //         splashColor: Colors.green,
          //       //         icon: Icons.record_voice_over,
          //       //         title: 'TIN',
          //       //         subtitle: 'Data Added',
          //       //         color: hexToColor('#004C3F'),
          //       //         statusIcon: 'right_cross.svg',
          //       //         buttonPress: () {
          //       //           snackbar();
          //       //         },
          //       //       ),
          //       //     ),
          //       //   ],
          //       // ),
          //       // SizedBox(height: 10),
          //       // Row(
          //       //   children: [
          //       //     Expanded(
          //       //       child: biometricCardContainer(
          //       //         context: context,
          //       //         cardColor: hexToColor('#004C3F'),
          //       //         splashColor: Colors.green,
          //       //         icon: Icons.record_voice_over,
          //       //         title: '  Masters\nCertificate',
          //       //         subtitle: 'Rejected',
          //       //         color: hexToColor('#004C3F'),
          //       //         statusIcon: 'cross.svg',
          //       //         buttonPress: () {
          //       //           push(MasterCertificatePage());
          //       //           // snackbar();
          //       //         },
          //       //       ),
          //       //     ),
          //       //     SizedBox(width: 10),
          //       //     Expanded(
          //       //       child: biometricCardContainer(
          //       //         context: context,
          //       //         cardColor: hexToColor('#43A047'),
          //       //         splashColor: Colors.green,
          //       //         icon: Icons.record_voice_over,
          //       //         title: 'Bachelors\nCertificate',
          //       //         subtitle: 'Data Added',
          //       //         color: hexToColor('#43A047'),
          //       //         statusIcon: 'right_cross.svg',
          //       //         buttonPress: () {
          //       //           snackbar();
          //       //         },
          //       //       ),
          //       //     ),
          //       //   ],
          //       // ),
          //     ],
          //   ),
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
            ),
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/gdDataSubmitited.png'),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    KText(
                      text: 'National \n Identity',
                      fontSize: 16,
                      color: Colors.white,
                      bold: true,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        '${Constants.svgPath}/nid_card.svg',
                        color: AppTheme.white,
                      ),
                    ),
                    SizedBox(
                      width: 103,
                      height: 30,
                      child: OutlinedButton(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              '${Constants.svgPath}/up_arrow.svg',
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Submitted'),
                          ],
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(5),
                          primary: Colors.white,
                          backgroundColor: hexToColor('#00BCD5'),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                        ),
                        onPressed: () {
                          ValidateIdentityC.getValidateIdentityStatusGet();
                          push(NationalIdPage());
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bgNodata.png'),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    KText(
                      text: 'Birth \n Certificate',
                      fontSize: 16,
                      color: Colors.white,
                      bold: true,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        '${Constants.svgPath}/birth_certificate.svg',
                        color: AppTheme.white,
                      ),
                    ),
                    SizedBox(
                      width: 90,
                      height: 30,
                      child: OutlinedButton(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              '${Constants.svgPath}/no_data.svg',
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('No Data'),
                          ],
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(5),
                          primary: Colors.white,
                          backgroundColor: hexToColor('#8C8D92'),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                        ),
                        onPressed: () {
                          push(BirthCertificatePage());
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bgRejected.png'),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    KText(
                      text: 'Passport',
                      fontSize: 16,
                      color: Colors.white,
                      bold: true,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        '${Constants.svgPath}/passport_new.svg',
                        color: AppTheme.white,
                      ),
                    ),
                    SizedBox(
                      width: 96,
                      height: 30,
                      child: OutlinedButton(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              '${Constants.svgPath}/cross.svg',
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Rejected'),
                          ],
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(5),
                          primary: Colors.white,
                          backgroundColor: hexToColor('#FF5353'),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                        ),
                        onPressed: () {
                          push(PassportPage());
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bgDataAdded.png'),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    KText(
                      text: 'TIN',
                      fontSize: 16,
                      color: Colors.white,
                      bold: true,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        '${Constants.svgPath}/tax_new.svg',
                        color: AppTheme.white,
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      height: 30,
                      child: OutlinedButton(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              '${Constants.svgPath}/right_cross.svg',
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Data Added'),
                          ],
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(5),
                          primary: Colors.white,
                          backgroundColor: hexToColor('#004C3F'),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                        ),
                        onPressed: () {
                          push(TinPage());
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bgDataAdded.png'),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    KText(
                      text: 'Masters \n Certificate',
                      fontSize: 16,
                      color: Colors.white,
                      bold: true,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        '${Constants.svgPath}/Masters_certificate_2.svg',
                        color: AppTheme.white,
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      height: 30,
                      child: OutlinedButton(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              '${Constants.svgPath}/right_cross.svg',
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Data Added'),
                          ],
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(5),
                          primary: Colors.white,
                          backgroundColor: hexToColor('#004C3F'),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                        ),
                        onPressed: () {
                          push(MastersCertificatePage());
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bgValidated.png'),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    KText(
                      text: 'Bachelors \n Certificate',
                      fontSize: 16,
                      color: Colors.white,
                      bold: true,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        '${Constants.svgPath}/bachelors_certificate_2.svg',
                        color: AppTheme.white,
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 30,
                      child: OutlinedButton(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              '${Constants.svgPath}/right_cross.svg',
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Validated'),
                          ],
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(5),
                          primary: Colors.white,
                          backgroundColor: hexToColor('#43A047'),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                        ),
                        onPressed: () {
                          push(BachelorsCertificatePage());
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bgValidated.png'),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    KText(
                      text: 'HSC \n Certificate',
                      fontSize: 16,
                      color: Colors.white,
                      bold: true,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        '${Constants.svgPath}/Hsc_certificate.svg',
                        color: AppTheme.white,
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 30,
                      child: OutlinedButton(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              '${Constants.svgPath}/right_cross.svg',
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Validated'),
                          ],
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(5),
                          primary: Colors.white,
                          backgroundColor: hexToColor('#43A047'),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                        ),
                        onPressed: () {
                          push(HscCertificatePage());
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/gdDataSubmitited.png'),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    KText(
                      text: 'SSC \n Certificate',
                      fontSize: 16,
                      color: Colors.white,
                      bold: true,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        '${Constants.svgPath}/ssc_certificate.svg',
                        color: AppTheme.white,
                      ),
                    ),
                    SizedBox(
                      width: 103,
                      height: 30,
                      child: OutlinedButton(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              '${Constants.svgPath}/up_arrow.svg',
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Submitted'),
                          ],
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(5),
                          primary: Colors.white,
                          backgroundColor: hexToColor('#00BCD5'),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                        ),
                        onPressed: () {
                          push(SscCertificatePage());
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/gdDataSubmitited.png'),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    KText(
                      text: 'Motor Driving \n Licence',
                      fontSize: 16,
                      color: Colors.white,
                      bold: true,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        '${Constants.svgPath}/driving_license.svg',
                        color: AppTheme.white,
                      ),
                    ),
                    SizedBox(
                      width: 103,
                      height: 30,
                      child: OutlinedButton(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              '${Constants.svgPath}/up_arrow.svg',
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Submitted'),
                          ],
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(5),
                          primary: Colors.white,
                          backgroundColor: hexToColor('#00BCD5'),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                        ),
                        onPressed: () {
                          push(motorDrivingLicencePage());
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/gdDataSubmitited.png'),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    KText(
                      text: 'Mobile \n Number',
                      fontSize: 16,
                      color: Colors.white,
                      bold: true,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        '${Constants.svgPath}/mobile_number.svg',
                        color: AppTheme.white,
                      ),
                    ),
                    SizedBox(
                      width: 103,
                      height: 30,
                      child: OutlinedButton(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              '${Constants.svgPath}/up_arrow.svg',
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Submitted'),
                          ],
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(5),
                          primary: Colors.white,
                          backgroundColor: hexToColor('#00BCD5'),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                        ),
                        onPressed: () {
                          push(MobileValidatePage());
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

Widget biometricCardContainer(
    {required BuildContext context,
    Color? cardColor,
    Color? splashColor,
    VoidCallback? buttonPress,
    IconData? icon,
    String? title,
    String? statusIcon,
    String? subtitle,
    Color? color}) {
  return Container(
    height: MediaQuery.of(context).size.height / 5,
    width: MediaQuery.of(context).size.width / 2 - 33,
    child: Material(
      color: cardColor,
      child: InkWell(
        splashColor: splashColor,
        onTap: buttonPress,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title!,
              style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              icon,
              color: Colors.white,
              size: 35.0,
            ),
            SizedBox(
              height: 10,
            ),
            // icon
            Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                  color: color,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (statusIcon != null)
                    SvgPicture.asset(
                      '${Constants.svgPath}/${statusIcon}',
                      width: 25,
                    ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    subtitle!,
                    style: TextStyle(fontSize: 17.0, color: Colors.white),
                  ),
                ],
              ),
            ),
            // text
          ],
        ),
      ),
    ),
  );
}
