import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();

  toMap() {
    _navigator.navigateToMapView();
  }

  // Future<void> toVk() async {
  //   if (!await launchUrl(Uri.parse('https://flopos.app'), mode: LaunchMode.externalApplication)) {
  //     throw Exception('Could not launch');
  //   }
  // }

  Future<void> toInst() async {
    if (!await launchUrl(Uri.parse('https://www.instagram.com/italianskaya_pizza'),
        mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch');
    }
  }

  Future<void> toCall1() async {
    if (!await launchUrl(Uri.parse('tel://+78722680848'), mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch');
    }
  }

  Future<void> toCall2() async {
    if (!await launchUrl(Uri.parse('tel://+79285580558'), mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch');
    }
  }

  // Future<void> toMail() async {
  //   if (!await launchUrl(Uri.parse('https://flopos.app'), mode: LaunchMode.externalApplication)) {
  //     throw Exception('Could not launch');
  //   }
  // }

  Future<void> toPolitics() async {
    if (!await launchUrl(Uri.parse('https://maestroni.ru/'), mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch');
    }
  }
}
