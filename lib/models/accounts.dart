import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lesson3/models/location.dart';
part 'accounts.freezed.dart';
part 'accounts.g.dart';

@freezed
class Accounts with _$Accounts {
  const factory Accounts(
      {DateTime? created,
      List<String>? episode,
      String? gender,
      int? id,
      String? image,
      Location? location,
      String? name,
      Location? origin,
      String? species,
      String? status,
      String? type,
      String? url}) = _Accounts;

  factory Accounts.fromJson(Map<String, Object?> json) =>
      _$AccountsFromJson(json);
}
