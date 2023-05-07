import 'package:maestroni/data/models/news_dto.dart';
import 'package:stacked/stacked.dart';

import '../app/app.locator.dart';
import 'api_service.dart';

class NewsService with ListenableServiceMixin {
  NewsService() {
    listenToReactiveValues([
      news,
    ]);
  }
  final api = locator<ApiService>();

  ReactiveList<NewsDTO> news = ReactiveList();

  Future<void> fetch() async {
    final res = await api.remoteDataSource.getNews();
    if (res.isSuccessful) {
      news.assignAll(res.body ?? []);
    }
  }
}
