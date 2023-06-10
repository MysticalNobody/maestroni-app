import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/data/models/address_dto.dart';
import 'package:stacked/stacked.dart';

import '../data/models/rest_address_dto.dart';
import 'api_service.dart';

class AddressesService with ListenableServiceMixin {
  AddressesService() {
    fetch();
    listenToReactiveValues([addresses, selectedAddress]);
  }

  final api = locator<ApiService>();

  ReactiveList<AddressDTO> addresses = ReactiveList();
  ReactiveValue<AddressDTO?> selectedAddress = ReactiveValue(null);
  ReactiveList<RestAddressDTO> restorants = ReactiveList();
  ReactiveValue<RestAddressDTO?> selectedRestoran = ReactiveValue(null);

  Future<void> add(AddressDTO addressDTO) async {
    final res = await api.remoteDataSource.addAddress(addressDTO: addressDTO);
    if (res.isSuccessful) {
      await fetch();
    }
  }

  Future<void> fetch() async {
    await fetchA();
    await fetchR();
  }

  Future fetchA() async {
    final res = await api.remoteDataSource.getMyAddresses();
    if (res.isSuccessful) {
      addresses.assignAll(
        res.body ?? [],
      );
      selectedAddress.value = addresses.isNotEmpty ? addresses.last : null;
    }
  }

  Future fetchR() async {
    final res = await api.remoteDataSource.getRestaurants();
    if (res.isSuccessful) {
      restorants.assignAll(
        res.body ?? [],
      );
      selectedRestoran.value = restorants.isNotEmpty ? restorants.first : null;
    }
  }
}
