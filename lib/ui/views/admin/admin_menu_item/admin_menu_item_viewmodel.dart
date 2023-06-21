import 'package:flutter/material.dart';
import 'package:maestroni/data/models/item_dto.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../../data/models/update_display_data.dart';
import '../../../../services/api_service.dart';
import '../../../../services/products_service.dart';

class AdminMenuItemViewModel extends ReactiveViewModel {
  AdminMenuItemViewModel({required this.initItem});
  final ItemDTO initItem;
  final _productsService = locator<ProductsService>();
  final _apiService = locator<ApiService>();

  final TextEditingController itemNameController = TextEditingController();

  ItemDTO get item => _productsService.categories
      .expand((p0) => p0.products)
      .toList()
      .firstWhere((element) => element.id == initItem.id);

  Future updateActive(bool isActive) async {
    setBusy(true);
    await _apiService.remoteDataSource.updateDisplayData(
        displayData: UpdateDisplayData(
            id: item.id,
            displayDataName: item.displayName,
            isActive: isActive));
    await _productsService.fetch();
    setBusy(false);
  }

  Future updateName() async {
    setBusy(true);
    await _apiService.remoteDataSource.updateDisplayData(
        displayData: UpdateDisplayData(
            id: item.id,
            displayDataName: itemNameController.text,
            isActive: item.displayData?.isActive ?? true));
    await _productsService.fetch();
    itemNameController.clear();
    setBusy(false);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_productsService];
}
