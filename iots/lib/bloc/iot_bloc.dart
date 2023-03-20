import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:iots/class/language.dart';
import 'package:meta/meta.dart';

part 'iot_event.dart';
part 'iot_state.dart';

class IotBloc extends Bloc<IotEvent, IotState> {
  IotBloc() : super(IotInitial()) {
    on<IotEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

class IotBlocLanguage extends Bloc<IotEventLanguages, IotStateLanguage> {
  IotBlocLanguage() : super(IotInitialLanguage()) {
    on<IotEventLanguages>((event, emit) {
      // TODO: implement event handler
    });
  }
}


// class IotBlocLanguage extends Bloc<IotEventLanguages, IotStateLanguage> {
//   IotBlocLanguage() : super(IotInitialLanguage()) {
//     on<IotEventLanguages>((event, emit) {
//       // TODO: implement event handler

//     });
//   }
// }
