import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';

class SyncOfflineShout extends StatefulWidget {
  // final String title;

  // const SyncOfflineShout({super.key, required this.title});

  @override
  State<SyncOfflineShout> createState() => _SyncOfflineShoutState();
}

class _SyncOfflineShoutState extends State<SyncOfflineShout> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   centerTitle: true,
      //   backgroundColor: AppTheme.backgroundColor,
      //   iconTheme: IconThemeData(
      //     color: AppTheme.textColor6,
      //   ),
      //   title: Text(
      //     "${widget.title}",
      //     style: TextStyle(
      //       fontFamily: 'Manrope',
      //       fontSize: 18.0,
      //       color: AppTheme.appBarTextColor,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _ShoutStoredInDevice(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _SyncButton(),
    );
  }
}

class _ShoutStoredInDevice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      header: Column(
        children: [
          // Text('Offline shouts synced with server: ',
          //   style: TextStyle(fontSize: 20),
          // ),
          Text(
            'Offline shouts stored in this device: ',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
        ],
      ),
      // animationDuration: 2200,
      // animation: true,
      radius: 120.0,
      lineWidth: 25.0,
      percent: 0.0,
      center: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '0',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 40,
              color: Colors.grey,
            ),
          )
        ],
      ),
      // center: Text(
      //             state.numberOfShoutStoredInDevice.toString(),
      //             style: TextStyle(
      //               fontWeight: FontWeight.w700,
      //               fontSize: 40,
      //               color: Colors.grey,
      //             ),
      //           ),
      circularStrokeCap: CircularStrokeCap.butt,
      backgroundColor: 0 == 0 ? Colors.grey.shade300 : Colors.grey,
      progressColor: Colors.green,
    );
  }
}

class _SyncButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: ElevatedButton.icon(
        // style: ElevatedButton.styleFrom(
        //   // primary: AppColors.appBarColor,
        //   primary: hexToColor('#F2BA14'),
        //   minimumSize: Size(double.infinity, 45.0),
        // ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(hexToColor('#F2BA14')),
        ),
        onPressed: () {
          // log('state inside button ${state.internetConnectionState}');
          // if (state.internetConnectionState == InternetConnectionState.NOT_CONNECTED) {
          //   commonToast(context: context, message: 'No internet connection');
          // } else {
          //   context.read<SyncOfflineShoutBloc>().add(ShoutSubmittedToServer());
          // }
        },
        //backgroundColor: AppColors.appBarColor,
        label: Text('Sync Shout'),
        icon: Icon(
          Icons.sync,
          color: Colors.white,
        ),
      ),
    );
  }
}
