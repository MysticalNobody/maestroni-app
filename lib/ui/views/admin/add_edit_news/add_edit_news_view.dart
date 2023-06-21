import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maestroni/data/models/news_dto.dart';
import 'package:stacked/stacked.dart';

import '../../../../res/theme/app_colors.dart';
import '../../../common/ui_helpers.dart';
import 'add_edit_news_viewmodel.dart';

class AddEditNewsView extends StackedView<AddEditNewsViewModel> {
  const AddEditNewsView({this.news, Key? key}) : super(key: key);

  final NewsDTO? news;

  @override
  Widget builder(
    BuildContext context,
    AddEditNewsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news != null ? 'Редактировать' : 'Добавить'),
        actions: [
          if (news != null)
            IconButton(
                onPressed: () => viewModel.onDelete(),
                icon: const Icon(Icons.remove_circle_outline_rounded))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => viewModel.onSave(),
        label: const Text('Сохранить'),
        backgroundColor: AppColors.red,
        icon: const Icon(Icons.save),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: viewModel.imageC,
            keyboardType: TextInputType.text,
            scrollPadding: const EdgeInsets.only(bottom: 220),
            decoration: const InputDecoration(
              labelText: 'URL изображения',
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(),
            ),
          ),
          verticalSpaceMedium,
          TextField(
            controller: viewModel.descC,
            keyboardType: TextInputType.text,
            scrollPadding: const EdgeInsets.only(bottom: 220),
            maxLines: 100,
            minLines: 3,
            decoration: const InputDecoration(
              labelText: 'Текст новости',
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(),
            ),
          ),
          verticalSpaceMedium,
          if (viewModel.imageC.text.isNotEmpty)
            FastCachedImage(
              url: viewModel.imageC.text,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain,
              errorBuilder: (context, exception, stacktrace) {
                return const Text('Ссылка на изображение не действительна');
              },
              loadingBuilder: (context, progress) {
                return Container(
                  color: Colors.white,
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                          child: CircularProgressIndicator(
                              color: AppColors.red,
                              value: progress.progressPercentage.value))),
                );
              },
              fadeInDuration: const Duration(milliseconds: 300),
            )
        ],
      ),
    );
  }

  @override
  AddEditNewsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddEditNewsViewModel(initNews: news);

  @override
  void onViewModelReady(AddEditNewsViewModel viewModel) {
    viewModel.onReady();
    super.onViewModelReady(viewModel);
  }
}
