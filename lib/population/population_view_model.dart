import 'package:api/population/population_model.dart';
import 'package:api/population/population_screen.dart';
import 'package:api/rest_api.dart';

class PopulationViewModel {
  PopulationScreen state;

  PopulationViewModel(this.state);

  Future<PopulationModel> populationApi(final String cityName) async {
    print("Ok! The populationApi is working fine till now");
    return await getPopulation(cityName);
  }
}
