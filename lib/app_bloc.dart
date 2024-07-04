import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocapplication/app_events.dart';
import 'package:flutterblocapplication/util/LogUtil.dart';

import 'app_states.dart';
import 'dart:developer' as developer;

class AppBloc extends Bloc<AppEvents, AppStates>{
  AppBloc():super(InitStates()){

    on<Increment>((event, emit){
      _incrementCounter(emit);
      emit(AppStates(counter: state.counter+1));
    });

    on<Decrement>((event, emit){
      _decrementCounter(emit);
    });
  }

  void _incrementCounter(Emitter<AppStates> emit) {
    LogUtil.start("_incrementCounter");
    emit(AppStates(counter: state.counter+1));
    developer.log('FlutterApp: _incrementCounter "${state.counter}"');
    LogUtil.end("_incrementCounter");
  }

  void _decrementCounter(Emitter<AppStates> emit) {
    LogUtil.start("_decrementCounter");
    emit(AppStates(counter: state.counter-1));
    developer.log('FlutterApp: _decrementCounter "${state.counter}"');
    LogUtil.end("_decrementCounter");
  }
}