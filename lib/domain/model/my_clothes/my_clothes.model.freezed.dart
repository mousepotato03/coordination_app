// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_clothes.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyClothes _$MyClothesFromJson(Map<String, dynamic> json) {
  return _MyClothes.fromJson(json);
}

/// @nodoc
mixin _$MyClothes {
  String get id => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  ClosetCategory get category => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyClothesCopyWith<MyClothes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyClothesCopyWith<$Res> {
  factory $MyClothesCopyWith(MyClothes value, $Res Function(MyClothes) then) =
      _$MyClothesCopyWithImpl<$Res, MyClothes>;
  @useResult
  $Res call(
      {String id,
      String imagePath,
      ClosetCategory category,
      DateTime createdAt,
      String memo});
}

/// @nodoc
class _$MyClothesCopyWithImpl<$Res, $Val extends MyClothes>
    implements $MyClothesCopyWith<$Res> {
  _$MyClothesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imagePath = null,
    Object? category = null,
    Object? createdAt = null,
    Object? memo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ClosetCategory,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyClothesImplCopyWith<$Res>
    implements $MyClothesCopyWith<$Res> {
  factory _$$MyClothesImplCopyWith(
          _$MyClothesImpl value, $Res Function(_$MyClothesImpl) then) =
      __$$MyClothesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String imagePath,
      ClosetCategory category,
      DateTime createdAt,
      String memo});
}

/// @nodoc
class __$$MyClothesImplCopyWithImpl<$Res>
    extends _$MyClothesCopyWithImpl<$Res, _$MyClothesImpl>
    implements _$$MyClothesImplCopyWith<$Res> {
  __$$MyClothesImplCopyWithImpl(
      _$MyClothesImpl _value, $Res Function(_$MyClothesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imagePath = null,
    Object? category = null,
    Object? createdAt = null,
    Object? memo = null,
  }) {
    return _then(_$MyClothesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ClosetCategory,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyClothesImpl with DiagnosticableTreeMixin implements _MyClothes {
  const _$MyClothesImpl(
      {required this.id,
      required this.imagePath,
      required this.category,
      required this.createdAt,
      this.memo = ''});

  factory _$MyClothesImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyClothesImplFromJson(json);

  @override
  final String id;
  @override
  final String imagePath;
  @override
  final ClosetCategory category;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final String memo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyClothes(id: $id, imagePath: $imagePath, category: $category, createdAt: $createdAt, memo: $memo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyClothes'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('imagePath', imagePath))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('memo', memo));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyClothesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, imagePath, category, createdAt, memo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyClothesImplCopyWith<_$MyClothesImpl> get copyWith =>
      __$$MyClothesImplCopyWithImpl<_$MyClothesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyClothesImplToJson(
      this,
    );
  }
}

abstract class _MyClothes implements MyClothes {
  const factory _MyClothes(
      {required final String id,
      required final String imagePath,
      required final ClosetCategory category,
      required final DateTime createdAt,
      final String memo}) = _$MyClothesImpl;

  factory _MyClothes.fromJson(Map<String, dynamic> json) =
      _$MyClothesImpl.fromJson;

  @override
  String get id;
  @override
  String get imagePath;
  @override
  ClosetCategory get category;
  @override
  DateTime get createdAt;
  @override
  String get memo;
  @override
  @JsonKey(ignore: true)
  _$$MyClothesImplCopyWith<_$MyClothesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
