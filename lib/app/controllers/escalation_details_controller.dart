import 'package:flutter_app/app/networking/home_tab_service_api_service.dart';
import 'package:flutter_app/resources/widgets/escalation_listings_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '/app/controllers/controller.dart';
import 'package:flutter/widgets.dart';

class EscalationDetailsController extends Controller {
  @override
  construct(BuildContext context) {
    super.construct(context);
  }

  Future<void> onTapUpdateState({
    required int escalationId,
    required String? status,
  }) async {
    if (status == null) {
      showToastInfo(
          description: 'Select status to update',
          style: ToastNotificationStyleType.info);
    } else {
      await api<HomeTabServiceApiService>(
        (request) => request.updateEscalation(
            id: escalationId,
            status: status,
            isResolved: status == "RESOLVED" ? true : false),
        onSuccess: (response, data) async {
          showToastSuccess(
              description: 'Status Updated Successfully',
              style: ToastNotificationStyleType.success);
          StateAction.refreshPage(EscalationListings.state);
          pop();
        },
        onError: (dioException) {
          showToastDanger(
              description: 'Failed Update Status',
              style: ToastNotificationStyleType.danger);
        },
      );
    }
  }
}
