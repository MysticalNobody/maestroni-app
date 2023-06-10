import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maestroni/res/theme/app_typography.dart';
import 'package:maestroni/ui/widgets/app_bar.dart';
import 'package:maestroni/ui/widgets/app_button.dart';
import 'package:stacked/stacked.dart';

import 'auth_phone_viewmodel.dart';

class AuthPhoneView extends StackedView<AuthPhoneViewModel> {
  const AuthPhoneView({required this.fromCart, Key? key}) : super(key: key);

  final bool fromCart;

  @override
  Widget builder(
    BuildContext context,
    AuthPhoneViewModel viewModel,
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
                fromCart
                    ? 'Для оформления заказа нужен ваш телефон, мы вышлем смс с кодом авторизации'
                    : 'Введите номер телефона, мы вышлем смс с кодом авторизации',
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
                    hintText: '+7 (999) 999-99-99',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              Center(child: Text('Продолжая вы соглашаетесь с')),
              TextButton(onPressed: () => viewModel.toPolitics(), child: Text('Политикой конфиденциальности')),
              const SizedBox(height: 16),
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
  AuthPhoneViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AuthPhoneViewModel();
}
