import 'dart:developer';

import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/data/models/address_dto.dart';
import 'package:stacked/stacked.dart';

import 'api_service.dart';

class AddressesService with ListenableServiceMixin {
  AddressesService() {
    listenToReactiveValues([addresses, selectedAddress]);
  }

  final api = locator<ApiService>();

  ReactiveList<AddressDTO> addresses = ReactiveList();
  ReactiveValue<AddressDTO?> selectedAddress = ReactiveValue(null);

  Future<void> add(AddressDTO addressDTO) async {
    final res = await api.remoteDataSource.addAddress(
        address: addressDTO.address,
        apartmentNumber: addressDTO.apartmentNumber,
        country: addressDTO.country,
        city: addressDTO.city,
        house: addressDTO.house,
        street: addressDTO.street,
        building: addressDTO.building,
        region: addressDTO.region,
        lat: addressDTO.lat,
        lon: addressDTO.lon,
        floor: addressDTO.floor,
        comment: addressDTO.comment);
    if (res.isSuccessful) {
      await fetch();
    }
  }

  Future<void> search(String text) async {
    final res = api.remoteDataSource.searchAddress(q: text);
    log(res.toString());
  }

  Future<void> fetch() async {
    final res = await api.remoteDataSource.getMyAddresses();
    if (res.isSuccessful) {
      addresses.assignAll(
        res.body ?? [],
      );
      selectedAddress.value = addresses.isNotEmpty ? addresses.first : null;
    }
  }
}
