import 'package:flutter/material.dart';
import 'package:meditation_application/model/meditation_excerice_model.dart';
import 'package:meditation_application/model/sleep_excerices_model.dart';
import 'package:meditation_application/providers/meditation_provider.dart';
import 'package:meditation_application/providers/mindful_excerices_provider.dart';
import 'package:meditation_application/providers/sleep_exceces_provider.dart';
import 'package:provider/provider.dart';
import '../model/mindful_excerices_model.dart';

class FilterProvider extends ChangeNotifier {
  List<dynamic> _allDataFromTheproviders = [];
  List<dynamic> _filteredProviderData = [];

  //get all the data from other providers
  Future<void> getAllData(BuildContext context) async {
    //ensure this runs after build
    await Future.delayed(Duration.zero);

    //get all mindfuleExceices
    final List<MindfulnessExcericesModel> mindfulExceices =
        Provider.of<MindfulExcericesProvider>(
          context,
          listen: false,
        ).mindfulExceices;

    //get all meditation
    final List<MeditationExcericeModel> meditationExcerces =
        Provider.of<MeditationProvider>(
          context,
          listen: false,
        ).meditationExcerices;

    //get all sleepExceices
    final List<SleepExcericesModel> sleepStroies =
        Provider.of<SleepExcecesProvider>(context, listen: false).sleepExceices;

    //assign value to the allproviderdata list
    _allDataFromTheproviders = [
      ...mindfulExceices,
      ...meditationExcerces,
      ...sleepStroies,
    ];

    _filteredProviderData = _allDataFromTheproviders;
    notifyListeners();
  }

  //getter for filterd data
  List<dynamic> get filterdata=>_filteredProviderData;
 
     
  
}
