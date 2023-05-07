import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maestroni/res/theme/app_typography.dart';
import 'package:maestroni/ui/widgets/app_bar.dart';
import 'package:maestroni/ui/widgets/app_button.dart';
import 'package:stacked/stacked.dart';

import 'auth_code_viewmodel.dart';

class AuthCodeView extends StackedView<AuthCodeViewModel> {
  const AuthCodeView({required this.phone, Key? key}) : super(key: key);
  final String phone;

  @override
  Widget builder(
    BuildContext context,
    AuthCodeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const AAppBar(
        title: 'Вход',
        withPop: true,
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: [
              const SizedBox(height: 90),
              Text(
                'Для оформления заказа нужен ваш телефон!',
                style: AppTypography.med22,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: viewModel.controller,
                autofocus: true,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    hintText: '_ _ _ _',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()),
              ),
              const SizedBox(height: 24),
              AButtonFilled(
                text: 'Продолжить',
                onPressed: viewModel.onSend,
              )
            ],
          ),
          if (viewModel.isBusy)
            Positioned.fill(
                child: Container(
              color: Colors.black54,
              alignment: Alignment.center,
              child: Container(
                height: 36,
                width: 36,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                alignment: Alignment.center,
                child: const CupertinoActivityIndicator(),
              ),
            ))
        ],
      ),
    );
  }

  @override
  AuthCodeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AuthCodeViewModel(phone);
}
