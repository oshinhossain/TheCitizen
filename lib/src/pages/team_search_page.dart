// import 'package:flutter/material.dart';
// import 'package:the_citizen_app/src/helpers/hex_color.dart';
// import 'package:the_citizen_app/src/models/my_team.dart';

// class TeamSearchScreen extends StatelessWidget {
//   // final String ?title;
//   // final int ?uiCodes;

// //   SearchScreen({
// //     Key key,
// //     @required this.title,
// //     @required this.uiCodes,
// //   }) : super(key: key);

// //   @override
// //   _SearchScreenState createState() => _SearchScreenState();
// // }

// // class _SearchScreenState extends State<SearchScreen> {
// //   TextEditingController _controller = TextEditingController();
// //   String query = '';

// //   @override
// //   void initState() {
// //     super.initState();
// //     context.read<MyTeamLocationsBloc>().add(SearchTeamMember(''));
// //   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 1,
//         backgroundColor: hexToColor('#F5F9FC'),
//         foregroundColor: hexToColor('#434969'),
//         leadingWidth: 30,
//         title: Container(
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: hexToColor('#FFFFFF'),
//             border: Border.all(
//               color: hexToColor('#A3CCDC'),
//               width: 1,
//             ),
//             borderRadius: BorderRadius.circular(30),
//           ),
//           child: TextField(
//             onChanged: (value) {
//               // query = value;
//               // setState(() {});
//               // context.read<MyTeamLocationsBloc>().add(SearchTeamMember(_controller.text));
//             },
//           //  controller: _controller,
//             decoration: InputDecoration(
//               prefixIcon: Icon(
//                 Icons.search,
//                 color: hexToColor('#78909C'),
//               ),
//               // suffixIcon: query.isNotEmpty
//               //     ? IconButton(
//               //         icon: Icon(
//               //           Icons.close,
//               //           color: hexToColor('#78909C'),
//               //         ),
//               //         onPressed: _controller.clear)
//               //     : null,
//               hintText: 'Search for officer',
//               hintStyle: TextStyle(fontFamily: 'Manrope', fontSize: 16, color: hexToColor('#78909C')),
//               contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
//               border: InputBorder.none,
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: hexToColor('#A3CCDC'), width: 1),
//                 borderRadius: const BorderRadius.all(
//                   const Radius.circular(30),
//                 ),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: hexToColor('#A3CCDC'), width: 1),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: Container(
//         // padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//         padding: EdgeInsets.only(top: 15, left: 15, right: 15),
//         height: MediaQuery.of(context).size.height,
//         color: hexToColor('#FFFFFF'),
//         child:
//                   ListView.builder(
//                       itemCount: 5,
//                       itemBuilder: (context, index) {
//                         // if (state is SearchMyTeamMemberSuccess) {
//                         return buildOfficerListItemCard(searchResult[index], index);
//                         // }
//                       })
                
//        ),
      
//       bottomNavigationBar: _BottomNavigationSheet(),
//     );
//   }

//  buildOfficerListItemCard(MyTeam teamMember, index) {
//    // List<OfficerSearchViewModel> selectedList;
//   //  selectedList = [];
//     return Container(
//       margin: EdgeInsets.only(bottom: 10, top: 1, left: 1, right: 1),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.all(Radius.circular(5)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.blueGrey,
//             spreadRadius: 1,
//             blurRadius: 2,
//           ),
//         ],
//       ),
//       child: ListTile(
//         contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
//         onTap: () {
//           selectedList.add(teamMember);
//           Navigator.pop(context, selectedList);
//         },
//         leading: teamMember.image !=null
//             ? Container(
//                 padding: EdgeInsets.all(3),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(100),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.blueGrey[200],
//                       spreadRadius: 1,
//                       blurRadius: 5,
//                     ),
//                   ],
//                 ),
//                 child: CircleAvatar(
//                   backgroundColor: hexToColor('#EFF6FF'),
//                   radius: 27.0 - 2,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(100),
//                     child: Image.memory(
//                       teamMember.image,
//                       fit: BoxFit.cover,
//                       width: 27.0 * 2,
//                       height: 27.0 * 2,
//                     ),
//                   ),
//                 ),
//               )
//             : Container(
//                 padding: EdgeInsets.all(3),
//                 decoration: BoxDecoration(
//                   //  color: MyHexColor('#EFF6FF'),
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(100),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.blueGrey,
//                       spreadRadius: 1,
//                       blurRadius: 5,
//                     ),
//                   ],
//                 ),
//                 child: CircleAvatar(
//                   backgroundColor: hexToColor('#EFF6FF'),
//                   radius: 27.0 - 2,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(100),
//                     child: Image.asset(
//                       "assets/images/profile_avatar.png",
//                       fit: BoxFit.cover,
//                       width: 27.0 * 2,
//                       height: 27.0 * 2,
//                     ),
//                   ),
//                 ),
//               ),
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               teamMember.fullname ?? '',
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                 fontFamily: 'Manrope',
//                 fontSize: 15.0,
//                 color: hexToColor('#141C44'),
//                 fontWeight: FontWeight.w500,
//                 height: 1.2,
//               ),
//             ),
//           ],
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Text(teamMember.roleModel.roleName ?? ''),
//             Text(
//               teamMember.email ?? '',
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                 fontFamily: 'Manrope',
//                 fontSize: 14.0,
//                 color: hexToColor('#72778F'),
//                 fontWeight: FontWeight.w500,
//                 height: 1.2,
//               ),
//             ),
//             Text(
//               teamMember.mobile ?? '',
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                 fontFamily: 'Manrope',
//                 fontSize: 14.0,
//                 color: hexToColor('#72778F'),
//                 fontWeight: FontWeight.w500,
//                 height: 1.2,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
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
