import 'package:flutter/material.dart';

import '../helpers/route.dart';
import 'main_page.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 4000), () {
      offAll(MainPage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child:
            Image.asset('assets/gif/loading_animation.gif', fit: BoxFit.fill),
      ),
    );
  }
}
