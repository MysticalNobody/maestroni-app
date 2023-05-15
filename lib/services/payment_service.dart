import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:tinkoff_acquiring_sdk/models/tinkoff_item.dart';
import 'package:tinkoff_acquiring_sdk/models/tinkoff_receipt.dart';
import 'package:tinkoff_acquiring_sdk/models/tinkoff_shop.dart';
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

  final TinkoffAcquiringSdk _tinkoffAcquiringSdk = TinkoffAcquiringSdk(
    // isDeveloperMode: true, //demo
    isDebug: true,
    // terminalKey: '1667394428171DEMO', //demo
    // password: '6ijd85pmrp0sxusu', //demo
    terminalKey: '1667394428171', //work
    password: '07dbdvcst1vmg2sw', //work
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

  Future<TinkoffCommonResponse?> pay({
    required String externalId,
    required String id,
    required double amount,
  }) async {
    // final order = await paymentRepository.createOrder(
    //   CreateOrderRequest(amount: price, id: id),
    // );

    // if (order == null) {
    //   throw Exception('Не удалось оплатить');
    // }

    TinkoffCommonResponse? response;
    final shops = [
      TinkoffShop(
        amount: amount,
        shopCode: shopCode,
      ),
    ];
    final receipt = TinkoffReceipt(
      phone: '+79992370073',
      shopCode: shopCode,
      items: [
        TinkoffItem(
          amount,
          1,
          externalId,
          amount,
          TinkoffTax.none,
        ),
      ],
    );
    response = await _tinkoffAcquiringSdk.openPaymentScreen(
      orderId:
          (99 + Random(DateTime.now().millisecondsSinceEpoch).nextInt(100000))
              .toString(),
      title: 'Оплата заказа',
      description: 'Сумма $amount руб',
      money: amount,
      customerId:
          (99 + Random(DateTime.now().millisecondsSinceEpoch).nextInt(100000))
              .toString(),
      enableSecureKeyboard: true,
      enableCameraCardScanner: true,
      darkThemeMode: TinkoffDarkThemeMode.AUTO,
      language: TinkoffLanguage.RU,
      emailRequired: true,
      // shops: Platform.isAndroid ? null : shops,
      // receipt: Platform.isAndroid ? null : receipt,
    );

    return response;
  }
}
