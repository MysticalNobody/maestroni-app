import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:maestroni/res/theme/app_colors.dart';
import 'package:maestroni/res/theme/app_typography.dart';
import 'package:maestroni/ui/widgets/app_bar.dart';
import 'package:stacked/stacked.dart';

import 'addresses_viewmodel.dart';

class AddressesView extends StackedView<AddressesViewModel> {
  const AddressesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddressesViewModel viewModel,
    Widget? child,
  ) {
    if (viewModel.isBusy) {
      return Center(
        child: Container(
          height: 36,
          width: 36,
          alignment: Alignment.center,
          child: const CupertinoActivityIndicator(),
        ),
      );
    }
    return Scaffold(
        appBar: const AAppBar(
          title: 'Адреса доставки',
        ),
        floatingActionButton: viewModel.addresses.isNotEmpty
            ? FloatingActionButton.extended(
                backgroundColor: AppColors.red,
                onPressed: () {
                  viewModel.onAddAddressTap();
                },
                label: const Text('Добавить'),
                icon: const Icon(Icons.add),
              )
            : null,
        body: Center(
          child: Builder(
            builder: (context) {
              if (viewModel.addresses.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Адреса доставки отсутствуют',
                      style: AppTypography.med18,
                    ),
                    const SizedBox(height: 12),
                    FloatingActionButton.extended(
                      backgroundColor: AppColors.red,
                      onPressed: () {
                        viewModel.onAddAddressTap();
                      },
                      label: const Text('Добавить'),
                      icon: const Icon(Icons.add),
                    ),
                  ],
                );
              } else {
                return ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 25),
                    itemBuilder: (context, index) {
                      return ListTile(
                        minLeadingWidth: 0,
                        title: Text(
                          viewModel.addresses[index].fullAddress,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: AppTypography.semi18,
                        ),
                        trailing: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () => viewModel
                                .onRemoveTap(viewModel.addresses[index].id!),
                            icon: const Icon(Icons.wrong_location_outlined)),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                          height: 10,
                          color: AppColors.darkGrey,
                        ),
                    itemCount: viewModel.addresses.length);
              }
            },
          ),
        ));
  }

  @override
  AddressesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddressesViewModel();

  @override
  void onViewModelReady(AddressesViewModel viewModel) =>
      SchedulerBinding.instance
          .addPostFrameCallback((timeStamp) => viewModel.onReady());
}
