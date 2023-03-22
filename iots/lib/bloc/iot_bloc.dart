import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:iots/class/language.dart';
import 'package:iots/page/mainmenu.dart';
import 'package:meta/meta.dart';

part 'iot_event.dart';
part 'iot_state.dart';

// class IotBlocLanguage extends Bloc<languageIotEvent, languageIotEvent> {
//   IotBlocLanguage() : super(languageIotEvent()) {
//     on<languageIotEvent>((event, emit) {
//       if (event == true) {
//         return 'th';
//       } else {
//         return 'en';
//       }
//     });
//   }
// }

class LgsBloc extends Bloc<LgsEvent, LgsState> {
  LgsBloc() : super(const LgsState()) {
    // Add Event
    on<LgsEventAdd>((event, emit) async {
      print('LgsEventAdd');
      await Future.delayed(const Duration(seconds: 0));
      // emit(LgsState(lgs: 'th'));
      emit(state.copyWith(lgs:  'th'));
    });

    on<LgsEventRemove>((event, emit) async {
      print('LgsEventRemove');
      await Future.delayed(const Duration(seconds: 0));
      emit(state.copyWith(lgs:  'en'));
      // emit(state.copyWith(count: state.count + 1));
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

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    // Add
    on<LoginEventAdd>((event, emit) async {
      // execute something
      await Future.delayed(Duration(seconds: 0));
      emit(state.copyWith(count: state.count + 1));
    });

    // Remove
    on<LoginEventRemove>((event, emit) async {
      // execute something
      await Future.delayed(Duration(seconds: 0));
      emit(state.copyWith(count: state.count - 1));
    });
  }
}
