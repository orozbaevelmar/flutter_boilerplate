// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/color_constant.dart';
import 'package:flutter_boilerplate/constants/constants.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double topMargin;
  final Color colofOfContainer;
  final bool hasShadow;
  final Color textColor;
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.topMargin = 0,
    this.colofOfContainer = MColor.greenPrimary,
    this.hasShadow = true,
    this.textColor = MColor.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: topMargin),
        height: 51,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: colofOfContainer,
          boxShadow: [
            if (hasShadow)
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 8,
                spreadRadius: 0,
                color: Color(0xFF000000).withOpacity(0.25),
              ),
          ],
          border: Border.all(color: MColor.greenPrimary),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: MTextStyle.ui_16Semi(
            textColor,
          ),
        ),
      ),
    );
  }
}
