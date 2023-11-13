// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entry_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EntryCategory _$EntryCategoryFromJson(Map<String, dynamic> json) {
  return _EntryCategory.fromJson(json);
}

/// @nodoc
mixin _$EntryCategory {
  String get name => throw _privateConstructorUsedError;
  EntryCategoryType get type => throw _privateConstructorUsedError;
  @JsonKey(name: r'$id', includeToJson: false)
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntryCategoryCopyWith<EntryCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntryCategoryCopyWith<$Res> {
  factory $EntryCategoryCopyWith(
          EntryCategory value, $Res Function(EntryCategory) then) =
      _$EntryCategoryCopyWithImpl<$Res, EntryCategory>;
  @useResult
  $Res call(
      {String name,
      EntryCategoryType type,
      @JsonKey(name: r'$id', includeToJson: false) String? id});
}

/// @nodoc
class _$EntryCategoryCopyWithImpl<$Res, $Val extends EntryCategory>
    implements $EntryCategoryCopyWith<$Res> {
  _$EntryCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EntryCategoryType,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EntryCategoryImplCopyWith<$Res>
    implements $EntryCategoryCopyWith<$Res> {
  factory _$$EntryCategoryImplCopyWith(
          _$EntryCategoryImpl value, $Res Function(_$EntryCategoryImpl) then) =
      __$$EntryCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      EntryCategoryType type,
      @JsonKey(name: r'$id', includeToJson: false) String? id});
}

/// @nodoc
class __$$EntryCategoryImplCopyWithImpl<$Res>
    extends _$EntryCategoryCopyWithImpl<$Res, _$EntryCategoryImpl>
    implements _$$EntryCategoryImplCopyWith<$Res> {
  __$$EntryCategoryImplCopyWithImpl(
      _$EntryCategoryImpl _value, $Res Function(_$EntryCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? id = freezed,
  }) {
    return _then(_$EntryCategoryImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EntryCategoryType,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EntryCategoryImpl implements _EntryCategory {
  const _$EntryCategoryImpl(
      {required this.name,
      required this.type,
      @JsonKey(name: r'$id', includeToJson: false) this.id});

  factory _$EntryCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$EntryCategoryImplFromJson(json);

  @override
  final String name;
  @override
  final EntryCategoryType type;
  @override
  @JsonKey(name: r'$id', includeToJson: false)
  final String? id;

  @override
  String toString() {
    return 'EntryCategory(name: $name, type: $type, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntryCategoryImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, type, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EntryCategoryImplCopyWith<_$EntryCategoryImpl> get copyWith =>
      __$$EntryCategoryImplCopyWithImpl<_$EntryCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EntryCategoryImplToJson(
      this,
    );
  }
}

abstract class _EntryCategory implements EntryCategory {
  const factory _EntryCategory(
          {required final String name,
          required final EntryCategoryType type,
          @JsonKey(name: r'$id', includeToJson: false) final String? id}) =
      _$EntryCategoryImpl;

  factory _EntryCategory.fromJson(Map<String, dynamic> json) =
      _$EntryCategoryImpl.fromJson;

  @override
  String get name;
  @override
  EntryCategoryType get type;
  @override
  @JsonKey(name: r'$id', includeToJson: false)
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$EntryCategoryImplCopyWith<_$EntryCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
