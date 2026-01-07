import 'package:app/screen/setting_screen/change_password.dart';
import 'package:app/services/language_provide.dart';
import 'package:app/services/language_service.dart';
import 'package:app/widget/animations/flow_page_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'change_name_screen.dart';
import 'dark_mode_screen.dart';
import 'package:app/services/user_service.dart';
import 'package:app/screen/signup_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  void _showLogoutModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Are you sure you want to log out?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        Navigator.pop(context); // Close modal
                        await _logout(context);
                      },
                      child: const Text('Yes'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('No'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _logout(BuildContext context) async {
    await UserService.logout();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const SignUpScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final language = context.watch<LanguageProvider>().current;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: isDark ? Colors.white : Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          LanguageService().getSettingButtonLabel(language),
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Change Name
          _SettingItem(
            icon: Icons.person_outline,
            title: LanguageService().getUpdateProfileText(language),
            isDark: isDark,
            onTap: () {
              Navigator.push(
                context,
                FlowPageRoute(page:  const ChangeNameScreen()),
              );
            },
          ),
          Divider(
            height: 1,
            color: isDark ? Colors.grey[800] : Colors.grey.shade300,
          ),

          // Dark Mode
          _SettingItem(
            icon: Icons.dark_mode_outlined,
            title: LanguageService().getDarkModelText(language),
            isDark: isDark,
            onTap: () {
              Navigator.push(
                context,
                FlowPageRoute(page:  const DarkModeScreen()),
              );
            },
          ),

          Divider(
            height: 1,
            color: isDark ? Colors.grey[800] : Colors.grey.shade300,
          ),

          _SettingItem(
            icon: Icons.key,
            title: LanguageService().changePasswordText(language),
            isDark: isDark,
            onTap: () => {
              Navigator.push(
                context,
                FlowPageRoute(page: const ChangePasswordScreen())
                )
            },
          ),

          Divider(
            height: 1,
            color: isDark ? Colors.grey[800] : Colors.grey.shade300,
          ),

          _SettingItem(
            icon: Icons.logout,
            title: LanguageService().getLogout(language),
            isDark: isDark,
            onTap: () => _showLogoutModal(context),
          ),

          Divider(
            height: 1,
            color: isDark ? Colors.grey[800] : Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}

class _SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isDark;
  final VoidCallback onTap;

  const _SettingItem({
    required this.icon,
    required this.title,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: isDark ? Colors.white : Colors.black,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}