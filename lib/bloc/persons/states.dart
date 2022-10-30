import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/accounts.dart';

part 'states.freezed.dart';

@freezed
class StateBlocPersons with _$StateBlocPersons {
  const factory StateBlocPersons.initial() = StatePersonsInitial;
  const factory StateBlocPersons.loading() = StatePersonsLoading;
  const factory StateBlocPersons.data({
    required List<Accounts> data,
  }) = StatePersonData;
  const factory StateBlocPersons.error({required String error}) =
      StatePersonsError;
}
