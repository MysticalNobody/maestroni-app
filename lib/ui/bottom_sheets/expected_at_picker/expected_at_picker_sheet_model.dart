import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class ExpectedAtPickerSheetModel extends BaseViewModel {
  List<int> get minutes => getMinutes();

  List<int> get hours => getHours();

  List<DateTime> get days => getDays();

  late DateTime selectedDay = days.first;

  late int selectedHour = hours.first;

  late int selectedMin = minutes.first;

  List<DateTime> getDays() {
    List<DateTime> d = [];
    for (var i = 0; i < 15; i++) {
      d.add(DateTime.now().add(Duration(days: i)));
    }
    return d;
  }

  String getDayString(DateTime day) {
    if (day.day == days.first.day) {
      return 'Сегодня';
    } else if (day.day == days[1].day) {
      return 'Завтра';
    } else {
      return DateFormat.yMd().format(day);
    }
  }

  List<int> getMinutes() {
    List<int> m = [];
    if (selectedDay.day == days.first.day) {
      for (var i = DateTime.now()
              .add(const Duration(hours: 2))
              .copyWith(minute: 0)
              .minute;
          i < 60;
          i = i + 5) {
        m.add(i);
      }
    } else {
      for (var i = 0; i < 60; i = i + 5) {
        m.add(i);
      }
    }

    return m;
  }

  String timeToString(int t) {
    if (t < 10) {
      return '0$t';
    } else {
      return '$t';
    }
  }

  List<int> getHours() {
    List<int> h = [];
    if (selectedDay.day == days.first.day) {
      for (var i = DateTime.now().add(const Duration(hours: 2)).hour;
          i < 22;
          i++) {
        h.add(i);
      }
    } else {
      for (var i = 8; i < 22; i++) {
        h.add(i);
      }
    }
    return h;
  }
}
