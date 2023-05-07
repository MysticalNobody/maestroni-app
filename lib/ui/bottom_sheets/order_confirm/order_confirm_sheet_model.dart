import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/data/models/address_dto.dart';
import 'package:maestroni/services/addresses_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OrderConfirmSheetModel extends ReactiveViewModel {
  final _addressesService = locator<AddressesService>();
  final _navigationService = locator<NavigationService>();

  List<AddressDTO> get addresses => _addressesService.addresses;

  Future<void> fetch() => _addressesService.fetch();
  bool isDelivery = true;

  void onDeliveryChange(bool? val) {
    isDelivery = val ?? false;
    rebuildUi();
  }

  Future<void> onReady() async {
    if (addresses.isEmpty) {
      fetch();
    }
  }
}
