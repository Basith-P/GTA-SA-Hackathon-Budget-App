// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  double get amount => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  TxnCategory? get category => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: Strings.id$, includeToJson: false)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: Strings.createdAt$, includeToJson: false)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: Strings.updatedAt$, includeToJson: false)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {double amount,
      DateTime date,
      @JsonKey(includeToJson: false) TxnCategory? category,
      String? note,
      String? categoryId,
      @JsonKey(name: Strings.id$, includeToJson: false) String? id,
      @JsonKey(name: Strings.createdAt$, includeToJson: false)
      DateTime? createdAt,
      @JsonKey(name: Strings.updatedAt$, includeToJson: false)
      DateTime? updatedAt});

  $TxnCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? date = null,
    Object? category = freezed,
    Object? note = freezed,
    Object? categoryId = freezed,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TxnCategory?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
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

  @override
  @pragma('vm:prefer-inline')
  $TxnCategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $TxnCategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$TransactionImplCopyWith(
          _$TransactionImpl value, $Res Function(_$TransactionImpl) then) =
      __$$TransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double amount,
      DateTime date,
      @JsonKey(includeToJson: false) TxnCategory? category,
      String? note,
      String? categoryId,
      @JsonKey(name: Strings.id$, includeToJson: false) String? id,
      @JsonKey(name: Strings.createdAt$, includeToJson: false)
      DateTime? createdAt,
      @JsonKey(name: Strings.updatedAt$, includeToJson: false)
      DateTime? updatedAt});

  @override
  $TxnCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$$TransactionImplCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$TransactionImpl>
    implements _$$TransactionImplCopyWith<$Res> {
  __$$TransactionImplCopyWithImpl(
      _$TransactionImpl _value, $Res Function(_$TransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? date = null,
    Object? category = freezed,
    Object? note = freezed,
    Object? categoryId = freezed,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$TransactionImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TxnCategory?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$TransactionImpl implements _Transaction {
  const _$TransactionImpl(
      {required this.amount,
      required this.date,
      @JsonKey(includeToJson: false) this.category,
      this.note,
      this.categoryId,
      @JsonKey(name: Strings.id$, includeToJson: false) this.id,
      @JsonKey(name: Strings.createdAt$, includeToJson: false) this.createdAt,
      @JsonKey(name: Strings.updatedAt$, includeToJson: false) this.updatedAt});

  factory _$TransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionImplFromJson(json);

  @override
  final double amount;
  @override
  final DateTime date;
  @override
  @JsonKey(includeToJson: false)
  final TxnCategory? category;
  @override
  final String? note;
  @override
  final String? categoryId;
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
    return 'Transaction(amount: $amount, date: $date, category: $category, note: $note, categoryId: $categoryId, id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, date, category, note,
      categoryId, id, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      __$$TransactionImplCopyWithImpl<_$TransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionImplToJson(
      this,
    );
  }
}

abstract class _Transaction implements Transaction {
  const factory _Transaction(
      {required final double amount,
      required final DateTime date,
      @JsonKey(includeToJson: false) final TxnCategory? category,
      final String? note,
      final String? categoryId,
      @JsonKey(name: Strings.id$, includeToJson: false) final String? id,
      @JsonKey(name: Strings.createdAt$, includeToJson: false)
      final DateTime? createdAt,
      @JsonKey(name: Strings.updatedAt$, includeToJson: false)
      final DateTime? updatedAt}) = _$TransactionImpl;

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$TransactionImpl.fromJson;

  @override
  double get amount;
  @override
  DateTime get date;
  @override
  @JsonKey(includeToJson: false)
  TxnCategory? get category;
  @override
  String? get note;
  @override
  String? get categoryId;
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
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
