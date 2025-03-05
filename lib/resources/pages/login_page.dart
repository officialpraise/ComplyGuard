import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../app/forms/login_form.dart';
import '../widgets/safearea_widget.dart';
import '/app/controllers/login_controller.dart';

class LoginPage extends NyStatefulWidget<LoginController> {
  static RouteView path = ("/login", (_) => LoginPage());

  LoginPage({super.key}) : super(child: () => _LoginPageState());
}

class _LoginPageState extends NyPage<LoginPage> {
  /// [LoginController] controller
  LoginController get controller => widget.controller;

  @override
  get init => () {};

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      body: SafeAreaWidget(
          child: Column(
        children: [
          Gap(150),
          Text('LOGIN'),
          NyForm(
            form: LoginForm(),
          ),
        ],
      )),
    );
  }
}
