import 'package:flutter/material.dart';
import 'package:the_citizen_app/src/config/base.dart';
//import 'package:collection/collection.dart' show IterableExtension;

import '../components/CTrendsAd.dart';
import '../components/NoticeBoard.dart';
import '../components/agency_list_component.dart';

class HomePage extends StatefulWidget with Base {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Base {
  @override
  Widget build(BuildContext context) {  attendanceC.getAttendaneHistory();
    employeeLeaveManageMentC.getLeaveTypeList();
    locationTraceC.attendanceCheck();
    employeeLeaveManageMentC.getLeaveBalance();
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              AgencyListComponent(),
              SizedBox(height: 20.0),
              CTrendsAd(),
              SizedBox(height: 20.0),
              NoticeBoard(),
              // Text("${agencyC.agencyList.length}"),

              // TextButton(
              //   onPressed: () {},
              //   child: KText(text: 'Go'),
              // )
              //
            ],
          ),
        ),
      ),
    );
  }
}

//ToDo: have to implement -> not available in offline mode

///==================================================================////

class _HomeContent extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        if (orientation == Orientation.landscape) {
          return Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // _AgencyDropDown(),
                        Text('Orientation.landscape'),
                        //_AgencyDropDown2(),
                        SizedBox(height: 15.0),
                        // _CTrendsAd(),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 15.0),
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        // _NoticeBoard(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Text('data'),
                  // _AgencyDropDown(),
                  //_AgencyDropDown2(),
                  SizedBox(height: 15.0),
                  // _CTrendsAd(),
                  SizedBox(height: 15.0),
                  // _NoticeBoard(),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

// ignore: unused_element
// class _AgencyDropDown extends StatelessWidget with Base {
//   @override
//   Widget build(BuildContext context) {
//     return Visibility(
//       visible: true,
//       //child: DropdownWidget(
//       child: DropdownCustom(
//         title: '',
//         items: agencyC.agencyList,
//         currentItem: '2',
//         keyName: 'agency_id',
//         labelText: 'agency_name',
//         hintText: 'Not found',
//         itemCallBack: (String newValue) async {
//           // if (newValue != null && newValue != '') {
//           //   CtsSharedPreferences.removeKey('changeAgencyId');
//           //   CtsSharedPreferences.setString("changeAgencyId", newValue);
//           //   BlocProvider.of<HomeBloc>(context).add(AgencyChanged(newValue, state.agencies));
//           //   BlocProvider.of<EmployeeAttendanceBloc>(context).add(UpdateEmployeeOfficeTimeInLocalDB());
//           //   BlocProvider.of<EmployeeAttendanceBloc>(context).add(UpdateDailyInOutAtLocalDB());

//           //   if (CtsSharedPreferences.getString(loginMode) == LoginMode.ONLINE.name) {
//           //     final SyncNotice notice = SyncNotice();
//           //     final isShoutNoticeVersionUpdate = await notice.sync();
//           //     if (isShoutNoticeVersionUpdate) {
//           //       BlocProvider.of<HomeBloc>(context).add(NoticeFetched());
//           //     } else {
//           //       BlocProvider.of<HomeBloc>(context).add(NoticeFetched());
//           //     }
//           //   } else {
//           //     BlocProvider.of<HomeBloc>(context).add(NoticeFetched());
//           //   }
//           // }
//         },
//       ),
//     );
//   }
// }
