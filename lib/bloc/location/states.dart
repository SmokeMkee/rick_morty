import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lesson3/models/location.dart';
part 'states.freezed.dart';

@freezed
class StateBlocLocation with _$StateBlocLocation {
  const factory StateBlocLocation.initial() = StateLocationInitial;
  const factory StateBlocLocation.loading() = StateLocationLoading;
  const factory StateBlocLocation.data(
      {required List<Location> data,
      @Default(false) bool isLoading,
      String? errorMessage}) = StateLocationData;

  const factory StateBlocLocation.error(String error) = StateLocationError;
}
