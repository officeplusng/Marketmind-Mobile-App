import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/home/presentation/referral/referral_dashboard.dart';
import 'package:marketmind/features/root/settings/presentation/screens/notification_settings.dart';
import 'package:marketmind/features/root/settings/presentation/settings.root.dart';
import '../presentation/screens/personal_information_screen.dart';
import '../presentation/screens/security_screen.dart';

class SettingsRoutes {
  static final Map<String, Widget> settingsRoute = {
    'settings': SettingsRoot(),
    personalInformation: PersonalInformationScreen(),
    security: SecurityScreen(),
    notification: NotificationSettings(),
    referralDashboard: ReferralDashboard(),
  };
  static const personalInformation = 'profile';
  static const security = 'security';
  static const deviceManagement = 'device-management';
  static const notification = 'notification';
  static const displayMarket = 'display-market';
  static const aiConfiguration = 'ai-configuration';
  static const paymentMethod = 'payment-method';
  static const billingHistory = 'billing-history';
  static const referralDashboard = 'referral-dashboard';
  static const payoutSettings = 'payout-settings';
  static const resetAI = 'reset-ai';
  static const deleteAccount = 'delete-account';
  static const contactUs = 'contact-us';
  static const resetAIConfirmation = 'reset-ai-confirmation';
  static const deleteAccountConfirmation = 'delete-account-confirmation';
  static const contactUsConfirmation = 'contact-us-confirmation';
  static const checkForUpdate = 'check-for-update';
}
