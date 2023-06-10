import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../res/theme/app_colors.dart';
import 'news_viewmodel.dart';

class NewsView extends StackedView<NewsViewModel> {
  const NewsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NewsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Редактировать новости'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => viewModel.addNews(),
        icon: const Icon(Icons.add),
        backgroundColor: AppColors.red,
        label: const Text('Добавить'),
      ),
      body: viewModel.news.isNotEmpty
          ? ListView.builder(
              itemCount: viewModel.news.length,
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemBuilder: (context, index) => ListTile(
                  onTap: () => viewModel.editNews(viewModel.news[index]),
                  leading: SizedBox(
                    width: 60,
                    child: FastCachedImage(
                      url: viewModel.news[index].photoUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, exception, stacktrace) {
                        return Text(stacktrace.toString());
                      },
                      loadingBuilder: (context, progress) {
                        return Container(
                          color: Colors.white,
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.width * 0.3,
                              child: Center(
                                  child: CircularProgressIndicator(
                                      color: AppColors.red, value: progress.progressPercentage.value))),
                        );
                      },
                      fadeInDuration: const Duration(milliseconds: 300),
                    ),
                  ),
                  title: Text(
                    viewModel.news[index].discription,
                    maxLines: 1,
                  )),
            )
          : const Center(
              child: Text('Новостей нет'),
            ),
    );
  }

  @override
  NewsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NewsViewModel();

  @override
  void onViewModelReady(NewsViewModel viewModel) {
    viewModel.onReady();
    super.onViewModelReady(viewModel);
  }
}
