import 'package:flutter/material.dart';
import 'package:flutter_app/app/enum/enums.dart';
import 'package:flutter_app/app/models/escalation.dart';
import 'package:flutter_app/resources/pages/escalation_details_page.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:nylo_framework/nylo_framework.dart';

class EscalationTile extends StatelessWidget {
  const EscalationTile({super.key, required this.escalation});
  final Escalation escalation;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () => routeTo(EscalationDetailsPage.path, data: escalation),
      child: Padding(
        padding: EdgeInsets.only(top: 0.02 * height),
        child: Container(
          height: 0.18 * height,
          padding: EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100,
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(-2, -2),
              ),
              BoxShadow(
                color: Colors.grey.shade100,
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(2, -2),
              ),
              BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: Offset(-2, 2)),
              BoxShadow(
                color: Colors.grey.shade100,
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(2, 2),
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  escalation.title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Gap(height * 0.0098),
              Text(
                escalation.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              Gap(0.0147 * height),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(getDateType(escalation.status).toUpperCase()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.access_time, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        DateFormat('MMM dd, yyyy – HH:mm')
                            .format(escalation.createdAt),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getDateType(EscalationStatus type) {
    switch (type) {
      case EscalationStatus.Unknown:
        return "Unknown";
      case EscalationStatus.pending:
        return "CreatedAt";
      case EscalationStatus.ongoing:
        return "UpdatedAt";
      case EscalationStatus.resolved:
        return "ResolvedAt";
    }
  }
}
