part of 'iot_bloc.dart';

// @immutable
// abstract class IotEvent {}

// class languageIotEvent extends IotBlocLanguage {}

abstract class LgsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LgsEventAdd extends LgsEvent {}

class LgsEventRemove extends LgsEvent {}

// class LgsEvent extends LgsBloc {
//   // bool bools;
//   // LgsEvent({required this.bools});
// }

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginEventAdd extends LoginEvent {}

class LoginEventRemove extends LoginEvent {}
