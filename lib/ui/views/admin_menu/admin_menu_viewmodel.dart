import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/data/models/sort_category_dto.dart';
import 'package:maestroni/data/models/sort_item_dto.dart';
import 'package:maestroni/services/api_service.dart';
import 'package:maestroni/services/products_service.dart';
import 'package:stacked/stacked.dart';

import '../../../data/models/category_dto.dart';

class AdminMenuViewModel extends ReactiveViewModel {
  final _productsService = locator<ProductsService>();
  final _apiService = locator<ApiService>();

  List<CategoryDTO> get categories => _productsService.categories;

  Future onReorder(int oldIndex, int newIndex) async {
    setBusy(true);
    final sortList = List.generate(
      categories.length,
      (index) => SortCategoryDTO(
        categoryId: categories[index].id!,
        listNumber: index,
        productsSortList: List.generate(categories[index].products.length,
            (index2) => SortItemDTO(productId: categories[index].products[index2].id, listNumber: index2)),
      ),
    );
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = sortList.removeAt(oldIndex);
    sortList.insert(newIndex, item);
    try {
      await _apiService.remoteDataSource.sorting(sort: sortList);
      await _productsService.fetch();
    } finally {
      setBusy(false);
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_productsService];
}
