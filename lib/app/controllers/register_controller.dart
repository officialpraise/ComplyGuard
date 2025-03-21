import 'package:flutter_app/app/networking/auth_service.dart';
import 'package:flutter_app/resources/pages/login_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '/app/controllers/controller.dart';
import 'package:flutter/widgets.dart';

class RegisterController extends Controller {
  @override
  construct(BuildContext context) {
    super.construct(context);
  }

  onTapLogin() {
    routeTo(LoginPage.path,
        pageTransitionType: PageTransitionType.rightToLeft,
        navigationType: NavigationType.pushAndForgetAll);
  }

  Future<void> onTapRegister({required Map<String, dynamic> payLoad}) async {
    await api<AuthService>(
      (request) => request.register(payLoad),
      onSuccess: (response, data) {
        final responseBody = response.data;
        showToastSuccess(
            description: responseBody["message"],
            style: ToastNotificationStyleType.success);

        routeTo(LoginPage.path,
            pageTransitionType: PageTransitionType.fade,
            navigationType: NavigationType.pushAndForgetAll);
      },
      onError: (dioException) {
        showToastOops(
            description: dioException.error == null
                ? dioException.response!.data['message'] ??
                    'Failed to Register User'
                : dioException.type.name,
            style: ToastNotificationStyleType.danger);
      },
    );
  }
}
