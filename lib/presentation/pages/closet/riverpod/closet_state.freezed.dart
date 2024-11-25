// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'closet_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ClosetState {
  Status get status => throw _privateConstructorUsedError;
  List<MyClothes> get clothes => throw _privateConstructorUsedError;
  List<String> get selectedClothesIds => throw _privateConstructorUsedError;
  ErrorResponse get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClosetStateCopyWith<ClosetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClosetStateCopyWith<$Res> {
  factory $ClosetStateCopyWith(
          ClosetState value, $Res Function(ClosetState) then) =
      _$ClosetStateCopyWithImpl<$Res, ClosetState>;
  @useResult
  $Res call(
      {Status status,
      List<MyClothes> clothes,
      List<String> selectedClothesIds,
      ErrorResponse error});
}

/// @nodoc
class _$ClosetStateCopyWithImpl<$Res, $Val extends ClosetState>
    implements $ClosetStateCopyWith<$Res> {
  _$ClosetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? clothes = null,
    Object? selectedClothesIds = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      clothes: null == clothes
          ? _value.clothes
          : clothes // ignore: cast_nullable_to_non_nullable
              as List<MyClothes>,
      selectedClothesIds: null == selectedClothesIds
          ? _value.selectedClothesIds
          : selectedClothesIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorResponse,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClosetStateImplCopyWith<$Res>
    implements $ClosetStateCopyWith<$Res> {
  factory _$$ClosetStateImplCopyWith(
          _$ClosetStateImpl value, $Res Function(_$ClosetStateImpl) then) =
      __$$ClosetStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      List<MyClothes> clothes,
      List<String> selectedClothesIds,
      ErrorResponse error});
}

/// @nodoc
class __$$ClosetStateImplCopyWithImpl<$Res>
    extends _$ClosetStateCopyWithImpl<$Res, _$ClosetStateImpl>
    implements _$$ClosetStateImplCopyWith<$Res> {
  __$$ClosetStateImplCopyWithImpl(
      _$ClosetStateImpl _value, $Res Function(_$ClosetStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? clothes = null,
    Object? selectedClothesIds = null,
    Object? error = null,
  }) {
    return _then(_$ClosetStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      clothes: null == clothes
          ? _value._clothes
          : clothes // ignore: cast_nullable_to_non_nullable
              as List<MyClothes>,
      selectedClothesIds: null == selectedClothesIds
          ? _value._selectedClothesIds
          : selectedClothesIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorResponse,
    ));
  }
}

/// @nodoc

class _$ClosetStateImpl implements _ClosetState {
  const _$ClosetStateImpl(
      {this.status = Status.initial,
      final List<MyClothes> clothes = const <MyClothes>[],
      final List<String> selectedClothesIds = const <String>[],
      this.error = const ErrorResponse()})
      : _clothes = clothes,
        _selectedClothesIds = selectedClothesIds;

  @override
  @JsonKey()
  final Status status;
  final List<MyClothes> _clothes;
  @override
  @JsonKey()
  List<MyClothes> get clothes {
    if (_clothes is EqualUnmodifiableListView) return _clothes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clothes);
  }

  final List<String> _selectedClothesIds;
  @override
  @JsonKey()
  List<String> get selectedClothesIds {
    if (_selectedClothesIds is EqualUnmodifiableListView)
      return _selectedClothesIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedClothesIds);
  }

  @override
  @JsonKey()
  final ErrorResponse error;

  @override
  String toString() {
    return 'ClosetState(status: $status, clothes: $clothes, selectedClothesIds: $selectedClothesIds, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosetStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._clothes, _clothes) &&
            const DeepCollectionEquality()
                .equals(other._selectedClothesIds, _selectedClothesIds) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_clothes),
      const DeepCollectionEquality().hash(_selectedClothesIds),
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClosetStateImplCopyWith<_$ClosetStateImpl> get copyWith =>
      __$$ClosetStateImplCopyWithImpl<_$ClosetStateImpl>(this, _$identity);
}

abstract class _ClosetState implements ClosetState {
  const factory _ClosetState(
      {final Status status,
      final List<MyClothes> clothes,
      final List<String> selectedClothesIds,
      final ErrorResponse error}) = _$ClosetStateImpl;

  @override
  Status get status;
  @override
  List<MyClothes> get clothes;
  @override
  List<String> get selectedClothesIds;
  @override
  ErrorResponse get error;
  @override
  @JsonKey(ignore: true)
  _$$ClosetStateImplCopyWith<_$ClosetStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
