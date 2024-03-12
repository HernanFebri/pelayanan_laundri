import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData icon;

  const ProfileWidget({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 24,
                  color: Colors.black,
                ),
                SizedBox(width: 10), // Spacer antara ikon dan teks
                Text(
                  title,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black26,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
