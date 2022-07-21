import 'package:api/city/city_model.dart';
import 'package:api/city/city_screen.dart';
import 'package:api/population/population_screen.dart';
import 'package:api/rest_api.dart';
import 'package:flutter/material.dart';

class CityViewModel {
  BuildContext state;

  CityViewModel(this.state);

  Future<CityModel> cityList(final String countryName) async {
    return await getCity(countryName);
  }
  void navigateToPopulation(String cityName) {
    Navigator.push(
      state,
      MaterialPageRoute(
        builder: (context) => PopulationScreen(cityName),
      ),
    );
  }
}
