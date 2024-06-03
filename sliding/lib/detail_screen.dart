import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'data.dart';

class DetailScreen extends StatelessWidget {
  final Color color;
  final int index;
  final CustomAppBar appBar;

  DetailScreen({
    required this.color,
    required this.index,
    required this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: appBar,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tr(ImageData.imageTitles[index]),
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      tr(ImageData.imageArticles[index]), // Use article content here
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
