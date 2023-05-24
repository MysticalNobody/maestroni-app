import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:maestroni/res/theme/app_colors.dart';
import 'package:maestroni/res/theme/app_typography.dart';
import 'package:maestroni/ui/common/ui_helpers.dart';
import 'package:maestroni/ui/widgets/app_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../data/models/fias_search_result.dart';
import 'add_address_view.form.dart';
import 'add_address_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'street'),
  FormTextField(name: 'house'),
  FormTextField(name: 'flat'),
  FormTextField(name: 'entrance'),
  FormTextField(name: 'floor'),
  FormTextField(name: 'comment'),
])
class AddAddressView extends StackedView<AddAddressViewModel> with $AddAddressView {
  AddAddressView({super.key});

  @override
  Widget builder(
    BuildContext context,
    AddAddressViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: const AAppBar(title: 'Адрес доставки'),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            viewModel.onSave();
          },
          backgroundColor: AppColors.red,
          label: const Text('Сохранить'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(24).add(const EdgeInsets.only(bottom: 96)),
          children: [
            TypeAheadField<FIASObject>(
              suggestionsCallback: (pattern) => viewModel.onChangedAddress(pattern),
              itemBuilder: (context, itemData) => ListTile(
                title: Text(itemData.fullValue),
              ),
              onSuggestionSelected: viewModel.onChange,
              textFieldConfiguration: const TextFieldConfiguration(
                decoration: InputDecoration(
                  labelText: 'Поиск адреса',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
            ),
            if (viewModel.changedAddress != null) ...[
              verticalSpaceSmall,
              Text(
                'Выбранный адрес: ${viewModel.changedAddress?.fullValue ?? ''}',
                style: AppTypography.med14,
              ),
            ],
            verticalSpaceMedium,
            TextFormField(
              controller: houseController,
              keyboardType: TextInputType.number,
              scrollPadding: const EdgeInsets.only(bottom: 260),
              decoration: const InputDecoration(
                labelText: 'Дом',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
              ),
            ),
            verticalSpaceMedium,
            TextFormField(
              controller: flatController,
              keyboardType: TextInputType.number,
              scrollPadding: const EdgeInsets.only(bottom: 220),
              decoration: const InputDecoration(
                labelText: 'Квартира',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
              ),
            ),
            verticalSpaceMedium,
            TextFormField(
              controller: floorController,
              keyboardType: TextInputType.number,
              scrollPadding: const EdgeInsets.only(bottom: 180),
              decoration: const InputDecoration(
                labelText: 'Этаж',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
              ),
            ),
            verticalSpaceMedium,
            TextFormField(
              controller: commentController,
              scrollPadding: const EdgeInsets.only(bottom: 140),
              decoration: const InputDecoration(
                labelText: 'Комментарий',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
              ),
            ),
          ],
        ));
  }

  @override
  AddAddressViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddAddressViewModel();

  @override
  void onViewModelReady(AddAddressViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }
}
