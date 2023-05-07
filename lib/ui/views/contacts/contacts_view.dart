import 'package:flutter/material.dart';
import 'package:maestroni/res/assets/assets.gen.dart';
import 'package:stacked/stacked.dart';

import 'contacts_viewmodel.dart';

class ContactsView extends StackedView<ContactsViewModel> {
  const ContactsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ContactsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: SizedBox(
              width: double.infinity,
              child: Assets.images.contacts.image(fit: BoxFit.fitWidth)),
        ),
      ),
    );
  }

  @override
  ContactsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ContactsViewModel();
}
