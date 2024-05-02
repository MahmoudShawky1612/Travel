import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel/widgets/app_text.dart';

class DetailButton extends StatelessWidget {
   double size;
   final Color color;
   final Color backGroundColor;
   final Color borderColor;
   String? text;
   IconData? icon;
   bool? isIcon;
   DetailButton({Key? key,
     this.icon,
     this.text,
     this.isIcon=false,
     required this.borderColor,
     required this.color,
     required this.backGroundColor,
     required this.size,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5,right: 5),
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15),
        color: backGroundColor,
      ),
        child:isIcon==false?Center(child: AppText(text:text!,color: Colors.white,)):Icon(icon,color: color,),

    );
  }
}
