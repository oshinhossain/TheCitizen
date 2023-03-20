import 'package:flutter/material.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';
import '../helpers/dialogHelper.dart';

class EnrollMyBiometricsPage extends StatefulWidget {
  @override
  _EnrollMyBiometricsPageState createState() =>
      new _EnrollMyBiometricsPageState();
}

class _EnrollMyBiometricsPageState extends State<EnrollMyBiometricsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.appBarColor,
        title: Text('Enroll My Biometrics'),
        // Text("${widget.title}"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 10.0, 10.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: biometricCardContainer(
                    context: context,
                    cardColor: Colors.redAccent,
                    splashColor: Colors.green,
                    icon: Icons.fingerprint,
                    title: 'Finger Print',
                    buttonPress: () {
                      snackbar();
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: biometricCardContainer(
                    context: context,
                    cardColor: Colors.lightGreen,
                    splashColor: Colors.green,
                    icon: Icons.remove_red_eye,
                    title: 'Retina Scan',
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
                    cardColor: Colors.lightBlueAccent,
                    splashColor: Colors.green,
                    icon: Icons.record_voice_over,
                    title: 'Voice Recognition',
                    buttonPress: () {
                      snackbar();
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: biometricCardContainer(
                    context: context,
                    cardColor: Colors.blueGrey,
                    splashColor: Colors.green,
                    icon: Icons.record_voice_over,
                    title: 'Face Recognition',
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

  Widget biometricCardContainer({
    required BuildContext context,
    Color? cardColor,
    Color? splashColor,
    VoidCallback? buttonPress,
    IconData? icon,
    String? title,
  }) {
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
              Icon(
                icon,
                color: Colors.white,
                size: 35.0,
              ),
              // icon
              Text(
                title!,
                style: TextStyle(fontSize: 17.0, color: Colors.white),
              ),
              // text
            ],
          ),
        ),
      ),
    );
  }
}
