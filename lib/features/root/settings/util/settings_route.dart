import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/settings/presentation/screens/notification_settings.dart';
import 'package:marketmind/features/root/settings/presentation/settings.root.dart';

import '../presentation/screens/personal_information_screen.dart';
import '../presentation/screens/security_screen.dart';

class SettingsRoutes {
  static final Map<String, Widget> settingsRoute = {
    'settings': SettingsRoot(),
    personalInformation: PersonalInformationScreen(),
    security: SecurityScreen(),
    notification: NotificationSettings()
  };
  static final personalInformation = 'profile';
  static final security = 'security';
  static final deviceManagement = 'device-management';
  static final notification = 'notification';
  static final displayMarket = 'display-market';
  static final aiConfiguration = 'ai-configuration';
  static final paymentMethod = 'payment-method';
  static final billingHistory = 'billing-history';
  static final referralDashboard = 'referral-dashboard';
  static final payoutSettings = 'payout-settings';
  static final resetAI = 'reset-ai';
  static final deleteAccount = 'delete-account';
  static final contactUs = 'contact-us';
  static final resetAIConfirmation = 'reset-ai-confirmation';
  static final deleteAccountConfirmation = 'delete-account-confirmation';
  static final contactUsConfirmation = 'contact-us-confirmation';
  static final checkForUpdate = 'check-for-update';
}
