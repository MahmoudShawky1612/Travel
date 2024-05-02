import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/app_cubit.dart';
import 'package:travel/cubit/cubit_states.dart';
import 'package:travel/widgets/app_large_text.dart';
import 'package:travel/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List icons=[
    'images/4836598.png',
    'images/3367236.png',
    'images/3113021.png',
    'images/1974119.png',
    'images/619010.png',
  ];
  List text=[
    'Kayaking',
    'Snorkeling',
    'Ballooning',
    'Hiking',
    'Mountain',
  ];
  @override
  Widget build(BuildContext context) {
    TabController tabController=TabController(length: 3, vsync: this);
    return Scaffold(
      body:BlocBuilder<AppCubit,AppStates>(
        builder: (context,state){
          if (state is LoadedState) {
            var info = state.places;
            return  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //menu
                Container(
                  padding: EdgeInsets.only(top: 55,left: 30),
                  child: Row(
                    children: [
                      Icon(Icons.menu, size: 25,),
                      Spacer(),
                      //icon
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40,),
                //Discover
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(

                      child: AppLargeText(text: "Discover")),
                ),
                SizedBox(height: 30,),
                //tabview
                Container(
                  child: TabBar(
                    controller: tabController,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                    indicator: CircleTabIndicator(color: Colors.blueAccent,radius: 4),
                    tabs: [
                      Text("Places"),
                      Text("Inspiration"),
                      Text("Emotions"),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                //tabbarview
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 250,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      ListView.builder(
                        itemCount:4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                           onTap: (){
                             BlocProvider.of<AppCubit>(context).detail(info[index]);

                           }
                            ,
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              width: 200,
                              height: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+info[index].img),
                                  fit: BoxFit.fill,
                                ),

                              ),
                            ),
                          );
                        },

                      ),
                      Text("Biatsh"),
                      Text("Bye"),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                //explore more
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      AppLargeText(text: "Explore more",size: 23,),
                      Spacer(),
                      AppText(text: "see all",color: Colors.grey,),
                    ],
                  ),
                ),

                SizedBox(height: 10,),
                //exploreicons
                Container(
                  height: 100,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                      itemCount:icons.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_,index){

                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 15,left: 15),
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage(icons[index]),
                                    fit: BoxFit.fill,
                                  ),

                                ),

                              ),
                              Container(
                                child: AppText(text: text[index],color: Colors.grey,),
                              ),
                            ],
                          ),
                        );

                      }),
                ),
              ],
            );
          }
          else
            return Container();
        },
      ),
    );
  }
}
class CircleTabIndicator extends Decoration{
  final Color color;
  final double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return CirclePainter(color:color,radius:radius);
  }

}


class CirclePainter extends BoxPainter{
  final Color color;
  final double radius;
  CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint=Paint();
    paint.color=color;
    paint.isAntiAlias=true;
    final circleOffset=Offset(configuration.size!.width/2-radius/2, configuration.size!.height);
    canvas.drawCircle(offset+circleOffset, radius, paint);
  }

}