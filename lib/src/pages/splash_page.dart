import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_citizen_app/src/controllers/config_controller.dart';
import 'package:the_citizen_app/src/helpers/hex_color.dart';

import '../helpers/render_svg.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Get.put(ConfigController()).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Container(
    //     decoration: BoxDecoration(
    //       gradient: LinearGradient(
    //         begin: Alignment.topCenter,
    //         end: Alignment.bottomCenter,
    //         colors: [
    //           hexToColor('#33A0DA'),
    //           hexToColor('#AFD6EB'),
    //           hexToColor('#FFFFFF'),
    //           hexToColor('#FFFFFF'),
    //         ],
    //       ),
    //     ),

    //     child: Container(
    //       color: Colors.white,
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //           Container(
    //             color: Colors.white,
    //             width: MediaQuery.of(context).size.width,
    //             height: 300,
    //             child: Container(
    //                 // decoration: BoxDecoration(
    //                 //   color: Colors.white,
    //                 //   borderRadius: const BorderRadius.only(
    //                 //     topLeft: Radius.circular(10),
    //                 //     topRight: Radius.circular(10),
    //                 //   ),
    //                 // ),
    //                 child: Image.asset('assets/images/city_theme.png',
    //                     fit: BoxFit.fill)),
    //           ),
    //           SizedBox(height: 30),
    //           //  Spacer(),
    //           Container(
    //             color: Colors.white,
    //             child: Center(
    //               child: Container(
    //                   height: 171,
    //                   width: 275,
    //                   child: Image.asset('assets/images/citizen_logo.png',
    //                       fit: BoxFit.fill)),
    //             ),
    //           ),
    //           Spacer(),
    //           Container(
    //             color: Colors.white,
    //             child: Center(
    //                 child: Container(
    //                     width: 100,
    //                     height: 60,
    //                     child: Image.asset('assets/images/ctrends_logo.png',
    //                         fit: BoxFit.fill))),
    //           ),
    //           SizedBox(height: 20)
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return Container(
      color: hexToColor('#D1EDFA'),
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Container(
                  child: Image.asset(
                    'assets/images/city_theme.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Spacer(flex: 1),
              Container(
                color: Colors.white,
                child: Center(
                  child: Container(
                    height: 131,
                    width: 275,
                    child: Image.asset(
                      'assets/images/shout_logo.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Spacer(flex: 3),
              // Container(
              //   color: Colors.white,
              //   child: Center(
              //     child: Container(
              //       width: 100,
              //       height: 60,
              //       child: Image.asset(
              //         'assets/images/ctrends_logo.png',
              //         fit: BoxFit.fill,
              //       ),
              //     ),
              //   ),
              // ),
              RenderSvg(
                path: 'ctrends_logo',
                width: 100,
                color: hexToColor('#8FC2F0'),
              ),
              SizedBox(height: 35)
            ],
          ),
        ),
      ),
    );
  }
}
