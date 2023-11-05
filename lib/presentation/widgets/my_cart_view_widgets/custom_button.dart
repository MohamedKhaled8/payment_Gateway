import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final Color color;
  const CustomButton({
    Key? key,
    required this.color,
    this.onTap,
    required this.text,
    this.isLoading = false,
  }) : super(key: key);

  final String text;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: ShapeDecoration(
          color: const Color(0xFF34A853),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: color,
                    fontSize: 22.sp,
                    fontFamily: 'Inter',
                  ),
                ),
        ),
      ),
    );
  }
}
