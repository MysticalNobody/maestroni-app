import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/data/models/address_dto.dart';
import 'package:stacked/stacked.dart';

import 'api_service.dart';

class AddressesService with ListenableServiceMixin {
  AddressesService() {
    listenToReactiveValues([
      addresses,
    ]);
  }

  final api = locator<ApiService>();

  ReactiveList<AddressDTO> addresses = ReactiveList();

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
      floor: '1',
      comment: '1'
    );
    if (res.isSuccessful) {
      await fetch();
    }
  }

  Future<void> fetch() async {
    final res = await api.remoteDataSource.getAddresses();
    if (res.isSuccessful) {
      addresses.assignAll(
        res.body ?? [],
      );
    }
  }
}
