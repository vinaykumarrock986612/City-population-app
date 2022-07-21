import 'package:api/city/city_screen.dart';
import 'package:api/country/country_model.dart';
import 'package:api/country/country_screen.dart';
import 'package:api/rest_api.dart';
import 'package:flutter/material.dart';

class CountryViewModel {
  CountryScreenState state;

  CountryViewModel(this.state);

  Future<CountryModel> countryList() async {
    return await getCountry();
  }

  void navigateToCity(String countryName) {
    Navigator.push(
      state.context,
      MaterialPageRoute(
        builder: (context) => CityScreen(countryName),
      ),
    );
  }
}
