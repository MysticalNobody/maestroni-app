import 'dart:async';
import 'dart:developer' as dev;
import 'dart:io';

import 'package:iso8601_offset/iso8601_offset.dart';
import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/data/models/address_dto.dart';
import 'package:maestroni/data/models/create_order_dto.dart';
import 'package:maestroni/data/models/dish_dto.dart';
import 'package:maestroni/services/api_service.dart';
import 'package:maestroni/services/profile_service.dart';
import 'package:tinkoff_acquiring_sdk/models/tinkoff_item.dart';
import 'package:tinkoff_acquiring_sdk/models/tinkoff_receipt.dart';
import 'package:tinkoff_acquiring_sdk/models/tinkoff_tax.dart';
import 'package:tinkoff_acquiring_sdk/tinkoff_acquiring_models.dart';
import 'package:tinkoff_acquiring_sdk/tinkoff_acquiring_sdk.dart';

enum PaymentMethodEnum { apple, google, card, anal }

final paymentMethods = {
  if (Platform.isIOS) PaymentMethodEnum.apple: 'ApplePay',
  if (Platform.isAndroid) PaymentMethodEnum.google: 'GooglePay',
  PaymentMethodEnum.card: 'Банковская карта',
};

class PaymentService {
  PaymentService() {
    init();
  }
  final _profileService = locator<ProfileService>();
  final _apiService = locator<ApiService>();

  final TinkoffAcquiringSdk _tinkoffAcquiringSdk = TinkoffAcquiringSdk(
    // isDeveloperMode: true, //demo
    isDebug: true,
    terminalKey: '1667394428171DEMO', //demo
    password: '6ijd85pmrp0sxusu', //demo
    // terminalKey: '1667394428171', //work
    // password: '07dbdvcst1vmg2sw', //work
    publicKey:
        // 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAv5yse9ka3ZQE0feuGtemYv3IqOlLck8zHUM7lTr0za6lXTszRSXfUO7jMb+L5C7e2QNFs+7sIX2OQJ6a+HG8kr+jwJ4tS3cVsWtd9NXpsU40PE4MeNr5RqiNXjcDxA+L4OsEm/BlyFOEOh2epGyYUd5/iO3OiQFRNicomT2saQYAeqIwuELPs1XpLk9HLx5qPbm8fRrQhjeUD5TLO8b+4yCnObe8vy/BMUwBfq+ieWADIjwWCMp2KTpMGLz48qnaD9kdrYJ0iyHqzb2mkDhdIzkim24A3lWoYitJCBrrB2xM05sm9+OdCI1f7nPNJbl5URHobSwR94IRGT7CJcUjvwIDAQAB', //work
        'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAv5yse9ka3ZQE0feuGtemYv3IqOlLck8zHUM7lTr0za6lXTszRSXfUO7jMb+L5C7e2QNFs+7sIX2OQJ6a+HG8kr+jwJ4tS3cVsWtd9NXpsU40PE4MeNr5RqiNXjcDxA+L4OsEm/BlyFOEOh2epGyYUd5/iO3OiQFRNicomT2saQYAeqIwuELPs1XpLk9HLx5qPbm8fRrQhjeUD5TLO8b+4yCnObe8vy/BMUwBfq+ieWADIjwWCMp2KTpMGLz48qnaD9kdrYJ0iyHqzb2mkDhdIzkim24A3lWoYitJCBrrB2xM05sm9+OdCI1f7nPNJbl5URHobSwR94IRGT7CJcUjvwIDAQAB', //demo
    enableGooglePay: Platform.isAndroid,
  );
  final shopCode = 'Maestroni';

  Completer inited = Completer();

  Future<void> init() async {
    await _tinkoffAcquiringSdk.initialize(exceptAlreadyInitialized: false);
    inited.complete();
  }

  Future<bool> payOnline(
      {required List<DishDTO> dishList,
      required String expeditionType,
      required String paymentTypeId,
      required String? changeFrom,
      required String comment,
      required int persons,
      String? restaurantId,
      AddressDTO? address}) async {
    if (_profileService.user.value?.phoneNumber == null) {
      await _profileService.getProfile();
    }
    final r = await _apiService.remoteDataSource.createOrder(
        orderDTO: CreateOrderDTO(
            dishList: dishList,
            expeditionType: expeditionType,
            expectedAt: DateTime.now().copyWith(microsecond: 0).toIso8601OffsetString(),
            paymentTypeId: paymentTypeId,
            changeFrom: changeFrom,
            addressId: address?.id,
            comment: comment,
            persons: persons.toDouble(),
            restaurantId: restaurantId));
    dev.log(r.body.toString());

    if (!r.isSuccessful) {
      dev.log(r.error.toString());
      return false;
    }
    // final shops = [
    //   TinkoffShop(
    //     amount: amount,
    //     shopCode: shopCode,
    //   ),
    // ];
    final summ = dishList
        .map((e) => double.parse(e.price) * double.parse(e.quantity))
        .reduce((value, element) => value + element);
    final receipt = TinkoffReceipt(
      phone: '+${_profileService.user.value!.phoneNumber}',
      shopCode: shopCode,
      items: [
        TinkoffItem(
          (summ * 100).toInt(),
          1,
          r.body!.data.systemOrderId.toString(),
          (summ * 100).toInt(),
          TinkoffTax.none,
        ),
      ],
    );
    final tink = await _tinkoffAcquiringSdk.openPaymentScreen(
      orderId: r.body!.data.systemOrderId.toString(),
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
      receipt: Platform.isAndroid ? null : receipt,
    );
    dev.log(tink.toJson().toString());
    if (tink.status == TinkoffAcquiringCommonStatus.RESULT_OK) {
      return true;
    } else {
      return false;
    }
  }

  Future payCashOrCard(
      {required List<DishDTO> dishList,
      required String expeditionType,
      required String paymentTypeId,
      required String? changeFrom,
      required String comment,
      required int persons,
      String? restaurantId,
      AddressDTO? address}) async {
    final r = await _apiService.remoteDataSource.createOrder(
        orderDTO: CreateOrderDTO(
            dishList: dishList,
            expeditionType: expeditionType,
            expectedAt: DateTime.now().copyWith(microsecond: 0).toIso8601OffsetString(),
            paymentTypeId: paymentTypeId,
            changeFrom: changeFrom,
            addressId: address?.id,
            comment: comment,
            persons: persons.toDouble(),
            restaurantId: restaurantId));

    return r.isSuccessful;
  }
}
