import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/route.dart';

import '../../config/app_theme.dart';
import '../../config/constants.dart';
import '../../helpers/dialogHelper.dart';
import '../validate_my_Identity/passport_page.dart';
import 'birth_certification_page.dart';
import 'masters_certificate_page.dart';
import 'national_identity_page.dart';

class ValidateMyIdentity extends StatelessWidget {
  const ValidateMyIdentity({super.key});

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
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: biometricCardContainer(
                    context: context,
                    cardColor: Colors.lightBlueAccent,
                    splashColor: Colors.green,
                    icon: Icons.fingerprint,
                    title: 'National\nIdentity',
                    subtitle: 'Submitted',
                    statusIcon: 'up_arrow.svg',
                    color: hexToColor('#00BCD5'),
                    buttonPress: () {
                      push(NationalIdentity());
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: biometricCardContainer(
                    context: context,
                    cardColor: Colors.blueGrey,
                    splashColor: Colors.green,
                    icon: Icons.remove_red_eye,
                    title: '     Birth\nCertificate',
                    subtitle: 'No Data',
                    color: hexToColor('#8C8D92'),
                    statusIcon: 'no_data.svg',
                    buttonPress: () {
                      push(BirthCertificationPage());
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: biometricCardContainer(
                    context: context,
                    cardColor: Colors.redAccent,
                    splashColor: Colors.green,
                    icon: Icons.record_voice_over,
                    title: 'Passport',
                    subtitle: 'Rejected',
                    color: hexToColor('#FF5353'),
                    statusIcon: 'cross.svg',
                    buttonPress: () {
                      push(PassportPage());
                      // snackbar();
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: biometricCardContainer(
                    context: context,
                    cardColor: hexToColor('#004C3F'),
                    splashColor: Colors.green,
                    icon: Icons.record_voice_over,
                    title: 'TIN',
                    subtitle: 'Data Added',
                    color: hexToColor('#004C3F'),
                    statusIcon: 'right_cross.svg',
                    buttonPress: () {
                      snackbar();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: biometricCardContainer(
                    context: context,
                    cardColor: hexToColor('#004C3F'),
                    splashColor: Colors.green,
                    icon: Icons.record_voice_over,
                    title: '  Masters\nCertificate',
                    subtitle: 'Rejected',
                    color: hexToColor('#004C3F'),
                    statusIcon: 'cross.svg',
                    buttonPress: () {
                      push(MasterCertificatePage());
                      // snackbar();
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: biometricCardContainer(
                    context: context,
                    cardColor: hexToColor('#43A047'),
                    splashColor: Colors.green,
                    icon: Icons.record_voice_over,
                    title: 'Bachelors\nCertificate',
                    subtitle: 'Data Added',
                    color: hexToColor('#43A047'),
                    statusIcon: 'right_cross.svg',
                    buttonPress: () {
                      snackbar();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
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
}
