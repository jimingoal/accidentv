import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;

  const MultiSelectChip({Key key, this.reportList}) : super(key: key);

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  bool isSelected = false;
  String selectedChoice = "";

  List<Widget> _buildChoiceList() {
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildToggleButtons(
          '공사',
          FaIcon(
            FontAwesomeIcons.tools,
            size: 18.0,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
        _buildToggleButtons(
          '사고',
          FaIcon(
            FontAwesomeIcons.tools,
            size: 18.0,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
        _buildToggleButtons(
          'CCTV',
          ImageIcon(
            AssetImage(
              'assets/cctv.png',
            ),
          ),
        ),
        _buildToggleButtons(
          '신고',
          FaIcon(
            FontAwesomeIcons.edit,
            size: 18.0,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }

  Container _buildToggleButtons(String title, icon) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: ChoiceChip(
        selectedColor: Colors.lightBlue,
        backgroundColor: Colors.white,
        avatar: icon,
        label: Text(
          '$title',
          style: TextStyle(
              color: isSelected ? Colors.white : Colors.black, fontSize: 18.0),
        ),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            isSelected = selected;
          });
        },
      ),
    );
  }
}
