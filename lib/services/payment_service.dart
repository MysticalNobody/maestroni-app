import 'dart:async';

import 'package:iso8601_offset/iso8601_offset.dart';
import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/app/app.router.dart';
import 'package:maestroni/data/models/address_dto.dart';
import 'package:maestroni/data/models/create_order_dto.dart';
import 'package:maestroni/data/models/dish_dto.dart';
import 'package:maestroni/data/models/order_dto.dart';
import 'package:maestroni/services/api_service.dart';
import 'package:maestroni/services/orders_history_service.dart';
import 'package:maestroni/services/profile_service.dart';
import 'package:maestroni/services/shopping_cart_service.dart';
import 'package:maestroni/ui/bottom_sheets/order_confirm/order_confirm_sheet_model.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tinkoff_acquiring_sdk/models/tinkoff_item.dart';
import 'package:tinkoff_acquiring_sdk/models/tinkoff_receipt.dart';
import 'package:tinkoff_acquiring_sdk/tinkoff_acquiring_models.dart';
import 'package:tinkoff_acquiring_sdk/tinkoff_acquiring_sdk.dart';

class PaymentService {
  PaymentService() {
    init();
  }
  final _profileService = locator<ProfileService>();
  final _apiService = locator<ApiService>();
  final _navigationService = locator<NavigationService>();
  final _shoppingCartService = locator<ShoppingCartService>();
  final _orderHistory = locator<OrdersHistoryService>();

  final TinkoffAcquiringSdk _tinkoffAcquiringSdk = TinkoffAcquiringSdk(
    // isDeveloperMode: true, //demo
    // isDebug: true,
    // terminalKey: '1667394428171DEMO', //demo
    // password: '6ijd85pmrp0sxusu', //demo
    terminalKey: '1667394428171', //work
    password: '07dbdvcst1vmg2sw', //work
    publicKey:
        'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAv5yse9ka3ZQE0feuGtemYv3IqOlLck8zHUM7lTr0za6lXTszRSXfUO7jMb+L5C7e2QNFs+7sIX2OQJ6a+HG8kr+jwJ4tS3cVsWtd9NXpsU40PE4MeNr5RqiNXjcDxA+L4OsEm/BlyFOEOh2epGyYUd5/iO3OiQFRNicomT2saQYAeqIwuELPs1XpLk9HLx5qPbm8fRrQhjeUD5TLO8b+4yCnObe8vy/BMUwBfq+ieWADIjwWCMp2KTpMGLz48qnaD9kdrYJ0iyHqzb2mkDhdIzkim24A3lWoYitJCBrrB2xM05sm9+OdCI1f7nPNJbl5URHobSwR94IRGT7CJcUjvwIDAQAB', //work
    // 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAv5yse9ka3ZQE0feuGtemYv3IqOlLck8zHUM7lTr0za6lXTszRSXfUO7jMb+L5C7e2QNFs+7sIX2OQJ6a+HG8kr+jwJ4tS3cVsWtd9NXpsU40PE4MeNr5RqiNXjcDxA+L4OsEm/BlyFOEOh2epGyYUd5/iO3OiQFRNicomT2saQYAeqIwuELPs1XpLk9HLx5qPbm8fRrQhjeUD5TLO8b+4yCnObe8vy/BMUwBfq+ieWADIjwWCMp2KTpMGLz48qnaD9kdrYJ0iyHqzb2mkDhdIzkim24A3lWoYitJCBrrB2xM05sm9+OdCI1f7nPNJbl5URHobSwR94IRGT7CJcUjvwIDAQAB', //demo
  );
  final shopCode = 'Maestroni';

  Completer inited = Completer();

  Future<void> init() async {
    await _tinkoffAcquiringSdk.initialize(exceptAlreadyInitialized: false);
    inited.complete();
  }

  Future<bool> payTinkoff({required OrderDTO r}) async {
    if (_profileService.user.value?.phoneNumber == null) {
      await _profileService.getProfile();
    }

    final summ = r.products
        .map((e) => double.parse(e.price) * double.parse(e.quantity))
        .reduce((value, element) => value + element);
    final receipt = TinkoffReceipt(
        phone: '+${_profileService.user.value!.phoneNumber}',
        shopCode: shopCode,
        items: r.products
            .map((e) => TinkoffItem(
                  (double.parse(e.price) * 100).toInt(),
                  double.parse(e.quantity),
                  e.name,
                  ((double.parse(e.price) * double.parse(e.quantity)) * 100).toInt(),
                  null,
                ))
            .toList());
    final tink = await _tinkoffAcquiringSdk.openPaymentScreen(
      orderId: r.orderId,
      title: 'Оплата заказа',
      description: 'Сумма $summ руб',
      money: summ.toDouble(),
      customerId: _profileService.user.value!.phoneNumber!,
      enableSecureKeyboard: true,
      enableCameraCardScanner: true,
      darkThemeMode: TinkoffDarkThemeMode.AUTO,
      language: TinkoffLanguage.RU,
      emailRequired: false,
      // shops: Platform.isAndroid ? null : shops,
      receipt: receipt,
    );
    if (tink.status == TinkoffAcquiringCommonStatus.RESULT_OK) {
      _orderHistory.fetch();
      return true;
    } else {
      return false;
    }
  }

  Future createOrder(
      {required List<DishDTO> dishList,
      required bool isDelivery,
      required PayType paymentType,
      required String? changeFrom,
      required String comment,
      required DateTime? expectedAt,
      required bool? soonest,
      required int persons,
      String? restaurantId,
      AddressDTO? address}) async {
    final r = await _apiService.remoteDataSource.createOrder(
        orderDTO: CreateOrderDTO(
            dishList: dishList,
            expeditionType: isDelivery ? 'delivery' : 'pickup',
            expectedAt: expectedAt?.copyWith(microsecond: 0).toIso8601OffsetString(),
            soonest: soonest,
            paymentTypeId: paymentType.name,
            changeFrom: changeFrom,
            addressId: address?.id,
            comment: comment,
            persons: persons.toDouble(),
            restaurantId: restaurantId));
    if (r.isSuccessful) {
      _shoppingCartService.clear();
      _navigationService
        ..back()
        ..navigateToOrdersHistoryView();
      if (paymentType == PayType.online) {
        payTinkoff(r: r.body!);
      }
    }
    return r.isSuccessful;
  }
}
