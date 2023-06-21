import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maestroni/res/theme/app_colors.dart';
import 'package:maestroni/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'expected_at_picker_sheet_model.dart';

class ExpectedAtPickerSheet extends StackedView<ExpectedAtPickerSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const ExpectedAtPickerSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ExpectedAtPickerSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Выберите время доставки',
            style: TextStyle(fontSize: 22),
          ),
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Expanded(
                  child: CupertinoPicker(
                    useMagnifier: true,
                    itemExtent: 36,
                    onSelectedItemChanged: (i) {
                      viewModel
                        ..selectedDay = viewModel.days[i]
                        ..notifyListeners();
                    },
                    children: List.generate(
                        viewModel.days.length,
                        (index) => SizedBox(
                            height: 36,
                            child: Center(
                                child: Text(viewModel
                                    .getDayString(viewModel.days[index]))))),
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: CupertinoPicker(
                    itemExtent: 36,
                    useMagnifier: true,
                    onSelectedItemChanged: (i) {
                      viewModel
                        ..selectedHour = viewModel.hours[i]
                        ..notifyListeners();
                    },
                    children: List.generate(
                        viewModel.hours.length,
                        (index) => SizedBox(
                            height: 36,
                            child: Center(
                                child: Text(viewModel
                                    .timeToString(viewModel.hours[index]))))),
                  ),
                ),
                const Text(
                  ':',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: 60,
                  child: CupertinoPicker(
                    itemExtent: 36,
                    useMagnifier: true,
                    onSelectedItemChanged: (i) {
                      viewModel
                        ..selectedMin = viewModel.minutes[i]
                        ..notifyListeners();
                    },
                    children: List.generate(
                        viewModel.minutes.length,
                        (index) => SizedBox(
                            height: 36,
                            child: Center(
                                child: Text(viewModel
                                    .timeToString(viewModel.minutes[index]))))),
                  ),
                ),
              ],
            ),
          ),
          verticalSpaceMedium,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    completer!(SheetResponse(
                      confirmed: false,
                    ));
                  },
                  style: TextButton.styleFrom(foregroundColor: AppColors.red),
                  child: const Text('Отмена')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.red,
                      foregroundColor: AppColors.white),
                  onPressed: () {
                    completer!(SheetResponse(
                        confirmed: true,
                        data: viewModel.selectedDay.copyWith(
                            hour: viewModel.selectedHour,
                            minute: viewModel.selectedMin)));
                  },
                  child: const Text('Сохранить'))
            ],
          )
        ],
      ),
    );
  }

  @override
  ExpectedAtPickerSheetModel viewModelBuilder(BuildContext context) =>
      ExpectedAtPickerSheetModel();

  @override
  void onViewModelReady(ExpectedAtPickerSheetModel viewModel) {
    viewModel.notifyListeners();
    super.onViewModelReady(viewModel);
  }
}
