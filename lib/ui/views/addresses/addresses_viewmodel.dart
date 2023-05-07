import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/app/app.router.dart';
import 'package:maestroni/data/models/address_dto.dart';
import 'package:maestroni/services/addresses_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddressesViewModel extends ReactiveViewModel {
  final _addressesService = locator<AddressesService>();
  final _navigationService = locator<NavigationService>();

  List<AddressDTO> get addresses => _addressesService.addresses;

  Future<void> fetch() => _addressesService.fetch();

  Future<void> onReady() async {
    fetch();
  }

  Future<void> onAddAddressTap() async {
    _navigationService.navigateToAddAddressView();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_addressesService];
}
