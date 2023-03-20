import 'package:flutter/material.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';
import 'package:the_citizen_app/src/config/base.dart';
import 'package:the_citizen_app/src/helpers/k_text.dart';

class SearchLocations extends StatefulWidget {
  @override
  State<SearchLocations> createState() => _SearchLocationsState();
}

class _SearchLocationsState extends State<SearchLocations> with Base {
  @override
  void initState() {
    super.initState();
    shoutC.getUserDefinedLocation();
  }

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
            color: Colors.white,
            border: Border.all(
              color: AppTheme.borderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            // controller: _controller,
            onChanged: (value) {},
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: AppTheme.appBarColor,
                ),
                // onPressed: _controller.clear

                onPressed: () {
                  // if (_controller.text != null) {
                  //   context.read<SearchKnownLocationBloc>().add(
                  //     SearchLocationFetched(
                  //       _controller.text,
                  //     ),
                  //   );
                  // }
                  // //query.clear();
                  // FocusScope.of(context).unfocus();
                },
              ),
              hintText: 'Search for Location...',
              hintStyle: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 14,
                color: AppTheme.appBarColor,
              ),
              contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.borderColor, width: 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
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
      body: Container(
        child: Column(
          children: [
            KText(text: 'text'),
          ],
        ),
      ),
      bottomNavigationBar: _BottomNavigationSheet(),
    );
  }
  //
  // Widget _buildResultList(SearchKnownLocationState state) {
  //   return NotificationListener<ScrollNotification>(
  //     onNotification: _handleScrollNotification,
  //     child: ListView.builder(
  //       controller: _scrollController,
  //       itemCount: _calculateListItemCount(state),
  //       itemBuilder: (context, index) {
  //         if (state is SearchKnownLocationBySuccess) {
  //           return index >= state.searchResults.length
  //           // ? _buildLoaderListItem()
  //               ? _buildBlankListItem()
  //               : _buildOfficerListItemCard(state.searchResults[index], index);
  //         }
  //       },
  //     ),
  //   );
  // }
  //
  // bool _handleScrollNotification(ScrollNotification notification) {
  //   if (notification is ScrollEndNotification && _scrollController.position.extentAfter == 0) {
  //     _searchBloc.fetchNextResultPage();
  //   }
  //   return false;
  // }
  //
  // int _calculateListItemCount(SearchKnownLocationState state) {
  //   if (state is SearchKnownLocationBySuccess) {
  //     if (state.hasReachedEndOfResults) {
  //       return state.searchResults.length;
  //     } else {
  //       return state.searchResults.length + 1;
  //     }
  //   } else {
  //     return 0;
  //   }
  // }
  //
  // Widget _buildBlankListItem() {
  //   return Center(
  //     child: Text(''),
  //   );
  // }
  //
  // _buildOfficerListItemCard(SearchKnownLocationModel category, index) {
  //  // List<SearchKnownLocationModel> selectedList;
  //  // selectedList = [];
  //   return Card(
  //     child: ListTile(
  //       onTap: () {
  //         // selectedList.add(category);
  //         // if (selectedList != null) {
  //         //   context.read<ReportIssueBloc>().add(SelectedLocationType(knownLocationModel: category));
  //         // }
  //         // Navigator.pop(context, selectedList);
  //       },
  //       title: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [Text('')]),
  //     ),
  //   );
  // }
}

class _BottomNavigationSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
    //   BlocBuilder<HomeBloc, HomeState>(
    //   builder: (BuildContext context, state) {
    //     return bottomNavigationForOtherPage(context: context, hasAgencies: state.agencies.isNotEmpty ? true : false);
    //   },
    // );
  }
}
