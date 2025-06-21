import 'package:marketmind/core/assets/assets.dart';
import 'package:marketmind/features/root/settings/util/settings_route.dart';

enum SettingsAction { navigate, logout, deleteAccount, resetAIAssistant }

class SettingsEntity {
  final String asset;
  final String name;
  final bool canOpen;
  final SettingsAction action;
  final String? route;

  const SettingsEntity({
    required this.asset,
    required this.name,
    this.action = SettingsAction.navigate,
    this.route,
    this.canOpen = true,
  });
}

class SettingsCategoryEntity {
  final String category;
  final List<SettingsEntity> settings;

  const SettingsCategoryEntity({
    required this.category,
    required this.settings,
  });
}

final List<SettingsCategoryEntity> settingsCategories = [
  SettingsCategoryEntity(
    category: 'Account & Profile',
    settings: [
      SettingsEntity(
          asset: SettingsAssets.settingsProfile,
          name: 'Personal Information',
          route: SettingsRoutes.personalInformation),
      SettingsEntity(
          asset: SettingsAssets.settingsLock,
          name: 'Security',
          route: SettingsRoutes.security),
      SettingsEntity(
        asset: SettingsAssets.settingsDeviceManagement,
        name: 'Device Management',
      ),
    ],
  ),
  SettingsCategoryEntity(
    category: 'Platform Settings',
    settings: [
      SettingsEntity(
          asset: SettingsAssets.settingsBell,
          name: 'Notification',
          route: SettingsRoutes.notification),
      SettingsEntity(
        asset: SettingsAssets.settingsDisplayMarket,
        name: 'Display & Market Data Preferences',
      ),
      SettingsEntity(
        asset: SettingsAssets.aiConfiguration,
        name: 'AI Configuration',
      ),
    ],
  ),
  SettingsCategoryEntity(
    category: 'Subscriptions & Billing',
    settings: [
      SettingsEntity(
        asset: SettingsAssets.settingsPaymentMethod,
        name: 'Payment Method & Subscription',
      ),
      SettingsEntity(
        asset: SettingsAssets.settingsBillingHistory,
        name: 'Billing History',
      ),
    ],
  ),
  SettingsCategoryEntity(
    category: 'Referral Program',
    settings: [
      SettingsEntity(
        asset: SettingsAssets.settingsReferralDashboard,
        name: 'Referral Dashboard',
      ),
      SettingsEntity(
        asset: SettingsAssets.settingsPayout,
        name: 'Payout Settings',
      ),
    ],
  ),
  SettingsCategoryEntity(
    category: 'Danger Zone',
    settings: [
      SettingsEntity(
        asset: SettingsAssets.settingsResetAI,
        action: SettingsAction.resetAIAssistant,
        name: 'Reset AI Assistant Settings',
      ),
      SettingsEntity(
        asset: SettingsAssets.settingsDeleteAccount,
        action: SettingsAction.deleteAccount,
        name: 'Delete Account',
      ),
      SettingsEntity(
        asset: SettingsAssets.settingsContactUs,
        name: 'Contact Us',
      ),
      SettingsEntity(
        asset: SettingsAssets.settingsCheckForUpdate,
        name: 'Check for Updates',
      ),
      SettingsEntity(
        asset: SettingsAssets.settingsLogout,
        action: SettingsAction.logout,
        name: 'Log Out',
      ),
    ],
  ),
];
