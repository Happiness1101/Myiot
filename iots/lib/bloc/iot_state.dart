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

class IotEventLanguages extends IotEventLanguage {
  IotEventLanguages({
    required this.lgs,
  });
  final bool lgs;

  @override
  List<bool?> get props => [lgs];
}
