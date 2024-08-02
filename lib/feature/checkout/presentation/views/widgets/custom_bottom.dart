import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,this.onTap,required this.text});
final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: ShapeDecoration(
            color: Color(0xFF34A853),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            )
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style:Styles.style22 ,
          ),
        ),
      ),
    )
    ;
  }
}
