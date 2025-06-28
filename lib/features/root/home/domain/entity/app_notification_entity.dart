import 'package:marketmind/core/assets/assets.dart';

class AppNotificationEntity {
  final String asset;
  final String title;
  final String content;
  final DateTime time;
  final bool isRead;

  AppNotificationEntity({
    required this.asset,
    required this.title,
    required this.content,
    required this.time,
    this.isRead = false,
  });

  static final List<AppNotificationEntity> dummyNotifications = [
    AppNotificationEntity(
      asset: Assets.notificationBookIcon,
      title: 'New Course Available!',
      content: 'Check out our latest UI/UX Design course starting next week.',
      time: DateTime.now().subtract(const Duration(minutes: 15)),
      isRead: false,
    ),
    AppNotificationEntity(
      asset: Assets.notificationTrendIcon,
      title: 'System Maintenance',
      content: 'Scheduled maintenance will occur tomorrow at 2 AM.',
      time: DateTime.now().subtract(const Duration(hours: 2)),
      isRead: true,
    ),
    AppNotificationEntity(
      asset: Assets.notificationMoneyIcon,
      title: 'Limited-Time Offer!',
      content: 'Get 20% off on all software testing courses this week.',
      time: DateTime.now().subtract(const Duration(days: 1)),
      isRead: false,
    ),
    AppNotificationEntity(
      asset: Assets.notificationBellIcon,
      title: 'New Course Available!',
      content: 'Check out our latest UI/UX Design course starting next week.',
      time: DateTime.now().subtract(const Duration(minutes: 15)),
      isRead: false,
    ),
  ];
}
