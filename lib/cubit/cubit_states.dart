import 'package:equatable/equatable.dart';

import '../model/data_model.dart';

abstract class AppStates extends Equatable{

}

class InitialState extends AppStates{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class WelcomeState extends AppStates{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoadingState extends AppStates{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoadedState extends AppStates{
  LoadedState(this.places);
 final List<DataModel> places;
  @override
  // TODO: implement props
  List<Object> get props =>[places];
}

class DetailState extends AppStates{
  DetailState(this.place);
  final DataModel place;
  @override
  // TODO: implement props
  List<Object> get props =>[place];
}