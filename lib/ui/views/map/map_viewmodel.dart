import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/data/models/rest_address_dto.dart';
import 'package:maestroni/services/addresses_service.dart';
import 'package:stacked/stacked.dart';

class MapViewModel extends BaseViewModel {
  final _addressesService = locator<AddressesService>();

  List<RestAddressDTO> get rests =>
      _addressesService.restorants.where((p0) => p0.actualAddressLat != null && p0.actualAddressLon != null).toList();
  final MapController controller = MapController(
    initMapWithUserPosition: false,
    initPosition: GeoPoint(latitude: 42.973163, longitude: 47.504324),
  );
}
