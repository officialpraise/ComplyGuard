import 'package:flutter/material.dart';
import 'package:flutter_app/resources/pages/home_navigation_hub.dart';
import 'package:flutter_app/resources/pages/register_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../config/keys.dart';
import '../models/user.dart';
import '../networking/auth_service.dart';
import '/app/controllers/controller.dart';
import 'package:flutter/widgets.dart';

class LoginController extends Controller {
  @override
  construct(BuildContext context) {
    super.construct(context);
  }

  onTapCreateAccount() {
    print('tapped');
    routeTo(RegisterPage.path,
        pageTransitionType: PageTransitionType.rightToLeft,
        navigationType: NavigationType.pushAndForgetAll);
  }

  Future<void> onTapLogin(Map<String, dynamic> payLoad) async {
    await api<AuthService>(
      (request) => request.login(payLoad),
      onSuccess: (response, data) async {
        final responseBody = response.data;
        User user = User.fromJson(responseBody['user']);
        String token = responseBody['token'];

        await Auth.authenticate(data: {"user": user});
        Backpack.instance.save(Keys.bearerToken, token);

        routeTo(HomeNavigationHub.path,
            pageTransitionType: PageTransitionType.fade,
            navigationType: NavigationType.pushAndForgetAll);
      },
      onError: (dioException) {
        showToastDanger(
            description: dioException.error == null
                ? dioException.response!.data['message'] ?? 'Failed to Login'
                : dioException.type.name,
            style: ToastNotificationStyleType.danger);
      },
    );
  }
}
