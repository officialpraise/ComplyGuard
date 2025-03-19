import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../app/enum/enums.dart';
import '../../app/models/escalation.dart';
import '../../app/networking/home_tab_service_api_service.dart';
import 'escalation_tile_widget.dart';

class EscalationListings extends StatefulWidget {
  const EscalationListings({super.key, required this.status});
  final EscalationStatus status;
  static String state = "EscalationListings";
  @override
  createState() => _EscalationListingsState();
}

class _EscalationListingsState extends NyState<EscalationListings> {
  late List<Escalation> escalations;
  _EscalationListingsState() {
    stateName = EscalationListings.state;
  }
  @override
  get init => () async {
        await api<HomeTabServiceApiService>(
            (request) => request.fecthEscalation(), onError: (dioException) {
          showToastDanger(
              description: dioException.response!.data["message"] ??
                  'Failed to Load Data',
              style: ToastNotificationStyleType.danger);
        }, onSuccess: (response, data) {
          final responseBody = response.data;
          final List<Escalation> escalation =
              (responseBody["data"] as List<dynamic>)
                  .map<Escalation>((item) => Escalation.fromJson(item))
                  .toList();

          escalations = escalation
              .where((escalation) => escalation.status == widget.status)
              .toList();
        });
      };
  @override
  void stateUpdated(data) {
    reboot(); // Reboot the widget
  }

  @override
  Widget view(BuildContext context) {
    return NyListView(
      loadingStyle: LoadingStyle.skeletonizer(),
      padding: EdgeInsets.only(bottom: 30, left: 8, right: 8),
      reverse: false,
      empty: Center(
        child: Text("No Result Found"),
      ),
      data: () async {
        return escalations;
      },
      child: (BuildContext context, data) {
        return EscalationTile(escalation: data as Escalation);
      },
    );
  }
}
