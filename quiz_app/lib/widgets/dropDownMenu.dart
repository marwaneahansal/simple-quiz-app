import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  final Map<String, String> dropDownItems;

  DropDownWidget({this.dropDownItems});

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String value;
  Map<String, String> itemsMap;
  List<String> itemsList;

  @override
  void initState() {
    this.itemsMap = widget.dropDownItems;
    this.itemsList = this.itemsMap.values.toList();
    this.value = this.itemsList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      value: this.value,
      icon: Icon(Icons.arrow_drop_down),
      underline: Container(
        height: 2,
        color: Color(0XFF364f6b),
      ),
      items: itemsList.map((value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String value) {
        setState(() {
          this.value = value;
          String key = this.itemsMap.keys.firstWhere(
              (element) => this.itemsMap[element] == value,
              orElse: () => null);
          print('Key of the value is: $key');
        });
      },
    );
  }
}

class DifficultyDropDownMenu extends StatefulWidget {
  final List<String> diffcultyItems;

  DifficultyDropDownMenu({this.diffcultyItems});
  @override
  _DifficultyDropDownMenuState createState() => _DifficultyDropDownMenuState();
}

class _DifficultyDropDownMenuState extends State<DifficultyDropDownMenu> {
  String value;
  List<String> items;
  @override
  void initState() {
    this.items = widget.diffcultyItems;
    this.value = this.items[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      value: this.value,
      icon: Icon(Icons.arrow_drop_down),
      underline: Container(
        height: 2,
        color: Color(0XFF364f6b),
      ),
      items: items.map((value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String value) {
        setState(() {
          this.value = value;
        });
      },
    );
  }
}
