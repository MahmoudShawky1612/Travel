import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/app_cubit.dart';
import 'package:travel/cubit/cubit_states.dart';
import 'package:travel/pages/home_page.dart';
import 'package:travel/pages/navigation/details_page.dart';
import 'package:travel/pages/on_boarding.dart';


class Logics extends StatefulWidget {
  const Logics({Key? key}) : super(key: key);

  @override
  State<Logics> createState() => _LogicsState();
}

class _LogicsState extends State<Logics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit,AppStates>(
        builder:(context,state){
          if(state is WelcomeState)
            {
              return OnBoarding();
            }
           if(state is LoadingState)
          {
            return Container(child: Center(child: CircularProgressIndicator()),);
          }
          if(state is LoadedState)
          {
            return HomePage();
          }
          if(state is DetailState)
          {
            return DetailsPage();
          }
         else
           return Container();

        }
      ),
    );
  }
}

















