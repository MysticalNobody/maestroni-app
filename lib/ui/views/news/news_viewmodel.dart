import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/app/app.router.dart';
import 'package:maestroni/data/models/news_dto.dart';
import 'package:maestroni/services/news_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NewsViewModel extends ReactiveViewModel {
  final _newsService = locator<NewsService>();
  final _navigator = locator<NavigationService>();

  List<NewsDTO> get news => _newsService.news;

  onReady() {
    _newsService.fetch();
  }

  addNews() {
    _navigator.navigateToAddEditNewsView().then((value) => onReady());
  }

  editNews(NewsDTO n) {
    _navigator.navigateToAddEditNewsView(news: n).then((value) => onReady());
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_newsService];
}
