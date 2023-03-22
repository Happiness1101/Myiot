part of 'iot_bloc.dart';

enum CategoryStatus { initial, success, error, loading, selected }

extension CategoryStatusX on CategoryStatus {
  bool get isInitial => this == CategoryStatus.initial;
  bool get isSuccess => this == CategoryStatus.success;
  bool get isError => this == CategoryStatus.error;
  bool get isLoading => this == CategoryStatus.loading;
  bool get isSelected => this == CategoryStatus.selected;
}

@immutable
abstract class IotState {}

class IotInitial extends IotState {}

@immutable
abstract class IotStateLanguage {}

class IotInitialLanguage extends IotStateLanguage {}

/////////////////////
// class CategoryEvent extends IotEventLanguage {
//   @override
//   List<Object?> get props => [];
// }

// class GetCategories extends CategoryEvent {}

// ignore: must_be_immutable
class LgsState extends Equatable {
  final String lgs;

 const LgsState({this.lgs = 'th'});

  LgsState copyWith({String? lgs}) {
    print('copyWith');
    print(lgs);
    return LgsState(lgs: lgs ?? this.lgs);
  }

  @override
  List<Object?> get props => [lgs];
}

class LoginState extends Equatable {
  final int count;
  final bool isAuthened;

  const LoginState({
    this.count = 0,
    this.isAuthened = false,
  });

  LoginState copyWith({
    int? count,
    bool? isAuthened,
  }) {
    return LoginState(
      count: count ?? this.count,
      isAuthened: isAuthened ?? this.isAuthened,
    );
  }

  @override
  List<Object?> get props => [count, isAuthened];
}
