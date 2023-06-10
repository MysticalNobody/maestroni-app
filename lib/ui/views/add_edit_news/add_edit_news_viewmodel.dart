import 'package:flutter/material.dart';
import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/data/models/news_dto.dart';
import 'package:maestroni/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddEditNewsViewModel extends BaseViewModel {
  AddEditNewsViewModel({required this.initNews});

  final _apiService = locator<ApiService>();
  final _navigator = locator<NavigationService>();
  final NewsDTO? initNews;
  final TextEditingController imageC = TextEditingController();
  final TextEditingController descC = TextEditingController();

  onReady() {
    if (initNews != null) {
      imageC.text = initNews!.photoUrl;
      descC.text = initNews!.discription;
    }
    imageC.addListener(() {
      notifyListeners();
    });
  }

  onSave() {
    if (initNews == null) {
      _apiService.remoteDataSource
          .createNews(news: NewsDTO(photoUrl: imageC.text, discription: descC.text))
          .then((value) => _navigator.back());
    } else {
      _apiService.remoteDataSource
          .updateNews(id: initNews!.id.toString(), news: NewsDTO(photoUrl: imageC.text, discription: descC.text))
          .then((value) => _navigator.back());
    }
  }

  onDelete() {
    _apiService.remoteDataSource.deleteNews(id: initNews!.id.toString()).then((value) => _navigator.back());
  }
}
