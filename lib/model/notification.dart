import 'package:twitter/providers.dart';

class NotificationModel {
  final NotificationType type;
  final String content;
  final String sender;

  NotificationModel({
    required this.type,
    required this.content,
    required this.sender
  });
}