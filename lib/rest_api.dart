import 'package:api/city/city_model.dart';
import 'package:api/country/country_model.dart';
import 'package:api/population/population_model.dart';
import 'package:http/http.dart' as http;

// Country List API
Future<CountryModel> getCountry() async {
  try {
    Uri url = Uri.parse("https://countriesnow.space/api/v0.1/countries/");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      countryError = false;
      return countryFromJson(response.body);
    } else {
      countryError = true;
      return countryErrorFromJson(response.body);
    }
  } catch (exception) {
    print("Printing Exception: $exception");
    return null;
  }
}

// City List API
Future<CityModel> getCity(final String countryName) async {
  try {
    Uri url = Uri.parse(
        "https://countriesnow.space/api/v0.1/countries/cities/q?country=$countryName");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      cityError = false;
      return cityFromJson(response.body);
    } else {
      cityError = true;
      return cityErrorFromJson(response.body);
    }
  } catch (exception) {
    print("Printing Exception: $exception");
    return null;
  }
}

// Population API
Future<PopulationModel> getPopulation(final String cityName) async {
  try {
    Uri url = Uri.parse(
        "https://countriesnow.space/api/v0.1/countries/population/cities/q?city=$cityName");

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      populationError = false;
      return populationFromJson(response.body);
    } else {
      populationError = true;
      return populationErrorFromJson(response.body);
    }
  } catch (exception) {
    print("Printing Exception: $exception");
    return null;
  }
}
