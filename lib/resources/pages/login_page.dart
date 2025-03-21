import 'package:flutter/material.dart';
import 'package:flutter_app/resources/widgets/text_with_textbutton_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../app/forms/login_form.dart';
import '../widgets/buttons/buttons.dart';
import '../widgets/safearea_widget.dart';
import '/app/controllers/login_controller.dart';

class LoginPage extends NyStatefulWidget<LoginController> {
  static RouteView path = ("/login", (_) => LoginPage());

  LoginPage({super.key}) : super(child: () => _LoginPageState());
}

class _LoginPageState extends NyPage<LoginPage> {
  /// [LoginController] controller
  LoginController get controller => widget.controller;
  late LoginForm form;

  @override
  bool get stateManaged => true;
  @override
  get init => () {
        form = LoginForm();
      };

  @override
  Widget view(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeAreaWidget(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              SizedBox(height: 100),
              Center(
                  child: Text(
                'LOGIN',
                style: TextStyle(fontSize: 24),
              )),
              SizedBox(height: 10),
              NyForm(
                  validateOnFocusChange: true,
                  form: form,
                  footerSpacing: 16,
                  footer: Button.primary(
                      text: 'Login',
                      submitForm: (
                        form,
                        (data) async {
                          await controller
                              .onTapLogin(data as Map<String, dynamic>);
                        }
                      ),
                      loadingStyle: LoadingStyle.normal())),
              SizedBox(height: 20),
              TextWithTextbutton(
                  text: 'Dont have an account?',
                  buttonText: 'Create account',
                  onPressedButton: controller.onTapCreateAccount)
            ])));
  }
}
