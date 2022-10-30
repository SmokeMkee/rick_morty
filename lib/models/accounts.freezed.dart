// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'accounts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Accounts _$AccountsFromJson(Map<String, dynamic> json) {
  return _Accounts.fromJson(json);
}

/// @nodoc
mixin _$Accounts {
  DateTime? get created => throw _privateConstructorUsedError;
  List<String>? get episode => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  Location? get location => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  Location? get origin => throw _privateConstructorUsedError;
  String? get species => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountsCopyWith<Accounts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsCopyWith<$Res> {
  factory $AccountsCopyWith(Accounts value, $Res Function(Accounts) then) =
      _$AccountsCopyWithImpl<$Res>;
  $Res call(
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
      String? url});

  $LocationCopyWith<$Res>? get location;
  $LocationCopyWith<$Res>? get origin;
}

/// @nodoc
class _$AccountsCopyWithImpl<$Res> implements $AccountsCopyWith<$Res> {
  _$AccountsCopyWithImpl(this._value, this._then);

  final Accounts _value;
  // ignore: unused_field
  final $Res Function(Accounts) _then;

  @override
  $Res call({
    Object? created = freezed,
    Object? episode = freezed,
    Object? gender = freezed,
    Object? id = freezed,
    Object? image = freezed,
    Object? location = freezed,
    Object? name = freezed,
    Object? origin = freezed,
    Object? species = freezed,
    Object? status = freezed,
    Object? type = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      episode: episode == freezed
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      origin: origin == freezed
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as Location?,
      species: species == freezed
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $LocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value));
    });
  }

  @override
  $LocationCopyWith<$Res>? get origin {
    if (_value.origin == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.origin!, (value) {
      return _then(_value.copyWith(origin: value));
    });
  }
}

/// @nodoc
abstract class _$$_AccountsCopyWith<$Res> implements $AccountsCopyWith<$Res> {
  factory _$$_AccountsCopyWith(
          _$_Accounts value, $Res Function(_$_Accounts) then) =
      __$$_AccountsCopyWithImpl<$Res>;
  @override
  $Res call(
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
      String? url});

  @override
  $LocationCopyWith<$Res>? get location;
  @override
  $LocationCopyWith<$Res>? get origin;
}

/// @nodoc
class __$$_AccountsCopyWithImpl<$Res> extends _$AccountsCopyWithImpl<$Res>
    implements _$$_AccountsCopyWith<$Res> {
  __$$_AccountsCopyWithImpl(
      _$_Accounts _value, $Res Function(_$_Accounts) _then)
      : super(_value, (v) => _then(v as _$_Accounts));

  @override
  _$_Accounts get _value => super._value as _$_Accounts;

  @override
  $Res call({
    Object? created = freezed,
    Object? episode = freezed,
    Object? gender = freezed,
    Object? id = freezed,
    Object? image = freezed,
    Object? location = freezed,
    Object? name = freezed,
    Object? origin = freezed,
    Object? species = freezed,
    Object? status = freezed,
    Object? type = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_Accounts(
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      episode: episode == freezed
          ? _value._episode
          : episode // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      origin: origin == freezed
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as Location?,
      species: species == freezed
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Accounts implements _Accounts {
  const _$_Accounts(
      {this.created,
      final List<String>? episode,
      this.gender,
      this.id,
      this.image,
      this.location,
      this.name,
      this.origin,
      this.species,
      this.status,
      this.type,
      this.url})
      : _episode = episode;

  factory _$_Accounts.fromJson(Map<String, dynamic> json) =>
      _$$_AccountsFromJson(json);

  @override
  final DateTime? created;
  final List<String>? _episode;
  @override
  List<String>? get episode {
    final value = _episode;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? gender;
  @override
  final int? id;
  @override
  final String? image;
  @override
  final Location? location;
  @override
  final String? name;
  @override
  final Location? origin;
  @override
  final String? species;
  @override
  final String? status;
  @override
  final String? type;
  @override
  final String? url;

  @override
  String toString() {
    return 'Accounts(created: $created, episode: $episode, gender: $gender, id: $id, image: $image, location: $location, name: $name, origin: $origin, species: $species, status: $status, type: $type, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Accounts &&
            const DeepCollectionEquality().equals(other.created, created) &&
            const DeepCollectionEquality().equals(other._episode, _episode) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.origin, origin) &&
            const DeepCollectionEquality().equals(other.species, species) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(created),
      const DeepCollectionEquality().hash(_episode),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(origin),
      const DeepCollectionEquality().hash(species),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$$_AccountsCopyWith<_$_Accounts> get copyWith =>
      __$$_AccountsCopyWithImpl<_$_Accounts>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountsToJson(
      this,
    );
  }
}

abstract class _Accounts implements Accounts {
  const factory _Accounts(
      {final DateTime? created,
      final List<String>? episode,
      final String? gender,
      final int? id,
      final String? image,
      final Location? location,
      final String? name,
      final Location? origin,
      final String? species,
      final String? status,
      final String? type,
      final String? url}) = _$_Accounts;

  factory _Accounts.fromJson(Map<String, dynamic> json) = _$_Accounts.fromJson;

  @override
  DateTime? get created;
  @override
  List<String>? get episode;
  @override
  String? get gender;
  @override
  int? get id;
  @override
  String? get image;
  @override
  Location? get location;
  @override
  String? get name;
  @override
  Location? get origin;
  @override
  String? get species;
  @override
  String? get status;
  @override
  String? get type;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$_AccountsCopyWith<_$_Accounts> get copyWith =>
      throw _privateConstructorUsedError;
}
