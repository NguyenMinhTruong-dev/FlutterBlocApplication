import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocapplication/page/welcome/bloc/welcome_event.dart';
import 'package:flutterblocapplication/page/welcome/bloc/welcome_state.dart';
import 'package:flutterblocapplication/util/LogUtil.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState>{
  WelcomeBloc():super(WelcomeState()){
    on<WelcomeEvent>((event, emit){
      _updatePageIndex(emit);
    });
  }

  void _updatePageIndex(Emitter emit){
    LogUtil.start("_updatePageIndex");
    emit(WelcomeState(page: state.page));
    LogUtil.end("_updatePageIndex");
  }
}

