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
      description: data['description'] as String,
      createdAt: DateTime.parse(data['createdAt'] as String),
      resolvedAt: DateTime.parse(data['resolvedAt'] as String),
      updatedAt: DateTime.parse(data['updatedAt'] as String),
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
    case "ongoing":
      return EscalationStatus.ongoing;
    case "Pending":
      return EscalationStatus.pending;
    case "Resolved":
      return EscalationStatus.resolved;

    default:
      return EscalationStatus.Unknown;
  }
}
