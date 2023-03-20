import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/config/base.dart';

import 'package:the_citizen_app/src/helpers/hex_color.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';
import 'package:the_citizen_app/src/helpers/loading.dart';
import 'package:the_citizen_app/src/helpers/render_svg.dart';
import 'package:the_citizen_app/src/helpers/route.dart';

class SearchOfficersPage extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppTheme.textColor13,
        foregroundColor: AppTheme.textColor15,
        leadingWidth: 30,
        title: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppTheme.textColor1,
            border: Border.all(
              color: AppTheme.borderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 14.0,
              color: AppTheme.appBarColor,
              fontWeight: FontWeight.w400,
            ),
            onChanged: (value) {
              locationTraceC.query.value = value;
            },
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: AppTheme.textColor9,
                ),
                // onPressed: _controller.clear

                onPressed: () {
                  locationTraceC.query.value != '' ? locationTraceC.searchData(true) : null;
                },
              ),
              hintText: 'Search Officer',
              hintStyle: TextStyle(fontFamily: 'Manrope', fontSize: 14, fontWeight: FontWeight.w400, color: AppTheme.appBarColor),
              contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.borderColor, width: 1),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(30),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.borderColor, width: 1),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ),
      body: Obx(
        () => !locationTraceC.isUser.value
            ? locationTraceC.isLoading.value
                ? Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                        ),
                        Loading()
                      ],
                    ),
                  )
                : locationTraceC.searchAgency.isEmpty
                    ? Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 150,
                            ),
                            RenderSvg(
                              path: 'search_list',
                              width: 60,
                              color: hexToColor('#9BA9B3'),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: locationTraceC.searchAgency.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = locationTraceC.searchAgency[index];
                          return GestureDetector(
                            onTap: () {
                              locationTraceC.selectedOfficer.value = '${item['agencyName']}';
                              back();
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 8, bottom: 8),
                              child: Container(
                                  width: Get.width,
                                  // height: 75,
                                  //color: Colors.green,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    border: Border(
                                      left: BorderSide(
                                        color: hexToColor('#DBECFB'),
                                        width: 1.5,
                                      ),
                                      right: BorderSide(
                                        color: hexToColor('#DBECFB'),
                                        width: 1.5,
                                      ),
                                      top: BorderSide(
                                        color: hexToColor('#DBECFB'),
                                        width: 1.5,
                                      ),
                                      bottom: BorderSide(
                                        color: hexToColor('#DBECFB'),
                                        width: 1.5,
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: KText(
                                      text: '${item['agencyName']}',
                                      fontSize: 16,
                                      bold: true,
                                    ),
                                  )),
                            ),
                          );
                        },
                      )
            : locationTraceC.isLoading.value
                ? Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                        ),
                        Loading()
                      ],
                    ),
                  )
                : locationTraceC.searchUsers.isEmpty
                    ? Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 150,
                            ),
                            RenderSvg(
                              path: 'search_list',
                              width: 60,
                              color: hexToColor('#9BA9B3'),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: locationTraceC.searchUsers.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = locationTraceC.searchUsers[index];
                          return GestureDetector(
                            onTap: () {
                              locationTraceC.selectedOfficer.value = '${item['username']}';
                              back();
                            },
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 15, top: 15),
                              child: Container(
                                width: Get.width,
                                height: 75,
                                //color: Colors.green,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  border: Border(
                                    left: BorderSide(
                                      color: hexToColor('#DBECFB'),
                                      width: 1.5,
                                    ),
                                    right: BorderSide(
                                      color: hexToColor('#DBECFB'),
                                      width: 1.5,
                                    ),
                                    top: BorderSide(
                                      color: hexToColor('#DBECFB'),
                                      width: 1.5,
                                    ),
                                    bottom: BorderSide(
                                      color: hexToColor('#DBECFB'),
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        // right: 2,
                                        left: 10,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          //color: Colors.white,
                                          borderRadius: BorderRadius.circular(27),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              spreadRadius: 3,
                                              blurRadius: 5,
                                              offset: Offset(0, 0),
                                            ),
                                          ],
                                        ),
                                        child: CircleAvatar(
                                          radius: 27,
                                          backgroundColor: AppTheme.textColor1,
                                          child: CircleAvatar(
                                            radius: 27 - 2.0,
                                            backgroundColor: AppTheme.textColor29,
                                            // radius: avatarRadius - 2,
                                            // backgroundColor: Colors.white,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(50),
                                              child: Image.asset(
                                                "assets/images/profile_avatar.png",
                                                fit: BoxFit.cover,
                                                width: (27 - 2) * 2,
                                                height: (27 - 2) * 2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              width: 230,
                                              child: KText(
                                                text: !locationTraceC.isUser.value ? '${item['agencyName']}' : '${item['fullname']}',
                                                color: hexToColor('#141C44'),
                                                bold: true,
                                              ),
                                            ),
                                          ),
                                          if (locationTraceC.isUser.value)
                                            Expanded(
                                              child: SizedBox(
                                                width: 230,
                                                child: KText(
                                                  text: '${item['email']}',
                                                  fontSize: 12,
                                                  color: hexToColor('#72778F'),
                                                ),
                                              ),
                                            ),
                                          if (locationTraceC.isUser.value)
                                            KText(
                                              text: '${item['mobile']}',
                                              fontSize: 12,
                                              color: hexToColor('#72778F'),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
      ),
      // bottomNavigationBar: _BottomNavigationSheet(),
    );
  }
}
//   Widget _buildResultList(SearchOfficerState state, {bool isSingleSelected}) {
//     return ListView.builder(
//       controller: _scrollController,
//       itemCount: _calculateListItemCount(state),
//       itemBuilder: (context, index) {
//         if (state is SearchOfficerSuccess) {
//           return index >= state.searchResults.length
//               ? _buildLoaderListItem()
//               : _buildOfficerListItemCard(state.searchResults[index], index, isSingleSelected);
//         } else {
//           return Text('No Data');
//         }
//       },
//     );
//   }

