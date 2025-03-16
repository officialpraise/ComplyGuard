import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/escalation.dart';
import 'package:flutter_app/resources/widgets/escalation_tile_widget.dart';
import 'package:gap/gap.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../app/enum/enums.dart';

class EscalationListings extends StatelessWidget {
  EscalationListings({super.key});
  //final List<Escalation> escalations;
  final List<Escalation> escalations = [
    // Pending escalation: Awaiting review
    Escalation(
      id: 1,
      status: EscalationStatus.pending,
      title: "Unapproved Data Access Attempt",
      description:
          """An employee attempted to access restricted financial records without prior authorization. 
          The request was flagged by the security team for further review, pending validation of intent and compliance. 
          Management intervention is required to determine the necessity of access or potential policy violations. 
          Immediate review is needed to prevent potential data breaches.An employee attempted to access restricted financial records without prior authorization. 
          The request was flagged by the security team for further review, pending validation of intent and compliance. 
          Management intervention is required to determine the necessity of access or potential policy violations. 
          Immediate review is needed to prevent potential data breaches.An employee attempted to access restricted financial records without prior authorization. 
          The request was flagged by the security team for further review, pending validation of intent and compliance. 
          Management intervention is required to determine the necessity of access or potential policy violations. 
          Immediate review is needed to prevent potential data breaches.An employee attempted to access restricted financial records without prior authorization. 
          The request was flagged by the security team for further review, pending validation of intent and compliance. 
          Management intervention is required to determine the necessity of access or potential policy violations. 
          Immediate review is needed to prevent potential data breaches.An employee attempted to access restricted financial records without prior authorization. 
          The request was flagged by the security team for further review, pending validation of intent and compliance. 
          Management intervention is required to determine the necessity of access or potential policy violations. 
          Immediate review is needed to prevent potential data breaches.An employee attempted to access restricted financial records without prior authorization. 
          The request was flagged by the security team for further review, pending validation of intent and compliance. 
          Management intervention is required to determine the necessity of access or potential policy violations. 
          Immediate review is needed to prevent potential data breaches.An employee attempted to access restricted financial records without prior authorization. 
          The request was flagged by the security team for further review, pending validation of intent and compliance. 
          Management intervention is required to determine the necessity of access or potential policy violations. 
          Immediate review is needed to prevent potential data breaches.An employee attempted to access restricted financial records without prior authorization. 
          The request was flagged by the security team for further review, pending validation of intent and compliance. 
          Management intervention is required to determine the necessity of access or potential policy violations. 
          Immediate review is needed to prevent potential data breaches.An employee attempted to access restricted financial records without prior authorization. 
          The request was flagged by the security team for further review, pending validation of intent and compliance. 
          Management intervention is required to determine the necessity of access or potential policy violations. 
          Immediate review is needed to prevent potential data breaches.An employee attempted to access restricted financial records without prior authorization. 
          The request was flagged by the security team for further review, pending validation of intent and compliance. 
          Management intervention is required to determine the necessity of access or potential policy violations. 
          Immediate review is needed to prevent potential data breaches.""",
      createdAt: DateTime(2025, 3, 1),
      updatedAt: null,
      resolvedAt: null,
    ),

    // Ongoing escalation: Under investigation
    Escalation(
      id: 2,
      status: EscalationStatus.ongoing,
      title: "Unauthorized Use of Company Assets",
      description:
          "A team member was reported using company-issued devices for non-business-related activities. "
          "This includes personal project development on secured hardware, potentially impacting network integrity. "
          "Initial discussions have been conducted, and further monitoring is in place to assess policy compliance. "
          "HR and IT security are collaborating to determine an appropriate resolution.",
      createdAt: DateTime(2025, 3, 2),
      updatedAt: DateTime(2025, 3, 3),
      resolvedAt: null,
    ),

    // Resolved escalation: Case closed
    Escalation(
      id: 3,
      status: EscalationStatus.resolved,
      title: "Breach of Confidentiality Agreement",
      description:
          "A confidential document was shared externally without authorization, raising concerns about "
          "intellectual property security. After a thorough investigation, it was confirmed that no critical data was leaked. "
          "The responsible employee received a formal warning, and additional security measures were implemented. "
          "The case has been closed with enhanced training sessions planned for all staff.",
      createdAt: DateTime(2025, 3, 3),
      updatedAt: DateTime(2025, 3, 4),
      resolvedAt: DateTime(2025, 3, 5),
    ),

    // Pending escalation
    Escalation(
      id: 4,
      status: EscalationStatus.pending,
      title: "Failure to Report Workplace Incident",
      description:
          "A supervisor failed to report a workplace safety incident within the required timeframe. "
          "This delay in communication has resulted in compliance concerns and the need for an internal review. "
          "The safety team has requested statements from all involved personnel to assess procedural adherence. "
          "Pending a formal review, corrective actions may include additional training or disciplinary measures.",
      createdAt: DateTime(2025, 3, 4),
      updatedAt: null,
      resolvedAt: null,
    ),

    // Ongoing escalation
    Escalation(
      id: 5,
      status: EscalationStatus.ongoing,
      title: "Violation of Internal Communication Policies",
      description:
          "An internal memo containing sensitive company strategy details was forwarded outside the authorized team. "
          "This breach of protocol poses a risk to operational confidentiality and competitive advantage. "
          "A forensic audit of email logs and messaging platforms is underway to determine the scope of the violation. "
          "Further disciplinary actions may be required based on investigation findings.",
      createdAt: DateTime(2025, 3, 5),
      updatedAt: DateTime(2025, 3, 6),
      resolvedAt: null,
    ),

    // Resolved escalation
    Escalation(
      id: 6,
      status: EscalationStatus.resolved,
      title: "Falsification of Expense Reports",
      description:
          "A routine audit revealed inconsistencies in an employee’s expense reports, with suspected "
          "overstatement of travel expenses. The finance team conducted a detailed review and verified discrepancies. "
          "The employee has since reimbursed the company, and new oversight mechanisms have been put in place. "
          "The case has been resolved with additional auditing protocols implemented moving forward.",
      createdAt: DateTime(2025, 3, 6),
      updatedAt: DateTime(2025, 3, 7),
      resolvedAt: DateTime(2025, 3, 8),
    ),

    // Pending escalation
    Escalation(
      id: 7,
      status: EscalationStatus.pending,
      title: "Repeated Non-Compliance with IT Security Policies",
      description:
          "An employee has consistently failed to comply with IT security protocols, despite multiple warnings. "
          "The most recent violation involved the use of personal storage devices on company workstations, posing a cyber risk. "
          "The security team is assessing whether this is due to negligence or intentional disregard for policies. "
          "Pending review, disciplinary action may be necessary to enforce adherence to cybersecurity guidelines.",
      createdAt: DateTime(2025, 3, 7),
      updatedAt: null,
      resolvedAt: null,
    ),

    // Ongoing escalation
    Escalation(
      id: 8,
      status: EscalationStatus.ongoing,
      title: "Workplace Harassment Complaint Under Review",
      description:
          "A formal complaint has been filed against a team leader alleging inappropriate workplace behavior. "
          "The HR department has initiated a confidential investigation, gathering witness statements and reviewing records. "
          "All parties involved have been advised of the ongoing review, and interim measures have been implemented. "
          "The outcome will determine whether disciplinary actions, sensitivity training, or further escalation is required.",
      createdAt: DateTime(2025, 3, 8),
      updatedAt: DateTime(2025, 3, 9),
      resolvedAt: null,
    ),

    // Resolved escalation
    Escalation(
      id: 9,
      status: EscalationStatus.ongoing,
      title: "Non-Disclosure Agreement Violation",
      description:
          """An employee was found discussing proprietary software features with an external party, violating an NDA. 
          A detailed review was conducted, confirming no major competitive information was compromised. "
          The individual received a formal warning, and additional legal briefings were introduced to prevent future incidents. "
          This matter is now closed, with stricter monitoring of external communications in place.An employee was found discussing proprietary software features with an external party, violating an NDA. 
          A detailed review was conducted, confirming no major competitive information was compromised. "
          The individual received a formal warning, and additional legal briefings were introduced to prevent future incidents. "
          This matter is now closed, with stricter monitoring of external communications in place.An employee was found discussing proprietary software features with an external party, violating an NDA. 
          A detailed review was conducted, confirming no major competitive information was compromised. "
          The individual received a formal warning, and additional legal briefings were introduced to prevent future incidents. "
          This matter is now closed, with stricter monitoring of external communications in place.An employee was found discussing proprietary software features with an external party, violating an NDA. 
          A detailed review was conducted, confirming no major competitive information was compromised. "
          The individual received a formal warning, and additional legal briefings were introduced to prevent future incidents. "
          This matter is now closed, with stricter monitoring of external communications in place.An employee was found discussing proprietary software features with an external party, violating an NDA. 
          A detailed review was conducted, confirming no major competitive information was compromised. "
          The individual received a formal warning, and additional legal briefings were introduced to prevent future incidents. "
          This matter is now closed, with stricter monitoring of external communications in place.An employee was found discussing proprietary software features with an external party, violating an NDA. 
          A detailed review was conducted, confirming no major competitive information was compromised. "
          The individual received a formal warning, and additional legal briefings were introduced to prevent future incidents. "
          This matter is now closed, with stricter monitoring of external communications in place.An employee was found discussing proprietary software features with an external party, violating an NDA. 
          A detailed review was conducted, confirming no major competitive information was compromised. "
          The individual received a formal warning, and additional legal briefings were introduced to prevent future incidents. "
          This matter is now closed, with stricter monitoring of external communications in place.""",
      createdAt: DateTime(2025, 3, 9),
      updatedAt: DateTime(2025, 3, 10),
      resolvedAt: null,
    ),

    // Final Resolved escalation
    Escalation(
      id: 10,
      status: EscalationStatus.resolved,
      title: "Unauthorized Financial Transactions",
      description:
          "A finance department audit detected an unauthorized transaction flagged as non-compliant. "
          "Following a thorough internal review, it was determined that the issue resulted from an oversight rather than fraud. "
          "Corrective measures have been implemented, including stronger approval processes for high-value transactions. "
          "The case is now officially closed, with additional compliance training scheduled for the finance team.",
      createdAt: DateTime(2025, 3, 10),
      updatedAt: DateTime(2025, 3, 11),
      resolvedAt: DateTime(2025, 3, 12),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return NyListView(
      loadingStyle: LoadingStyle.skeletonizer(),
      padding: EdgeInsets.only(bottom: 30, left: 8, right: 8),
      reverse: false,
      empty: Center(
        child: Text("No Result Found"),
      ),
      data: () {
        return escalations;
      },
      child: (BuildContext context, data) {
        return EscalationTile(escalation: data as Escalation);
      },
    );
  }
}
