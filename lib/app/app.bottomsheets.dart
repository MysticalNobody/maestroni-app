// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/expected_at_picker/expected_at_picker_sheet.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';
import '../ui/bottom_sheets/order_confirm/order_confirm_sheet.dart';

enum BottomSheetType {
  notice,
  orderConfirm,
  expectedAtPicker,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.notice: (context, request, completer) =>
        NoticeSheet(request: request, completer: completer),
    BottomSheetType.orderConfirm: (context, request, completer) =>
        OrderConfirmSheet(request: request, completer: completer),
    BottomSheetType.expectedAtPicker: (context, request, completer) =>
        ExpectedAtPickerSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
