// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thread.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ThreadResponse _$ThreadResponseFromJson(Map<String, dynamic> json) {
  return _ThreadResponse.fromJson(json);
}

/// @nodoc
mixin _$ThreadResponse {
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThreadResponseCopyWith<ThreadResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadResponseCopyWith<$Res> {
  factory $ThreadResponseCopyWith(
          ThreadResponse value, $Res Function(ThreadResponse) then) =
      _$ThreadResponseCopyWithImpl<$Res, ThreadResponse>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$ThreadResponseCopyWithImpl<$Res, $Val extends ThreadResponse>
    implements $ThreadResponseCopyWith<$Res> {
  _$ThreadResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThreadResponseImplCopyWith<$Res>
    implements $ThreadResponseCopyWith<$Res> {
  factory _$$ThreadResponseImplCopyWith(_$ThreadResponseImpl value,
          $Res Function(_$ThreadResponseImpl) then) =
      __$$ThreadResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$ThreadResponseImplCopyWithImpl<$Res>
    extends _$ThreadResponseCopyWithImpl<$Res, _$ThreadResponseImpl>
    implements _$$ThreadResponseImplCopyWith<$Res> {
  __$$ThreadResponseImplCopyWithImpl(
      _$ThreadResponseImpl _value, $Res Function(_$ThreadResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$ThreadResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThreadResponseImpl implements _ThreadResponse {
  const _$ThreadResponseImpl({required this.id});

  factory _$ThreadResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThreadResponseImplFromJson(json);

  @override
  final String id;

  @override
  String toString() {
    return 'ThreadResponse(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreadResponseImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreadResponseImplCopyWith<_$ThreadResponseImpl> get copyWith =>
      __$$ThreadResponseImplCopyWithImpl<_$ThreadResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThreadResponseImplToJson(
      this,
    );
  }
}

abstract class _ThreadResponse implements ThreadResponse {
  const factory _ThreadResponse({required final String id}) =
      _$ThreadResponseImpl;

  factory _ThreadResponse.fromJson(Map<String, dynamic> json) =
      _$ThreadResponseImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$ThreadResponseImplCopyWith<_$ThreadResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
