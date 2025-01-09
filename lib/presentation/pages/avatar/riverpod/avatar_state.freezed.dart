// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'avatar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AvatarState {
  Status get status => throw _privateConstructorUsedError;
  String get bodyInfo => throw _privateConstructorUsedError;
  String get clothesInfo => throw _privateConstructorUsedError;
  bool get needsRefresh => throw _privateConstructorUsedError;
  ErrorResponse get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AvatarStateCopyWith<AvatarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvatarStateCopyWith<$Res> {
  factory $AvatarStateCopyWith(
          AvatarState value, $Res Function(AvatarState) then) =
      _$AvatarStateCopyWithImpl<$Res, AvatarState>;
  @useResult
  $Res call(
      {Status status,
      String bodyInfo,
      String clothesInfo,
      bool needsRefresh,
      ErrorResponse error});
}

/// @nodoc
class _$AvatarStateCopyWithImpl<$Res, $Val extends AvatarState>
    implements $AvatarStateCopyWith<$Res> {
  _$AvatarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? bodyInfo = null,
    Object? clothesInfo = null,
    Object? needsRefresh = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      bodyInfo: null == bodyInfo
          ? _value.bodyInfo
          : bodyInfo // ignore: cast_nullable_to_non_nullable
              as String,
      clothesInfo: null == clothesInfo
          ? _value.clothesInfo
          : clothesInfo // ignore: cast_nullable_to_non_nullable
              as String,
      needsRefresh: null == needsRefresh
          ? _value.needsRefresh
          : needsRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorResponse,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvatarStateImplCopyWith<$Res>
    implements $AvatarStateCopyWith<$Res> {
  factory _$$AvatarStateImplCopyWith(
          _$AvatarStateImpl value, $Res Function(_$AvatarStateImpl) then) =
      __$$AvatarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      String bodyInfo,
      String clothesInfo,
      bool needsRefresh,
      ErrorResponse error});
}

/// @nodoc
class __$$AvatarStateImplCopyWithImpl<$Res>
    extends _$AvatarStateCopyWithImpl<$Res, _$AvatarStateImpl>
    implements _$$AvatarStateImplCopyWith<$Res> {
  __$$AvatarStateImplCopyWithImpl(
      _$AvatarStateImpl _value, $Res Function(_$AvatarStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? bodyInfo = null,
    Object? clothesInfo = null,
    Object? needsRefresh = null,
    Object? error = null,
  }) {
    return _then(_$AvatarStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      bodyInfo: null == bodyInfo
          ? _value.bodyInfo
          : bodyInfo // ignore: cast_nullable_to_non_nullable
              as String,
      clothesInfo: null == clothesInfo
          ? _value.clothesInfo
          : clothesInfo // ignore: cast_nullable_to_non_nullable
              as String,
      needsRefresh: null == needsRefresh
          ? _value.needsRefresh
          : needsRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorResponse,
    ));
  }
}

/// @nodoc

class _$AvatarStateImpl implements _AvatarState {
  const _$AvatarStateImpl(
      {this.status = Status.initial,
      this.bodyInfo = "",
      this.clothesInfo = "",
      this.needsRefresh = false,
      this.error = const ErrorResponse()});

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final String bodyInfo;
  @override
  @JsonKey()
  final String clothesInfo;
  @override
  @JsonKey()
  final bool needsRefresh;
  @override
  @JsonKey()
  final ErrorResponse error;

  @override
  String toString() {
    return 'AvatarState(status: $status, bodyInfo: $bodyInfo, clothesInfo: $clothesInfo, needsRefresh: $needsRefresh, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvatarStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.bodyInfo, bodyInfo) ||
                other.bodyInfo == bodyInfo) &&
            (identical(other.clothesInfo, clothesInfo) ||
                other.clothesInfo == clothesInfo) &&
            (identical(other.needsRefresh, needsRefresh) ||
                other.needsRefresh == needsRefresh) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, bodyInfo, clothesInfo, needsRefresh, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AvatarStateImplCopyWith<_$AvatarStateImpl> get copyWith =>
      __$$AvatarStateImplCopyWithImpl<_$AvatarStateImpl>(this, _$identity);
}

abstract class _AvatarState implements AvatarState {
  const factory _AvatarState(
      {final Status status,
      final String bodyInfo,
      final String clothesInfo,
      final bool needsRefresh,
      final ErrorResponse error}) = _$AvatarStateImpl;

  @override
  Status get status;
  @override
  String get bodyInfo;
  @override
  String get clothesInfo;
  @override
  bool get needsRefresh;
  @override
  ErrorResponse get error;
  @override
  @JsonKey(ignore: true)
  _$$AvatarStateImplCopyWith<_$AvatarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
