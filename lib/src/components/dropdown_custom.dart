import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:the_citizen_app/src/config/app_theme.dart';

class DropdownCustom extends StatefulWidget {
  final String title;
  final List<dynamic> items;
  final String keyName;
  final String labelText;
  final ValueChanged<String> itemCallBack;
  final String? currentItem;
  final String hintText;

  DropdownCustom({
    required this.title,
    required this.items,
    required this.itemCallBack,
    this.currentItem,
    required this.hintText,
    required this.keyName,
    required this.labelText,
  });

  @override
  State<StatefulWidget> createState() => _DropdownState(currentItem);
}

class _DropdownState extends State<DropdownCustom> {
  List<DropdownMenuItem<String>> dropDownItems = [];
  List<dynamic> items = [];
  String? currentItem;
  DropdownCustom? oldWidget;

  bool hasKeyInList(List<dynamic> list, id) {
    var filterData = list.where((e) {
      Map<String, dynamic> map = e.toMap();
      return map[widget.keyName] == id;
    }).toList();

    if (filterData.length == 1) {
      return true;
    } else {
      currentItem = null;
      return false;
    }
  }

  _DropdownState(this.currentItem);

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<dynamic> items) {
    List<DropdownMenuItem<String>> _menuItems = [];
    currentItem = widget.currentItem;

    if (items.isNotEmpty) {
      for (dynamic item in items) {
        _menuItems.addAll(
          [
            DropdownMenuItem<String>(
              value: item.agencyId,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                child: Text(
                  item.agencyName,
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 14.0,
                    color: AppTheme.newAppBarTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            //If it's last item, we will not add Divider after it.
            if (item != items.last)
              DropdownMenuItem<String>(
                enabled: false,
                alignment: AlignmentDirectional.centerStart,
                child: Divider(
                  indent: 0.0,
                  endIndent: 0.0,
                  thickness: 1.0,
                  color: Color(0xFFD0DBDF),
                ),
              ),
          ],
        );
      }
    }
    return _menuItems;
  }

  List<double> _getCustomItemsHeights() {
    List<double> _itemsHeights = [];
    for (var i = 0; i < (items.length * 2) - 1; i++) {
      if (i.isEven) {
        _itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _itemsHeights.add(4);
      }
    }
    return _itemsHeights;
  }

  // @override
  // void initState() {
  //   //super.initState();
  // }

  @override
  void didUpdateWidget(DropdownCustom oldWidget) {
    if (this.currentItem != widget.currentItem) {
      setState(() {
        this.currentItem = widget.currentItem;
      });
    }
    this.oldWidget = oldWidget;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: DropdownButton2(
            hint: Text(
              'Select one',
              style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 14.0,
                  color: AppTheme.newAppBarTextColor,
                  fontWeight: FontWeight.w400),
            ),
            style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 14.0,
                color: AppTheme.newAppBarTextColor,
                fontWeight: FontWeight.w400),
            underline: Container(height: 1, color: Color(0xFF72778F)),
            icon: SizedBox(
              width: 25,
              height: 25,
              child: ImageIcon(
                AssetImage("assets/images/down_arrow.png"),
                color: Color(0xFF8C8D92),
                size: 24,
              ),
            ),
            iconSize: 24,
            iconOnClick: RotatedBox(
              quarterTurns: 2,
              child: ImageIcon(
                //("assets/images/up_arrow.png"),
                AssetImage("assets/images/down_arrow.png"),
                color: Color(0xFF8C8D92),
                size: 24.0,
              ),
            ),
            items: _addDividersAfterItems(widget.items),
            customItemsHeights: _getCustomItemsHeights(),
            //customItemsHeight: 4.0,
            dropdownElevation: 8,
            alignment: AlignmentDirectional.centerStart,
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
              ),
            ),
            value: currentItem,
            onChanged: (selectedItem) => setState(() {
              currentItem = selectedItem as String;
              widget.itemCallBack(currentItem!);
            }),
            /*value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value as String;
              });
            },*/
            isExpanded: true,
            buttonHeight: 50,
            //buttonPadding: EdgeInsets.zero,
            itemHeight: 25.0,
            itemPadding: EdgeInsets.symmetric(horizontal: 21.0, vertical: 0.0),
            //dropdownPadding: EdgeInsets.symmetric(horizontal: 21.0, vertical: 0.0),
            //dropdownPadding: null,
            offset: Offset(0.0, 5.0),
          ),
        ),
      ],
    );
  }
}
