import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  String itemName;

  ListItem({this.itemName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 35,
        width: 250,
        padding: EdgeInsets.only(right: 10, left: 10),
        decoration: BoxDecoration(
          color: Color(0xFF1C3177),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            topRight: Radius.circular(5),
          ),
        ),
        child: Text(
          "$itemName",
          textAlign: TextAlign.center,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Colors.white,
            fontSize: 16,
            fontFamily: "arciform",
          ),
        ),
      ),
    );
  }
}
