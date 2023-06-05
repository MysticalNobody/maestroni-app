import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:maestroni/data/models/address_dto.dart';
import 'package:maestroni/data/models/search_address_dto.dart';
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
  AddAddressView({required this.addressDTO, super.key});

  final AddressDTO? addressDTO;

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
            if (viewModel.changedAddress == null)
              TypeAheadField<SearchAddressDTO>(
                suggestionsCallback: (pattern) => viewModel.onChangedAddress(pattern),
                itemBuilder: (context, itemData) => ListTile(
                  title: Text(itemData.address),
                ),
                onSuggestionSelected: viewModel.onChange,
                errorBuilder: (context, error) => const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Продолжайте ввод'),
                ),
                noItemsFoundBuilder: (context) => const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Ничего не найденно'),
                ),
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
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Выбранный адрес: ${viewModel.changedAddress?.address ?? ''}',
                      maxLines: 3,
                      style: AppTypography.med14,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        viewModel
                          ..changedAddress = null
                          ..notifyListeners();
                      },
                      icon: const Icon(Icons.remove_circle_outline)),
                ],
              ),
            ],
            // verticalSpaceMedium,
            // TextFormField(
            //   controller: houseController,
            //   keyboardType: TextInputType.number,
            //   scrollPadding: const EdgeInsets.only(bottom: 260),
            //   decoration: const InputDecoration(
            //     labelText: 'Дом',
            //     border: OutlineInputBorder(),
            //     enabledBorder: OutlineInputBorder(),
            //   ),
            // ),
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
      AddAddressViewModel(addressDTO: addressDTO);

  @override
  void onViewModelReady(AddAddressViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(AddAddressViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }
}
