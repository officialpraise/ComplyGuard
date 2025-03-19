import 'package:flutter_app/app/enum/enums.dart';
import 'package:nylo_framework/nylo_framework.dart';

class Escalation extends Model {
  static StorageKey key = "escalation";
  final int id;
  final String title;
  final String description;
  final EscalationStatus status; // Ongoing, Pending, Resolved
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? resolvedAt;

  Escalation(
      {this.updatedAt,
      required this.status,
      required this.id,
      required this.title,
      required this.description,
      required this.createdAt,
      this.resolvedAt})
      : super(key: key);

  factory Escalation.fromJson(Map<String, dynamic> data) {
    return Escalation(
      status: getEscalationStatus(data['status'] as String),
      id: data['id'] as int,
      title: data['title'] as String,
      description: data['reason'] as String,
      createdAt: DateTime.parse(data['created_at'] as String),
      resolvedAt: data['resolved_date'] == null
          ? null
          : DateTime.parse(data['resolved_date'] as String),
      updatedAt: data['updated_at'] == null
          ? null
          : DateTime.parse(data['updated_at'] as String),
    );
  }

  @override
  toJson() {
    return {
      status: this.status,
      id: this.id,
      title: this.title,
      description: this.description,
      createdAt: this.createdAt,
      resolvedAt: this.resolvedAt,
      updatedAt: this.updatedAt
    };
  }
}

EscalationStatus getEscalationStatus(String type) {
  switch (type) {
    case "OPEN":
      return EscalationStatus.OPEN;
    case "IN_REVIEW":
      return EscalationStatus.IN_REVIEW;
    case "RESOLVED":
      return EscalationStatus.RESOLVED;

    default:
      return EscalationStatus.UNKNOWN;
  }
}
