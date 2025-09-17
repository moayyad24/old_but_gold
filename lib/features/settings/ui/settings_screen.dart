import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/widgets/content_area.dart';
import 'package:old_but_gold/core/widgets/top_gradient_container.dart';
import 'package:old_but_gold/features/home/ui/widgets/home_search_bar.dart';
import 'package:old_but_gold/features/settings/ui/widgets/settings_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TopGradientContainer(
        child: Column(
          children: [
            SettingsAppBar(),
            32.verticalSpace,
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  ContentArea(applyPadding: false, child: SettingsBody()),
                  HomeSearchBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Preferences Section
          _buildSectionTitle("Preferences"),
          _buildSettingsCard([
            _buildSettingsTile(Icons.category, "Categories"),
            _buildSettingsTile(Icons.language, "Language"),
            _buildSettingsTile(Icons.notifications, "Notifications"),
            _buildSettingsTile(Icons.payment, "Payments Methods"),
          ], true),

          // Accounts Section
          _buildSectionTitle("Accounts"),
          _buildSettingsCard([
            _buildSettingsTile(Icons.person, "Personal information"),
            _buildSettingsTile(Icons.security, "Security and Safety"),
            _buildSettingsTile(Icons.group, "Social Accounts"),
          ], true),

          // Support Section
          _buildSectionTitle("Support & About"),
          _buildSettingsCard([
            _buildSettingsTile(Icons.report, "Report a Problem"),
            _buildSettingsTile(Icons.support_agent, "Support"),
            _buildSettingsTile(Icons.description, "Terms & Policies"),
          ], true),

          // Login Section
          _buildSectionTitle("Login"),
          _buildSettingsCard([
            _buildSettingsTile(Icons.workspace_premium, "Premium account"),
            _buildSettingsTile(Icons.logout, "Log out"),
            _buildSettingsTile(
              Icons.cancel,
              "Delete account",
              textColor: Colors.red,
              iconColor: Colors.red,
            ),
          ], false),
          40.verticalSpace,
          Center(
            child: Text(
              "OBG App v1.1.1 (30042025)",
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ),
          25.verticalSpace,
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 24, right: 24),
      child: Text(title, style: AppTextStyles.bold18),
    );
  }

  Widget _buildSettingsCard(List<Widget> children, bool divider) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(children: children),
        ),
        divider
            ? Divider(thickness: 3, color: AppColors.greyC2C2C2, height: 52)
            : SizedBox.shrink(),
      ],
    );
  }

  Widget _buildSettingsTile(
    IconData icon,
    String title, {
    Color? textColor,
    Color? iconColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? Colors.black),
      contentPadding: EdgeInsets.all(0),
      minTileHeight: 40,
      title: Text(title, style: AppTextStyles.semiBold17),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        debugPrint("$title clicked");
      },
    );
  }
}
