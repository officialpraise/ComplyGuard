import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/escalation.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../app/enum/enums.dart';
import '../widgets/buttons/buttons.dart';
import '/app/controllers/escalation_details_controller.dart';

class EscalationDetailsPage
    extends NyStatefulWidget<EscalationDetailsController> {
  static RouteView path =
      ("/escalation-details", (_) => EscalationDetailsPage());

  EscalationDetailsPage({super.key})
      : super(child: () => _EscalationDetailsPageState());
}

class _EscalationDetailsPageState extends NyPage<EscalationDetailsPage> {
  /// [EscalationDetailsController] controller
  EscalationDetailsController get controller => widget.controller;
  late Escalation escalation;
  String? updateStatus;
  late List<String> escalationStates;

  @override
  bool get stateManaged => true;
  @override
  get init => () {
        escalation = widget.data();
        escalationStates = ['IN_REVIEW', 'RESOLVED'];
      };

  @override
  Widget view(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text("Escalation Details")),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: height * 0.78,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Gap(0.0147 * height),
                      // Title
                      Center(
                        child: Text(
                          escalation.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Gap(0.0098 * height),
                      // Description
                      Text(
                        escalation.description,
                        style: const TextStyle(
                            fontSize: 16, color: Colors.black87),
                      ),
                      Gap(0.0197 * height),
                      // Dates Section
                      _buildDateRow(Icons.calendar_today, "Created At",
                          escalation.createdAt),
                      if (escalation.status == EscalationStatus.IN_REVIEW) ...[
                        Gap(0.0098 * height),
                        _buildDateRow(
                            Icons.update, "Last Updated", escalation.updatedAt!)
                      ],
                      if (escalation.status == EscalationStatus.RESOLVED) ...[
                        Gap(0.0098 * height),
                        _buildDateRow(Icons.check_circle, "Resolved At",
                            escalation.resolvedAt!)
                      ],
                      //status indicator
                      Gap(0.0098 * height),
                      Row(children: [
                        _statusIndicator(escalation.status, height, width),
                        const SizedBox(width: 8),
                        Text(_getStatusText(escalation.status),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: _getStatusColor(escalation.status),
                            ))
                      ]),
                      Gap(0.0098 * height),
                      if (escalation.status == EscalationStatus.RESOLVED)
                        SizedBox.shrink()
                      else
                        ...buildRadioButton,
                    ]))),
            // escalation.status == EscalationStatus.pending
            //     ? Gap(0.18 * height)
            //:
            Gap(0.008 * height),
            escalation.status == EscalationStatus.RESOLVED
                ? SizedBox.shrink()
                : Button.primary(
                    text: 'Update Status',
                    loadingStyle: LoadingStyle.normal(),
                    onPressed: () async {
                      await controller.onTapUpdateState(
                          escalationId: escalation.id, status: updateStatus);
                    })
          ],
        ),
      ),
    );
  }

  List<Widget> get buildRadioButton {
    return [
      Text('Select to update the status'),
      if (escalation.status == EscalationStatus.IN_REVIEW)
        RadioListTile(
            title: Text('Resolved'),
            value: 'RESOLVED',
            groupValue: updateStatus,
            onChanged: ((value) {
              setState(() {
                updateStatus = value;
              });
            }))
      else
        ...escalationStates.map((value) {
          return RadioListTile(
              title: Text(value),
              value: value,
              groupValue: updateStatus,
              onChanged: ((value) {
                setState(() {
                  updateStatus = value;
                });
              }));
        })
    ];
  }

  // Widget for status indicator
  Widget _statusIndicator(
      EscalationStatus status, double height, double width) {
    return Container(
      width: 0.032 * width,
      height: 0.0147 * height,
      decoration: BoxDecoration(
        color: _getStatusColor(status),
        shape: BoxShape.circle,
      ),
    );
  }

  // Get status text
  String _getStatusText(EscalationStatus status) {
    switch (status) {
      case EscalationStatus.OPEN:
        return "Pending Review";
      case EscalationStatus.IN_REVIEW:
        return "Under Investigation";
      case EscalationStatus.RESOLVED:
        return "Resolved";
      case EscalationStatus.UNKNOWN:
        return "Unknown";
    }
  }

  // Get status color
  Color _getStatusColor(EscalationStatus status) {
    switch (status) {
      case EscalationStatus.OPEN:
        return Colors.red;
      case EscalationStatus.IN_REVIEW:
        return Colors.orange;
      case EscalationStatus.RESOLVED:
        return Colors.green;
      case EscalationStatus.UNKNOWN:
        return Colors.grey;
    }
  }

  // Date Display Widget
  Widget _buildDateRow(IconData icon, String label, DateTime date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey),
          Gap(8),
          Text(
            "$label: ${DateFormat('MMM dd, yyyy – HH:mm').format(date)}",
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
