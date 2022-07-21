import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PopulationListItem extends StatelessWidget {
  String year;
  String population;

  PopulationListItem({this.year, this.population});

  @override
  Widget build(BuildContext context) {
    NumberFormat numberFormat = NumberFormat("#,##,000");
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 45,
        width: 300,
        padding: EdgeInsets.only(right: 10, left: 10),
        decoration: BoxDecoration(
          color: Color(0xFF1C3177),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            topRight: Radius.circular(5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Year: $year",
              textAlign: TextAlign.center,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text(
              "Population: ${numberFormat.format(int.parse(population))}",
              textAlign: TextAlign.center,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
