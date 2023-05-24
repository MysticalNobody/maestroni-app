import 'dart:async';
import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/data/models/address_dto.dart';
import 'package:maestroni/services/addresses_service.dart';
import 'package:maestroni/ui/views/add_address/add_address_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../data/models/fias_search_result.dart';

class AddAddressViewModel extends FormViewModel {
  final _addressesService = locator<AddressesService>();
  final _navigationService = locator<NavigationService>();

  List<FIASObject> currentSearch = [];

  FIASObject? changedAddress;

  Future<void> onSave() async {
    if (changedAddress == null) return;
    final List<Location> locations = await locationFromAddress(changedAddress!.fullValue);
    try {
      _addressesService.add(AddressDTO(
        street: '${changedAddress!.typeShort}. ${changedAddress!.name}',
        address:
            '${changedAddress!.typeShort}. ${changedAddress!.name}${houseValue != null ? ', д.$houseValue' : ''}${flatValue != null ? ', кв.$flatValue' : ''}',
        apartmentNumber: flatValue ?? '',
        building: houseValue ?? '',
        city: changedAddress!.city,
        country: 'Россия',
        house: houseValue ?? '',
        lat: locations.first.latitude.toString(),
        lon: locations.first.longitude.toString(),
        region: changedAddress!.region,
        floor: floorValue ?? '',
        comment: commentValue ?? '',
      ));
      _navigationService.back();
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<List<FIASObject>> onChangedAddress(String text) async {
    if (text.isEmpty) {
      return [];
    } else {
      final res = await _addressesService.api.remoteDataSource.searchAddress(q: text);
      return res.body?.result ?? [];
    }
  }

  Future onChange(FIASObject v) async {
    changedAddress = v;
    notifyListeners();
  }
}
