import 'package:flutter/material.dart';

class MyButtonSmall extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;
  final String? iconImagePath;
  final Color? color;

  const MyButtonSmall({super.key, required this.onTap, required this.buttonText, this.iconImagePath, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 100),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            iconImagePath != null
                ? Image.asset(
              iconImagePath!,
              width: 24, // Set the desired width for the image
              height: 24, // Set the desired height for the image
            )
                : SizedBox(width: 24, height: 24), // Use a SizedBox with the same size as the image placeholder
            SizedBox(width: iconImagePath != null ? 10 : 0), // Add spacing between icon and text
            Text(
              buttonText,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}