import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/app/app.router.dart';
import 'package:maestroni/data/models/sort_category_dto.dart';
import 'package:maestroni/data/models/sort_item_dto.dart';
import 'package:maestroni/services/api_service.dart';
import 'package:maestroni/services/products_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../data/models/category_dto.dart';

class AdminMenuViewModel extends ReactiveViewModel {
  final _productsService = locator<ProductsService>();
  final _apiService = locator<ApiService>();
  final _navigator = locator<NavigationService>();

  List<CategoryDTO> get categories => _productsService.categories;

  Future onReorder(int oldIndex, int newIndex) async {
    if (oldIndex == newIndex - 1) return;
    setBusy(true);
    final copyMenu = categories;
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = copyMenu.removeAt(oldIndex);
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
    _navigator.navigateToAdminMenuCategoryView(category: cat, catIndex: index);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_productsService];
}
