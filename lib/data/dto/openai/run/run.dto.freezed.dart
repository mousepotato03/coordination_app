// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'run.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RunRequest _$RunRequestFromJson(Map<String, dynamic> json) {
  return _RunRequest.fromJson(json);
}

/// @nodoc
mixin _$RunRequest {
  String get assistant_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RunRequestCopyWith<RunRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RunRequestCopyWith<$Res> {
  factory $RunRequestCopyWith(
          RunRequest value, $Res Function(RunRequest) then) =
      _$RunRequestCopyWithImpl<$Res, RunRequest>;
  @useResult
  $Res call({String assistant_id});
}

/// @nodoc
class _$RunRequestCopyWithImpl<$Res, $Val extends RunRequest>
    implements $RunRequestCopyWith<$Res> {
  _$RunRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assistant_id = null,
  }) {
    return _then(_value.copyWith(
      assistant_id: null == assistant_id
          ? _value.assistant_id
          : assistant_id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RunRequestImplCopyWith<$Res>
    implements $RunRequestCopyWith<$Res> {
  factory _$$RunRequestImplCopyWith(
          _$RunRequestImpl value, $Res Function(_$RunRequestImpl) then) =
      __$$RunRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String assistant_id});
}

/// @nodoc
class __$$RunRequestImplCopyWithImpl<$Res>
    extends _$RunRequestCopyWithImpl<$Res, _$RunRequestImpl>
    implements _$$RunRequestImplCopyWith<$Res> {
  __$$RunRequestImplCopyWithImpl(
      _$RunRequestImpl _value, $Res Function(_$RunRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assistant_id = null,
  }) {
    return _then(_$RunRequestImpl(
      assistant_id: null == assistant_id
          ? _value.assistant_id
          : assistant_id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RunRequestImpl implements _RunRequest {
  const _$RunRequestImpl({required this.assistant_id});

  factory _$RunRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RunRequestImplFromJson(json);

  @override
  final String assistant_id;

  @override
  String toString() {
    return 'RunRequest(assistant_id: $assistant_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunRequestImpl &&
            (identical(other.assistant_id, assistant_id) ||
                other.assistant_id == assistant_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, assistant_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RunRequestImplCopyWith<_$RunRequestImpl> get copyWith =>
      __$$RunRequestImplCopyWithImpl<_$RunRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RunRequestImplToJson(
      this,
    );
  }
}

abstract class _RunRequest implements RunRequest {
  const factory _RunRequest({required final String assistant_id}) =
      _$RunRequestImpl;

  factory _RunRequest.fromJson(Map<String, dynamic> json) =
      _$RunRequestImpl.fromJson;

  @override
  String get assistant_id;
  @override
  @JsonKey(ignore: true)
  _$$RunRequestImplCopyWith<_$RunRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RunResponse _$RunResponseFromJson(Map<String, dynamic> json) {
  return _RunResponse.fromJson(json);
}

/// @nodoc
mixin _$RunResponse {
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RunResponseCopyWith<RunResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RunResponseCopyWith<$Res> {
  factory $RunResponseCopyWith(
          RunResponse value, $Res Function(RunResponse) then) =
      _$RunResponseCopyWithImpl<$Res, RunResponse>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$RunResponseCopyWithImpl<$Res, $Val extends RunResponse>
    implements $RunResponseCopyWith<$Res> {
  _$RunResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$RunResponseImplCopyWith<$Res>
    implements $RunResponseCopyWith<$Res> {
  factory _$$RunResponseImplCopyWith(
          _$RunResponseImpl value, $Res Function(_$RunResponseImpl) then) =
      __$$RunResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$RunResponseImplCopyWithImpl<$Res>
    extends _$RunResponseCopyWithImpl<$Res, _$RunResponseImpl>
    implements _$$RunResponseImplCopyWith<$Res> {
  __$$RunResponseImplCopyWithImpl(
      _$RunResponseImpl _value, $Res Function(_$RunResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RunResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RunResponseImpl implements _RunResponse {
  const _$RunResponseImpl({required this.id});

  factory _$RunResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RunResponseImplFromJson(json);

  @override
  final String id;

  @override
  String toString() {
    return 'RunResponse(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunResponseImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RunResponseImplCopyWith<_$RunResponseImpl> get copyWith =>
      __$$RunResponseImplCopyWithImpl<_$RunResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RunResponseImplToJson(
      this,
    );
  }
}

abstract class _RunResponse implements RunResponse {
  const factory _RunResponse({required final String id}) = _$RunResponseImpl;

  factory _RunResponse.fromJson(Map<String, dynamic> json) =
      _$RunResponseImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$RunResponseImplCopyWith<_$RunResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RunStatusResponse _$RunStatusResponseFromJson(Map<String, dynamic> json) {
  return _RunStatusResponse.fromJson(json);
}

/// @nodoc
mixin _$RunStatusResponse {
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RunStatusResponseCopyWith<RunStatusResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RunStatusResponseCopyWith<$Res> {
  factory $RunStatusResponseCopyWith(
          RunStatusResponse value, $Res Function(RunStatusResponse) then) =
      _$RunStatusResponseCopyWithImpl<$Res, RunStatusResponse>;
  @useResult
  $Res call({String status});
}

/// @nodoc
class _$RunStatusResponseCopyWithImpl<$Res, $Val extends RunStatusResponse>
    implements $RunStatusResponseCopyWith<$Res> {
  _$RunStatusResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RunStatusResponseImplCopyWith<$Res>
    implements $RunStatusResponseCopyWith<$Res> {
  factory _$$RunStatusResponseImplCopyWith(_$RunStatusResponseImpl value,
          $Res Function(_$RunStatusResponseImpl) then) =
      __$$RunStatusResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status});
}

/// @nodoc
class __$$RunStatusResponseImplCopyWithImpl<$Res>
    extends _$RunStatusResponseCopyWithImpl<$Res, _$RunStatusResponseImpl>
    implements _$$RunStatusResponseImplCopyWith<$Res> {
  __$$RunStatusResponseImplCopyWithImpl(_$RunStatusResponseImpl _value,
      $Res Function(_$RunStatusResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$RunStatusResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RunStatusResponseImpl implements _RunStatusResponse {
  const _$RunStatusResponseImpl({required this.status});

  factory _$RunStatusResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RunStatusResponseImplFromJson(json);

  @override
  final String status;

  @override
  String toString() {
    return 'RunStatusResponse(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunStatusResponseImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RunStatusResponseImplCopyWith<_$RunStatusResponseImpl> get copyWith =>
      __$$RunStatusResponseImplCopyWithImpl<_$RunStatusResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RunStatusResponseImplToJson(
      this,
    );
  }
}

abstract class _RunStatusResponse implements RunStatusResponse {
  const factory _RunStatusResponse({required final String status}) =
      _$RunStatusResponseImpl;

  factory _RunStatusResponse.fromJson(Map<String, dynamic> json) =
      _$RunStatusResponseImpl.fromJson;

  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$RunStatusResponseImplCopyWith<_$RunStatusResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
