import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/app_cubit.dart';
import 'package:travel/cubit/cubit_states.dart';
import 'package:travel/widgets/app_large_text.dart';
import 'package:travel/widgets/app_text.dart';
import 'package:travel/widgets/details_button.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int gottenStar=3;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppStates>(builder:(context,state){
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              //image
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/3368864f77a3f8ef067fd63f533e19c6.jpg'),
                          fit: BoxFit.cover
                      )
                  ),
                ),),
              //menu button
              Positioned(
                top: 35,
                left: 10,
                child:Row(
                  children: [
                    IconButton(onPressed: (){
                      BlocProvider.of<AppCubit>(context).goHome();
                    }, icon: Icon(Icons.menu),color: Colors.white,),
                  ],
                ),),
              //container
              Positioned(
                top: 305,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 430,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.only(top: 25,left: 30,right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //price
                        Row(
                          children: [
                            AppLargeText(text: "High Road"),
                            Spacer(),
                            AppText(text: "\$ 250",color: Colors.black.withOpacity(.6),size: 25,),
                          ],
                        ),
                        SizedBox(height: 10,),
                        //Destination
                        Container(
                          width: double.maxFinite,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset('images/l.png',scale: 6,),
                              SizedBox(width: 5,),
                              AppText(text: "USA, California",color: Colors.black.withOpacity(0.6),),


                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        //stars
                        Row(
                          children: [
                            Wrap(
                                children:List.generate(5, (index) {
                                  return Icon(Icons.star,color: index<gottenStar?Colors.red:Colors.grey,);
                                })
                            ),
                            SizedBox(width: 5,),
                            AppText(text: "(5.0)",color: Colors.grey,)
                          ],
                        ),
                        AppLargeText(text: "People"),
                        SizedBox(height: 3,),
                        AppText(text: "Number of people in your group",color: Colors.grey,),
                        SizedBox(height: 5,),
                        Wrap(
                          children:List.generate(5, (index) {
                            return DetailButton(
                              borderColor:  Colors.red,
                              color: Colors.black,
                              backGroundColor: Colors.red,
                              size: 50,
                              text: (index+1).toString(),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  //Destination
                ),),
            ],
          ),
        ),
      );
    });
  }
}
