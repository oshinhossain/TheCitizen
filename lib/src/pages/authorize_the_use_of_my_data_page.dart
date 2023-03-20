import 'package:flutter/material.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';

class AuthorizeTheUseOfMyDataPage extends StatefulWidget {
  // AuthorizeTheUseOfMyData({Key key, this.title}) : super(key: key);

//  final String title;
  @override
  _AuthorizeTheUseOfMyDataPageState createState() =>
      new _AuthorizeTheUseOfMyDataPageState();
}

class _AuthorizeTheUseOfMyDataPageState
    extends State<AuthorizeTheUseOfMyDataPage> {
  bool checkBoxValue1 = false;
  bool checkBoxValue2 = false;
  bool checkBoxValue3 = false;
  bool checkBoxValue4 = false;
  bool checkBoxValue5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.appBarColor,
        title: Text('Authorize the Use of My Data'),
        // Text("${widget.title}"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10, top: 5, bottom: 5),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Colors.white),
              ),
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  print("save");
                }, // needed
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Center(child: Icon(Icons.save)),
                ),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          /*Card(
            elevation: 5,
            //color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              side: BorderSide(color: Colors.white),
            ),
            child: InkWell(
              onTap: () {},
              child: Container(
                // decoration: BoxDecoration(
                //   gradient: LinearGradient(
                //     colors: [Colors.grey[200], AppColors.subBarColor],
                //   ),
                // ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 10),
                      child: Text(
                        "The following information will be stored and processed based on your consent. Please tick the following"
                        " options to give your consent: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          //padding: EdgeInsets.all(5.0),
                          child: Column(
                            children: <Widget>[
                              new Checkbox(
                                  value: checkBoxValue1,
                                  activeColor: AppColors.appBarColor,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      checkBoxValue1 = newValue;
                                    });
                                  }),
                            ],
                          ),
                        ),
                        Text(
                          "Your GPS location trace for rescue shouts",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          //padding: EdgeInsets.all(5.0),
                          child: Column(
                            children: <Widget>[
                              new Checkbox(
                                  value: checkBoxValue2,
                                  activeColor: AppColors.appBarColor,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      checkBoxValue2 = newValue;
                                    });
                                  }),
                            ],
                          ),
                        ),
                        Text(
                          "Check Box -2",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          //padding: EdgeInsets.all(5.0),
                          child: Column(
                            children: <Widget>[
                              new Checkbox(
                                  value: checkBoxValue3,
                                  activeColor: AppColors.appBarColor,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      checkBoxValue3 = newValue;
                                    });
                                  }),
                            ],
                          ),
                        ),
                        Text(
                          "Check Box -3",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          //padding: EdgeInsets.all(5.0),
                          child: Column(
                            children: <Widget>[
                              new Checkbox(
                                  value: checkBoxValue4,
                                  activeColor: AppColors.appBarColor,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      checkBoxValue4 = newValue;
                                    });
                                  }),
                            ],
                          ),
                        ),
                        Text(
                          "Check Box -4",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          //padding: EdgeInsets.all(5.0),
                          child: Column(
                            children: <Widget>[
                              new Checkbox(
                                  value: checkBoxValue5,
                                  activeColor: AppColors.appBarColor,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      checkBoxValue5 = newValue;
                                    });
                                  }),
                            ],
                          ),
                        ),
                        Text(
                          "Check Box -5",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),*/
          Card(
            elevation: 5,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.all(Radius.circular(5)),
            //   side: BorderSide(color: Colors.white),
            // ),
            child: InkWell(
              onTap: () {},
              child: Container(
                // decoration: BoxDecoration(
                //   gradient: LinearGradient(
                //     colors: [Colors.grey[200], AppColors.subBarColor],
                //   ),
                // ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, top: 20, right: 10, bottom: 10),
                      child: Text(
                        "The following information are required for the App to properly function. If you do not want the "
                        "App to store and process, we suggest you to delete the App:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      leading: CircleAvatar(
                        radius: 10,
                        backgroundColor: AppTheme.appBarColor,
                      ),
                      title: Text("Your GPS location with shout"),
                    ),
                    ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      leading: CircleAvatar(
                        radius: 10,
                        backgroundColor: AppTheme.appBarColor,
                      ),
                      title: Text("Your camera and microphone access"),
                    ),
                    ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      leading: CircleAvatar(
                        radius: 10,
                        backgroundColor: AppTheme.appBarColor,
                      ),
                      title: Text("Your name and photo"),
                    ),
                    ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      leading: CircleAvatar(
                        radius: 10,
                        backgroundColor: AppTheme.appBarColor,
                      ),
                      title: Text("Your mobile number and email address"),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
