import 'package:maestroni/data/models/item_dto.dart';
import 'package:maestroni/data/models/sort_category_dto.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../data/models/category_dto.dart';
import '../../../data/models/sort_item_dto.dart';
import '../../../services/api_service.dart';
import '../../../services/products_service.dart';

class AdminMenuCategoryViewModel extends ReactiveViewModel {
  AdminMenuCategoryViewModel({required this.category, required this.catIndex});
  final CategoryDTO category;
  final int catIndex;
  final _productsService = locator<ProductsService>();
  final _apiService = locator<ApiService>();

  List<ItemDTO> get items => _productsService.categories.firstWhere((p0) => p0.id == category.id).products;

  Future onReorder(int oldIndex, int newIndex) async {
    if (oldIndex == newIndex - 1) return;
    setBusy(true);
    final copyMenu = items;
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = copyMenu.removeAt(oldIndex);
    copyMenu.insert(newIndex, item);
    final sortList =
        List.generate(copyMenu.length, (index) => SortItemDTO(productId: copyMenu[index].id, listNumber: index));

    try {
      await _apiService.remoteDataSource
          .sorting(sort: [SortCategoryDTO(categoryId: category.id!, listNumber: catIndex, productsSortList: sortList)]);
      await _productsService.fetch();
    } finally {
      setBusy(false);
    }
  }

  onItemTap(ItemDTO cat) {}

  @override
  List<ListenableServiceMixin> get listenableServices => [_productsService];
}
