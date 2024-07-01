import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocapplication/app_events.dart';

import 'app_states.dart';

class AppBloc extends Bloc<AppEvents, AppStates>{
  AppBloc():super(InitStates()){

    on<Increment>((event, emit){
      _incrementCounter(emit);
      emit(AppStates(counter: state.counter+1));
      print('FlutterApp: _incrementCounter "${state.counter}"');
    });

    on<Decrement>((event, emit){
      _decrementCounter(emit);
      print('FlutterApp: _decrementCounter "${state.counter}"');
    });
  }

  void _incrementCounter(Emitter<AppStates> emit) {
    emit(AppStates(counter: state.counter+1));
  }

  void _decrementCounter(Emitter<AppStates> emit) {
    emit(AppStates(counter: state.counter-1));
  }
}