import 'dart:async';

import 'package:collection/collection.dart';
import 'package:geocoder_buddy/geocoder_buddy.dart';
import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/data/models/address_dto.dart';
import 'package:maestroni/services/addresses_service.dart';
import 'package:maestroni/ui/views/add_address/add_address_view.form.dart';
import 'package:stacked/stacked.dart';

class AddAddressViewModel extends FormViewModel {
  final _addressesService = locator<AddressesService>();

  List<GBSearchData> currentSearch = [];

  GBSearchData? changedAddress;

  Future<void> onSave() async {
    if (changedAddress == null) return;
    // final address = await GeocoderBuddy.searchToGBData(changedAddress!);
    _addressesService.add(AddressDTO(
      street: 'address.address.road',
      address: 'address.displayName',
      apartmentNumber: '1',
      building: '1',
      city: 'address.address.state',
      country: 'address.address.country',
      house: '1',
      lat: 'address.lat',
      lon: 'address.lon',
      region: 'address.address.state',
    ));
  }

  Future<List<GBSearchData>> onChangedAddress(String text) async {
    if (text.isEmpty) {
      return [];
    } else {
      final res = await GeocoderBuddy.query(text);
      currentSearch = res;
      return res;
    }
  }

  void onChange(GBSearchData v) {
    changedAddress = v;
    rebuildUi();
  }
}
