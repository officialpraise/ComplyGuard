import 'package:flutter/material.dart';
import 'package:flutter_app/app/forms/register_form.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../widgets/buttons/buttons.dart';
import '../widgets/safearea_widget.dart';
import '../widgets/text_with_textbutton_widget.dart';
import '/app/controllers/register_controller.dart';

class RegisterPage extends NyStatefulWidget<RegisterController> {
  static RouteView path = ("/register", (_) => RegisterPage());

  RegisterPage({super.key}) : super(child: () => _RegisterPageState());
}

class _RegisterPageState extends NyPage<RegisterPage> {
  /// [RegisterController] controller
  RegisterController get controller => widget.controller;
  late RegisterForm form;
  bool loading = false;

  @override
  bool get stateManaged => true;
  @override
  get init => () async {
        form = RegisterForm();
        //  await sleep(3);
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
                'REGISTER',
                style: TextStyle(fontSize: 24),
              )),
              SizedBox(height: 10),
              NyForm(
                  validateOnFocusChange: true,
                  form: form,
                  footerSpacing: 16,
                  footer: Button.primary(
                      text: "Register",
                      loadingStyle: LoadingStyle.normal(),
                      submitForm: ((
                        form,
                        (data) async {
                          await controller.onTapRegister(
                              payLoad: data as Map<String, dynamic>);
                        }
                      )))),
              SizedBox(height: 20),
              TextWithTextbutton(
                  text: 'Already have an account?',
                  buttonText: 'Login',
                  onPressedButton: controller.onTapLogin)
            ])));
  }
}
