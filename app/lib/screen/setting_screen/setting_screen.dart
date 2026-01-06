// import 'package:flutter/material.dart';
// import 'change_name_screen.dart';
// import 'dark_mode_screen.dart';

// class SettingScreen extends StatefulWidget {
//   const SettingScreen({super.key});

//   @override
//   State<SettingScreen> createState() => _SettingScreenState();
// }

// class _SettingScreenState extends State<SettingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Theme.of(context).iconTheme.color),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text(
//           'Setting',
//           style: TextStyle(
//             color: Theme.of(context).textTheme.titleLarge?.color,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           // Change Name
//           _SettingItem(
//             icon: Icons.person_outline,
//             title: 'Change Name',
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const ChangeNameScreen()),
//               );
//             },
//           ),
//           Divider(height: 1, color: Colors.grey.shade300),

//           // Dark Mode
//           _SettingItem(
//             icon: Icons.dark_mode_outlined,
//             title: 'Dark Mode',
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const DarkModeScreen()),
//               );
//             },
//           ),
//           Divider(height: 1, color: Colors.grey.shade300),
//         ],
//       ),
//     );
//   }
// }

// class _SettingItem extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final VoidCallback onTap;

//   const _SettingItem({
//     required this.icon,
//     required this.title,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//         child: Row(
//           children: [
//             Icon(icon, size: 24, color: Theme.of(context).iconTheme.color),
//             const SizedBox(width: 12),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Theme.of(context).textTheme.bodyLarge?.color,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'change_name_screen.dart';
import 'dark_mode_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
          'Setting',
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
            title: 'Change Name',
            isDark: isDark,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChangeNameScreen()),
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
            title: 'Dark Mode',
            isDark: isDark,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DarkModeScreen()),
              );
            },
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