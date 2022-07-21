import 'package:api/population/population_model.dart';
import 'package:api/population/population_view_model.dart';
import 'package:api/widgets/error_message.dart';
import 'package:api/widgets/population_list_item.dart';
import 'package:flutter/material.dart';

class PopulationScreen extends StatelessWidget {
  final String cityName;

  PopulationScreen(this.cityName);

  @override
  Widget build(BuildContext context) {
    PopulationViewModel model = PopulationViewModel(this);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$cityName",
          style:
              TextStyle(fontSize: 25, fontFamily: "arciform", letterSpacing: 2),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: FutureBuilder<PopulationModel>(
            future: model.populationApi(cityName),
            builder: (BuildContext context,
                AsyncSnapshot<PopulationModel> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return populationError
                    ? ErrorMessage(message: snapshot.data.msg)
                    : snapshot.data.data.populationCounts.length < 1
                        ? ErrorMessage(
                            message:
                                "Sorry! no population data available for $cityName")
                        : ListView.separated(
                            itemBuilder: (context, index) {
                              return PopulationListItem(
                                year: snapshot
                                    .data.data.populationCounts[index].year,
                                population: snapshot
                                    .data.data.populationCounts[index].value,
                              );
                            },
                            separatorBuilder: (context, index) => Divider(),
                            itemCount:
                                snapshot.data.data.populationCounts.length,
                          );
              }
              if (snapshot.connectionState == ConnectionState.none) {
                return ErrorMessage(message: "Something went wrong!");
              }

              return ErrorMessage(message: "Something went wrong!");
            },
          ),
        ),
      ),
    );
  }
}
