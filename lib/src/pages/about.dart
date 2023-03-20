import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';

class AboutUs extends StatefulWidget {
  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: SafeArea(child: Image.asset('assets/images/cts_logo.png')),
        title: 'CTrends Software & Services Limited',
        body:
            'We bring innovation to your business and innovation leads to success',
        footer: Card(
          color: AppTheme.cardColor,
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                    'Plot - 76 (4th Floor), Block - B, Road – 4, Niketan, Gulshan – 1, Dhaka – 1212, Bangladesh'),
                SizedBox(height: 5.0),
                Divider(height: 1, thickness: 1, color: Colors.white),
                SizedBox(height: 5.0),
                Text('Email: office@ctrends-software.com'),
                SizedBox(height: 5),
                Divider(height: 1, thickness: 1, color: Colors.white),
                SizedBox(height: 5.0),
                Text('Phone: +880 2 9882801'),
              ],
            ),
          ),
        ),
      ),
      PageViewModel(
        image: SafeArea(
          child: Image.asset('assets/images/our_services.jpg',
              fit: BoxFit.contain),
        ),
        title: 'Our Products',
        body:
            'We develop products that can be configured by our clients or consultants to meet client business need',
        footer: Card(
          color: AppTheme.cardColor,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Human Resource Management'),
                SizedBox(height: 5.0),
                Divider(height: 1, thickness: 1, color: Colors.white),
                SizedBox(height: 5.0),
                Text('Supply Chain Management'),
                SizedBox(height: 5.0),
                Divider(height: 1, thickness: 1, color: Colors.white),
                SizedBox(height: 5.0),
                Text('Financial Management'),
                SizedBox(height: 5.0),
                Divider(height: 1, thickness: 1, color: Colors.white),
                SizedBox(height: 5.0),
                Text('Sales & Marketing Management (CRM)'),
                SizedBox(height: 5.0),
                Divider(height: 1, thickness: 1, color: Colors.white),
                SizedBox(height: 5),
                Text('Production & Quality Management'),
                SizedBox(height: 5.0),
                Divider(height: 1, thickness: 1, color: Colors.white),
                SizedBox(height: 5.0),
                Text('GRC Platform'),
                SizedBox(height: 5.0),
                Divider(height: 1, thickness: 1, color: Colors.white),
                SizedBox(height: 5.0),
                Text('CXO Cockpit'),
                SizedBox(height: 5.0),
                Divider(height: 1, thickness: 1, color: Colors.white),
                SizedBox(height: 5.0),
                Text('Tasks & Activities Management'),
              ],
            ),
          ),
        ),
      ),
      PageViewModel(
        titleWidget: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Text('Credits',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )),
        ),
        body:
            'We recognise and express our gratuity to those who participated in the development of this app:',
        footer: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 5.0,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 22.0,
                  backgroundColor: AppTheme.appBarColor,
                  child: CircleAvatar(
                    radius: 20.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset(
                        'assets/images/ruhul_amin.jpeg',
                        fit: BoxFit.cover,
                        height: 40.0,
                        width: 40.0,
                      ),
                    ),
                  ),
                ),
                title: Text('Md. Ruhul Amin'),
                subtitle: Text('Programmer'),
              ),
            ),
            Card(
              elevation: 5.0,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 22.0,
                  backgroundColor: AppTheme.appBarColor,
                  child: CircleAvatar(
                    radius: 20.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset(
                        'assets/images/abdur_rahim_min.png',
                        fit: BoxFit.cover,
                        height: 40.0,
                        width: 40.0,
                      ),
                    ),
                  ),
                ),
                title: Text('Md. Abdur Rahim'),
                subtitle: Text('Programmer'),
              ),
            ),
            Card(
              elevation: 5.0,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 22.0,
                  backgroundColor: AppTheme.appBarColor,
                  child: CircleAvatar(
                    radius: 20.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset(
                        'assets/images/rahamat_ullah.jpeg',
                        fit: BoxFit.cover,
                        height: 40.0,
                        width: 40.0,
                      ),
                    ),
                  ),
                ),
                title: Text('Md. Rahamat Ullah'),
                subtitle: Text('Programmer'),
              ),
            ),
            Card(
              elevation: 5.0,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 22.0,
                  backgroundColor: AppTheme.appBarColor,
                  child: CircleAvatar(
                    radius: 20.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset(
                        'assets/images/nazrul_islam.jpg',
                        fit: BoxFit.cover,
                        height: 40.0,
                        width: 40.0,
                      ),
                    ),
                  ),
                ),
                title: Text('Md. Nazrul Islam'),
                subtitle: Text('Programmer'),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: getPages(),
        next: const Icon(Icons.arrow_forward),
        done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
        //done: const Text('Done', style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w600)),
        onDone: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
      ),
    );
  }
}
