// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'txn_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TxnCategory _$TxnCategoryFromJson(Map<String, dynamic> json) {
  return _TxnCategory.fromJson(json);
}

/// @nodoc
mixin _$TxnCategory {
  String get name => throw _privateConstructorUsedError;
  TransactionType get type => throw _privateConstructorUsedError;
  @JsonKey(name: Strings.id$, includeToJson: false)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: Strings.createdAt$, includeToJson: false)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: Strings.updatedAt$, includeToJson: false)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TxnCategoryCopyWith<TxnCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TxnCategoryCopyWith<$Res> {
  factory $TxnCategoryCopyWith(
          TxnCategory value, $Res Function(TxnCategory) then) =
      _$TxnCategoryCopyWithImpl<$Res, TxnCategory>;
  @useResult
  $Res call(
      {String name,
      TransactionType type,
      @JsonKey(name: Strings.id$, includeToJson: false) String? id,
      @JsonKey(name: Strings.createdAt$, includeToJson: false)
      DateTime? createdAt,
      @JsonKey(name: Strings.updatedAt$, includeToJson: false)
      DateTime? updatedAt});
}

/// @nodoc
class _$TxnCategoryCopyWithImpl<$Res, $Val extends TxnCategory>
    implements $TxnCategoryCopyWith<$Res> {
  _$TxnCategoryCopyWithImpl(this._value, this._then);

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
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TxnCategoryImplCopyWith<$Res>
    implements $TxnCategoryCopyWith<$Res> {
  factory _$$TxnCategoryImplCopyWith(
          _$TxnCategoryImpl value, $Res Function(_$TxnCategoryImpl) then) =
      __$$TxnCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      TransactionType type,
      @JsonKey(name: Strings.id$, includeToJson: false) String? id,
      @JsonKey(name: Strings.createdAt$, includeToJson: false)
      DateTime? createdAt,
      @JsonKey(name: Strings.updatedAt$, includeToJson: false)
      DateTime? updatedAt});
}

/// @nodoc
class __$$TxnCategoryImplCopyWithImpl<$Res>
    extends _$TxnCategoryCopyWithImpl<$Res, _$TxnCategoryImpl>
    implements _$$TxnCategoryImplCopyWith<$Res> {
  __$$TxnCategoryImplCopyWithImpl(
      _$TxnCategoryImpl _value, $Res Function(_$TxnCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$TxnCategoryImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TxnCategoryImpl implements _TxnCategory {
  const _$TxnCategoryImpl(
      {required this.name,
      required this.type,
      @JsonKey(name: Strings.id$, includeToJson: false) this.id,
      @JsonKey(name: Strings.createdAt$, includeToJson: false) this.createdAt,
      @JsonKey(name: Strings.updatedAt$, includeToJson: false) this.updatedAt});

  factory _$TxnCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TxnCategoryImplFromJson(json);

  @override
  final String name;
  @override
  final TransactionType type;
  @override
  @JsonKey(name: Strings.id$, includeToJson: false)
  final String? id;
  @override
  @JsonKey(name: Strings.createdAt$, includeToJson: false)
  final DateTime? createdAt;
  @override
  @JsonKey(name: Strings.updatedAt$, includeToJson: false)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'TxnCategory(name: $name, type: $type, id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TxnCategoryImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, type, id, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TxnCategoryImplCopyWith<_$TxnCategoryImpl> get copyWith =>
      __$$TxnCategoryImplCopyWithImpl<_$TxnCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TxnCategoryImplToJson(
      this,
    );
  }
}

abstract class _TxnCategory implements TxnCategory {
  const factory _TxnCategory(
      {required final String name,
      required final TransactionType type,
      @JsonKey(name: Strings.id$, includeToJson: false) final String? id,
      @JsonKey(name: Strings.createdAt$, includeToJson: false)
      final DateTime? createdAt,
      @JsonKey(name: Strings.updatedAt$, includeToJson: false)
      final DateTime? updatedAt}) = _$TxnCategoryImpl;

  factory _TxnCategory.fromJson(Map<String, dynamic> json) =
      _$TxnCategoryImpl.fromJson;

  @override
  String get name;
  @override
  TransactionType get type;
  @override
  @JsonKey(name: Strings.id$, includeToJson: false)
  String? get id;
  @override
  @JsonKey(name: Strings.createdAt$, includeToJson: false)
  DateTime? get createdAt;
  @override
  @JsonKey(name: Strings.updatedAt$, includeToJson: false)
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$TxnCategoryImplCopyWith<_$TxnCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
