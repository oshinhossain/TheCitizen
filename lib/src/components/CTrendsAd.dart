import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CTrendsAd extends StatefulWidget {
  @override
  _CTrendsAdState createState() => _CTrendsAdState();
}

class _CTrendsAdState extends State<CTrendsAd> {
  int _currentIndex = 0;

  final addddd = [
    'assets/images/city_theme.png',
    'assets/images/city_theme.png',
    'assets/images/city_theme.png',
  ];
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width - 30.0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(children: [
          CarouselSlider(
            carouselController: _controller,
            items: addddd
                .map(
                  (item) => Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Center(
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
                //height: 110.0,
                aspectRatio: 16 / 9,
                // pageSnapping: false,
                //  height: 180,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                viewportFraction: 1.0,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: false,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                }),
          ),
          Positioned(
            bottom: 10,
            //left: 150,
            left: (screenWidth - (2 * (addddd.length) - 1) * 8.0) / 2.0,
            child: AnimatedSmoothIndicator(
              activeIndex: _currentIndex,
              count: addddd.length,
              duration: Duration(milliseconds: 500),
              effect: WormEffect(
                spacing: 8.0,
                dotHeight: 8.0,
                dotWidth: 8.0,
                dotColor: Color(0xFF434969),
                activeDotColor: Color(0xFFF2BA14),
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
