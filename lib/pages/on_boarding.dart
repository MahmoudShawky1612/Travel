import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/app_cubit.dart';
import 'package:travel/widgets/app_large_text.dart';
import 'package:travel/widgets/app_text.dart';
import 'package:travel/widgets/responsive_buttob.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List image = [
    'v.jpg',
    'c.jpg',
    'p.jpg',
  ];
  List<Color> colors = [
    Colors.teal,
    Colors.brown,
    Colors.blueGrey,
  ];
  List text = [
    'A trip to the extraordinary Venice can make your past, present and future.',
    'A trip to the extraordinary Cairo can make your past, present and future.',
    'A trip to the extraordinary Paris can make your past, present and future.',

  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body:
        PageView.builder(
          physics: BouncingScrollPhysics(),
            itemCount: image.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (_,index){
         return Container(
            width: double.maxFinite,
            height: double.maxFinite,

           decoration: BoxDecoration(
             color: colors[index],
             image: DecorationImage(
               fit: BoxFit.scaleDown,
               image: AssetImage(
                "images/"+image[index],
               ),
             ),
           ),
           child: Container(
             margin: EdgeInsets.only(top: 550,left: 20,right: 20),
             child: Row(
               children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(height: 10,),
                     Row(
                       children: [
                         AppLargeText( text: 'Trip',),
                         SizedBox(width: 20,),
                         GestureDetector(
                             onTap: (){
                               BlocProvider.of<AppCubit>(context).getData();
                             },
                             child: ResponsiveButton(width: 120,)),
                       ],
                     ),
                     SizedBox(height: 20,),
                     Container(
                       width: 200,
                       child: AppText(text: text[index]),
                     ),

                   ],
                 ),
                 Spacer(),
                 Column(
                   children: List.generate(3, (indexDots) {
                     return Container(
                       margin: EdgeInsets.only(bottom: 3),
                       width: 8,
                       height: index==indexDots?21 : 8,
                       decoration: BoxDecoration(
                         color: index==indexDots?Colors.white : Colors.grey,
                         borderRadius: BorderRadius.circular(15),
                       ),
                     );
                   }),
                 ),
               ],
             ),
           ),
          );
        })
      ),
    );
  }
}