//   Widget _buildOfficerListItemCard(OfficerSearchViewModel manager, index, bool isSingleSelected) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 10, top: 1, left: 1, right: 1),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.all(Radius.circular(5)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.blueGrey,
//             spreadRadius: 1,
//             blurRadius: 1,
//           ),
//         ],
//       ),
//       child: ListTile(
//         contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
//         leading: generateCircleImage(context: context, username: manager.username ?? ''),
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               manager.fullname ?? '',
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                 fontFamily: 'Manrope',
//                 fontSize: 15.0,
//                 color: AppTheme.textColor21,
//                 fontWeight: FontWeight.w500,
//                 height: 1.2,
//               ),
//             ),
//           ],
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             (manager.agencyName != '' && manager.agencyName != null)
//                 ? Text(
//                     manager.agencyName ?? '',
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       fontFamily: 'Manrope',
//                       fontSize: 14.0,
//                       color: AppTheme.textColor20,
//                       fontWeight: FontWeight.w400,
//                       height: 1.2,
//                     ),
//                   )
//                 : SizedBox(),
//             Text(
//               manager.mobile ?? '',
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                 fontFamily: 'Manrope',
//                 fontSize: 14.0,
//                 color: AppTheme.textColor20,
//                 fontWeight: FontWeight.w400,
//                 height: 1.2,
//               ),
//             ),
//           ],
//         ),
//         onTap: () {
//           if (manager != null) {
//             context.read<AssignTaskBloc>().add(
//                   SelectedNewPerson(
//                     officer: manager,
//                   ),
//                 );

//             //location_trace_employee_UI
//             context.read<LocationTraceBloc>().add(
//                   SelectedEmployeePerson(
//                     officer: manager,
//                   ),
//                 );

//             BlocProvider.of<LocationTraceBloc>(context).add(FetchLatLngByUsernameAndDateTime());

//             Navigator.pop(context);
//           }
//         },
//       ),
//     );
//   }

//   Widget _buildLoaderListItem() {
//     return Center(
//       child: Text(''),
//     );
//   }

//   bool _handleScrollNotification(ScrollNotification notification) {
//     if (notification is ScrollEndNotification && _scrollController.position.extentAfter == 0) {
//       _searchBloc.fetchNextResultPage();
//     }
//     return false;
//   }

//   int _calculateListItemCount(SearchOfficerState state) {
//     if (state is SearchOfficerSuccess) {
//       if (state.hasReachedEndOfResults) {
//         return state.searchResults.length;
//       } else {
//         return state.searchResults.length + 1;
//       }
//     } else {
//       return 0;
//     }
//   }
// }

// class _BottomNavigationSheet extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeBloc, HomeState>(
//       builder: (BuildContext context, state) {
//         return bottomNavigationForOtherPage(context: context, hasAgencies: state.agencies.isNotEmpty ? true : false);
//       },
//     );
//   }
// }
