
import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/app/app.router.dart';
import 'package:maestroni/data/models/sort_category_dto.dart';
import 'package:maestroni/data/models/sort_item_dto.dart';
import 'package:maestroni/services/api_service.dart';
import 'package:maestroni/services/products_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../data/models/category_dto.dart';

class AdminMenuViewModel extends ReactiveViewModel {
  final _productsService = locator<ProductsService>();
  final _apiService = locator<ApiService>();
  final _navigator = locator<NavigationService>();

  List<CategoryDTO> get categories => _productsService.categories;

  Future onReorder(int oldIndex, int newIndex) async {
    // log('oldIndex:$oldIndex, newIndex:$newIndex');
    setBusy(true);
    final copyMenu = categories;
    final item = copyMenu.removeAt(oldIndex);
    // log('oldIndex:$oldIndex, newIndex:$newIndex, id:${item.id}, name:${item.displayName}');
    copyMenu.insert(newIndex, item);
    final sortList = List.generate(
      copyMenu.length,
      (index) => SortCategoryDTO(
        categoryId: copyMenu[index].id!,
        listNumber: index,
        productsSortList: List.generate(copyMenu[index].products.length,
            (index2) => SortItemDTO(productId: copyMenu[index].products[index2].id, listNumber: index2)),
      ),
    );
    try {
      await _apiService.remoteDataSource.sorting(sort: sortList);
      await _productsService.fetch();
    } finally {
      setBusy(false);
    }
  }

  onCategoryTap(CategoryDTO cat, int index) {
    _navigator.navigateToAdminMenuCategoryView(initCategory: cat, catIndex: index);
  }

  Future updateMenuFromRK() async {
    setBusy(true);
    await _apiService.remoteDataSource.updateFromKeeper();
    await _productsService.fetch();
    setBusy(false);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_productsService];
}
