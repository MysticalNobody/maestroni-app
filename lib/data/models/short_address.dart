import 'package:dart_mappable/dart_mappable.dart';
part 'short_address.mapper.dart';

/// Реквест для отправки СМС сообщения пользователю
@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.camelCase,
)
class ShortAddress with ShortAddressMappable {
  const ShortAddress({
    required this.fullAddress,
  });

  final String? fullAddress;
}
