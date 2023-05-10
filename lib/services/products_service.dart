import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/data/models/category_dto.dart';
import 'package:maestroni/services/api_service.dart';
import 'package:stacked/stacked.dart';

class ProductsService with ListenableServiceMixin {
  ProductsService() {
    listenToReactiveValues([
      categories,
    ]);
  }
  final api = locator<ApiService>();

  ReactiveList<CategoryDTO> categories = ReactiveList();

  Future<void> fetch() async {
    final res = await api.remoteDataSource.getCategories();
    if (res.isSuccessful) {
      categories.assignAll(
        res.body?.data.active ?? [],
      );
    }
  }
}
