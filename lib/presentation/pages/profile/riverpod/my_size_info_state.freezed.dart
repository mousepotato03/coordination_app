// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_size_info_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MySizeInfoState {
  Status get status => throw _privateConstructorUsedError;
  MySizeInfo get mySizeInfo => throw _privateConstructorUsedError;
  ErrorResponse get error => throw _privateConstructorUsedError;
  bool get isEditMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MySizeInfoStateCopyWith<MySizeInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MySizeInfoStateCopyWith<$Res> {
  factory $MySizeInfoStateCopyWith(
          MySizeInfoState value, $Res Function(MySizeInfoState) then) =
      _$MySizeInfoStateCopyWithImpl<$Res, MySizeInfoState>;
  @useResult
  $Res call(
      {Status status,
      MySizeInfo mySizeInfo,
      ErrorResponse error,
      bool isEditMode});

  $MySizeInfoCopyWith<$Res> get mySizeInfo;
}

/// @nodoc
class _$MySizeInfoStateCopyWithImpl<$Res, $Val extends MySizeInfoState>
    implements $MySizeInfoStateCopyWith<$Res> {
  _$MySizeInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? mySizeInfo = null,
    Object? error = null,
    Object? isEditMode = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      mySizeInfo: null == mySizeInfo
          ? _value.mySizeInfo
          : mySizeInfo // ignore: cast_nullable_to_non_nullable
              as MySizeInfo,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorResponse,
      isEditMode: null == isEditMode
          ? _value.isEditMode
          : isEditMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MySizeInfoCopyWith<$Res> get mySizeInfo {
    return $MySizeInfoCopyWith<$Res>(_value.mySizeInfo, (value) {
      return _then(_value.copyWith(mySizeInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MySizeInfoStateImplCopyWith<$Res>
    implements $MySizeInfoStateCopyWith<$Res> {
  factory _$$MySizeInfoStateImplCopyWith(_$MySizeInfoStateImpl value,
          $Res Function(_$MySizeInfoStateImpl) then) =
      __$$MySizeInfoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      MySizeInfo mySizeInfo,
      ErrorResponse error,
      bool isEditMode});

  @override
  $MySizeInfoCopyWith<$Res> get mySizeInfo;
}

/// @nodoc
class __$$MySizeInfoStateImplCopyWithImpl<$Res>
    extends _$MySizeInfoStateCopyWithImpl<$Res, _$MySizeInfoStateImpl>
    implements _$$MySizeInfoStateImplCopyWith<$Res> {
  __$$MySizeInfoStateImplCopyWithImpl(
      _$MySizeInfoStateImpl _value, $Res Function(_$MySizeInfoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? mySizeInfo = null,
    Object? error = null,
    Object? isEditMode = null,
  }) {
    return _then(_$MySizeInfoStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      mySizeInfo: null == mySizeInfo
          ? _value.mySizeInfo
          : mySizeInfo // ignore: cast_nullable_to_non_nullable
              as MySizeInfo,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorResponse,
      isEditMode: null == isEditMode
          ? _value.isEditMode
          : isEditMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MySizeInfoStateImpl implements _MySizeInfoState {
  _$MySizeInfoStateImpl(
      {this.status = Status.initial,
      this.mySizeInfo = const MySizeInfo(),
      this.error = const ErrorResponse(),
      this.isEditMode = false});

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final MySizeInfo mySizeInfo;
  @override
  @JsonKey()
  final ErrorResponse error;
  @override
  @JsonKey()
  final bool isEditMode;

  @override
  String toString() {
    return 'MySizeInfoState(status: $status, mySizeInfo: $mySizeInfo, error: $error, isEditMode: $isEditMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MySizeInfoStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.mySizeInfo, mySizeInfo) ||
                other.mySizeInfo == mySizeInfo) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isEditMode, isEditMode) ||
                other.isEditMode == isEditMode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, mySizeInfo, error, isEditMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MySizeInfoStateImplCopyWith<_$MySizeInfoStateImpl> get copyWith =>
      __$$MySizeInfoStateImplCopyWithImpl<_$MySizeInfoStateImpl>(
          this, _$identity);
}

abstract class _MySizeInfoState implements MySizeInfoState {
  factory _MySizeInfoState(
      {final Status status,
      final MySizeInfo mySizeInfo,
      final ErrorResponse error,
      final bool isEditMode}) = _$MySizeInfoStateImpl;

  @override
  Status get status;
  @override
  MySizeInfo get mySizeInfo;
  @override
  ErrorResponse get error;
  @override
  bool get isEditMode;
  @override
  @JsonKey(ignore: true)
  _$$MySizeInfoStateImplCopyWith<_$MySizeInfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
