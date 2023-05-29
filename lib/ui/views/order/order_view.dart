import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'order_viewmodel.dart';

class OrderView extends StackedView<OrderViewModel> {
  const OrderView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OrderViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  OrderViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OrderViewModel();
}
