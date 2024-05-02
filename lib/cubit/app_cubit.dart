import 'package:bloc/bloc.dart';
import 'package:travel/cubit/cubit_states.dart';
import 'package:travel/model/data_model.dart';
import 'package:travel/services/data_services.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit({required this.data}):super(InitialState()) {
    emit(WelcomeState());
  }
  final DataService data;
  late final places;
  void getData()async{

    try {
      emit(LoadingState());

      places=await data.getInfo();
      emit(LoadedState(places));
    } on Exception catch (e) {
      // TODO
    }

  }

  detail(DataModel data){
    emit(DetailState(data));
  }

  goHome(){
    emit(LoadedState(places));
  }

 }