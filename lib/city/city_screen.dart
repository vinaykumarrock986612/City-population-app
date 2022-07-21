import 'package:api/city/city_model.dart';
import 'package:api/city/city_view_model.dart';
import 'package:api/widgets/error_message.dart';
import 'package:api/widgets/list_divider.dart';
import 'package:api/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class CityScreen extends StatelessWidget {
  final String countryName;

  CityScreen(this.countryName);

  @override
  Widget build(BuildContext context) {
    CityViewModel model = CityViewModel(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$countryName",
          style:
          TextStyle(fontSize: 25, fontFamily: "arciform", letterSpacing: 2),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Svg(
                "assets/road.svg",
              ),
              fit: BoxFit.cover),
        ),
        child: FutureBuilder<CityModel>(
          future: model.cityList(countryName),
          builder: (BuildContext context, AsyncSnapshot<CityModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return cityError
                  ? ErrorMessage(message: snapshot.data.msg)
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            model.navigateToPopulation(
                                snapshot.data.data[index]);
                          },
                          child: ListItem(
                            itemName: snapshot.data.data[index],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => ListDivider(),
                      itemCount: snapshot.data.data.length,
                    );
            }
            if (snapshot.connectionState == ConnectionState.none) {
              return ErrorMessage(message: "Something went wrong!");
            }
            return ErrorMessage(message: "Something went wrong!");
          },
        ),
      ),
    );
  }
}
