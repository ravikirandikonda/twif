import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Remove default back button
      backgroundColor: Color(0xFF171308), // Set background color to brown
      elevation: 0, // Remove shadow
      toolbarHeight: 80, // Adjust the height of the app bar
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            child: SizedBox(
              height: 100, // Adjust the height of the image container
              width: 100, // Adjust the width of the image container
              child: Image.asset(
                'assets/logobg.png', // Adjust the path to your logo image
                fit: BoxFit.contain, // Ensure the entire image is visible
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.menu,
              size: 40,
              color: Colors.amber,
            ),
            onPressed: () {
              _showAppBarMenu(context);
            },
          ),
        ],
      ),
    );
  }

  void _showAppBarMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(tr('select_action')), // Translate 'Select Action' text
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(tr('admin')), // Translate 'Admin' text
              onTap: () {
                // Navigate to admin form screen
                Navigator.pushNamed(context, '/adminform');
              },
            ),
            ListTile(
              title: Text(tr('language')), // Translate 'Language' text
              onTap: () {
                // Show language selection dialog
                _showLanguageSelectionDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showLanguageSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(tr('select_language')), // Translate 'Select Language' text
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('English'),
              onTap: () {
                // Change app language to English
                context.setLocale(Locale('en', 'US'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('हिन्दी'), // Hindi text
              onTap: () {
                // Change app language to Hindi
                context.setLocale(Locale('hi', 'IN'));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
