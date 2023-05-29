import 'package:dart_mappable/dart_mappable.dart';
part 'news_dto.mapper.dart';

/// Реквест для отправки СМС сообщения пользователю
@MappableClass(
  ignoreNull: true,
  caseStyle: CaseStyle.snakeCase,
)
class NewsDTO with NewsDTOMappable {
  const NewsDTO({
    required this.photoUrl,
    this.discription = 'Описание отсутствует',
  });

  final String photoUrl;

  final String discription;
}
