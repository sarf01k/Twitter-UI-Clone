import 'package:twitter/providers/providers.dart';

class NotificationModel {
  final NotificationType type;
  final String content;
  final String senderDisplayName;
  final String senderUserName;
  final String senderPfp;
  final bool isVerified;

  NotificationModel({
    required this.type,
    required this.content,
    required this.senderDisplayName,
    required this.senderUserName,
    required this.senderPfp,
    required this.isVerified
  });
}