import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.onTap});
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: double.infinity,
        height: 60,
        child: Text(
          "Update",
          style: TextStyle(color: Colors.white, fontSize: 25),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
