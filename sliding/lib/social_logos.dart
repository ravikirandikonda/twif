import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialLogos {
  static Widget googleLogo() {
    return _buildLogo(FontAwesomeIcons.google, Color(0xFF4285F4));
  }

  static Widget facebookLogo() {
    return _buildLogo(FontAwesomeIcons.facebook, Color(0xFF3B5998));
  }

  static Widget twitterLogo() {
    return _buildLogo(FontAwesomeIcons.twitter, Color(0xFF1DA1F2));
  }

  static Widget _buildLogo(IconData iconData, Color color) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: IconButton(
          icon: Icon(iconData),
          color: color,
          onPressed: () {
            // Handle button press
          },
        ),
      ),
    );
  }
}
