import 'package:flutter/material.dart';
import 'package:maestroni/app/app.router.dart';
import 'package:maestroni/data/models/item_dto.dart';
import 'package:maestroni/data/models/sort_category_dto.dart';
import 'package:maestroni/data/models/update_display_data.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../data/models/category_dto.dart';
import '../../../../data/models/sort_item_dto.dart';
import '../../../../services/api_service.dart';
import '../../../../services/products_service.dart';

class AdminMenuCategoryViewModel extends ReactiveViewModel {
  AdminMenuCategoryViewModel(
      {required this.initCategory, required this.catIndex});
  final CategoryDTO initCategory;
  final int catIndex;
  final _productsService = locator<ProductsService>();
  final _apiService = locator<ApiService>();
  final _navigator = locator<NavigationService>();

  final TextEditingController categoryNameController = TextEditingController();

  CategoryDTO get category =>
      _productsService.categories.where((p0) => p0.id == initCategory.id).first;

  List<ItemDTO> get items => _productsService.categories
      .firstWhere((p0) => p0.id == category.id)
      .products;

  Future onReorder(int oldIndex, int newIndex) async {
    setBusy(true);
    final copyMenu = items;
    final item = copyMenu.removeAt(oldIndex);
    copyMenu.insert(newIndex, item);
    final sortList = List.generate(
        copyMenu.length,
        (index) =>
            SortItemDTO(productId: copyMenu[index].id, listNumber: index));

    try {
      await _apiService.remoteDataSource.sorting(sort: [
        SortCategoryDTO(
            categoryId: category.id!,
            listNumber: catIndex,
            productsSortList: sortList)
      ]);
      await _productsService.fetch();
    } finally {
      setBusy(false);
    }
  }

  onItemTap(ItemDTO item) {
    _navigator.navigateToAdminMenuItemView(initItem: item);
  }

  Future updateActive(bool isActive) async {
    setBusy(true);
    await _apiService.remoteDataSource.updateDisplayData(
        displayData: UpdateDisplayData(
            id: category.id!,
            displayDataName: category.displayName,
            isActive: isActive));
    await _productsService.fetch();
    setBusy(false);
  }

  Future updateName() async {
    setBusy(true);
    await _apiService.remoteDataSource.updateDisplayData(
        displayData: UpdateDisplayData(
            id: category.id!,
            displayDataName: categoryNameController.text,
            isActive: category.displayData?.isActive ?? true));
    await _productsService.fetch();
    categoryNameController.clear();
    setBusy(false);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_productsService];
}
