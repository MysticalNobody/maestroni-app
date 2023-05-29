import 'package:dart_mappable/dart_mappable.dart';
part 'r_restaurant.mapper.dart';

/// Реквест для отправки СМС сообщения пользователю
@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class RRestaurant with RRestaurantMappable {
  const RRestaurant({
    required this.id,
    required this.address,
    required this.phone,
  });

  final String id;
  final String phone;
  final String address;
}
