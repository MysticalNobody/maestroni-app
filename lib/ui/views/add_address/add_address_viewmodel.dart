import 'dart:async';

import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/data/models/address_dto.dart';
import 'package:maestroni/data/models/search_address_dto.dart';
import 'package:maestroni/services/addresses_service.dart';
import 'package:maestroni/ui/views/add_address/add_address_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddAddressViewModel extends FormViewModel {
  AddAddressViewModel({required this.addressDTO});
  final AddressDTO? addressDTO;

  final _addressesService = locator<AddressesService>();
  final _navigationService = locator<NavigationService>();

  List<SearchAddressDTO> currentSearch = [];

  SearchAddressDTO? changedAddress;

  Future<void> onSave() async {
    if (changedAddress == null) return;
    try {
      _addressesService.add(AddressDTO(
        street: changedAddress!.street,
        shortAddress: changedAddress!.address,
        fullAddress: changedAddress!.fullAddress,
        apartmentNumber: flatValue ?? 'ч/д',
        building: changedAddress!.building,
        cityName: changedAddress!.city,
        country: changedAddress!.country,
        houseNumber: changedAddress!.house,
        lat: changedAddress!.geoLat,
        lon: changedAddress!.geoLon,
        comment: '${floorValue != null ? 'Этаж $floorValue\n' : ''} ${(commentValue ?? '')}',
      ));
      _navigationService.back();
    } finally {
      // log(e.toString());
    }
  }

  Future<List<SearchAddressDTO>> onChangedAddress(String text) async {
    if (text.isEmpty) {
      return [];
    } else {
      final res = await _addressesService.api.remoteDataSource.searchAddress(address: 'Махачкала $text');
      return res.body?.result.where((element) => element.house.isNotEmpty).toList() ?? [];
    }
  }

  Future onChange(SearchAddressDTO v) async {
    changedAddress = v;
    notifyListeners();
  }
}
