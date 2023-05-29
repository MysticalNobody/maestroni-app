import 'package:dart_mappable/dart_mappable.dart';

import 'r_restaurant.dart';
part 'r_order_resp.mapper.dart';

/// Реквест для отправки СМС сообщения пользователю
@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class ROrderResp with ROrderRespMappable {
  const ROrderResp({
    required this.orderId,
    required this.restaurant,
    required this.onlinePayUrl,
  });

  final String? orderId;
  final RRestaurant? restaurant;
  final String? onlinePayUrl;
}
