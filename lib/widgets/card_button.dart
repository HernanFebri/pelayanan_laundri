import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback? onPressed; // Tambahkan properti onPressed

  const CardButton(this.title, this.imagePath, {Key? key, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onPressed, // Gunakan onPressed di dalam InkWell
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.contain,
                width: 200,
                height: 100,
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
