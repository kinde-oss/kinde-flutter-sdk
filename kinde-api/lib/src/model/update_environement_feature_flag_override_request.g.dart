// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_environement_feature_flag_override_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateEnvironementFeatureFlagOverrideRequest
    extends UpdateEnvironementFeatureFlagOverrideRequest {
  @override
  final String value;

  factory _$UpdateEnvironementFeatureFlagOverrideRequest(
          [void Function(UpdateEnvironementFeatureFlagOverrideRequestBuilder)?
              updates]) =>
      (new UpdateEnvironementFeatureFlagOverrideRequestBuilder()
            ..update(updates))
          ._build();

  _$UpdateEnvironementFeatureFlagOverrideRequest._({required this.value})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        value, r'UpdateEnvironementFeatureFlagOverrideRequest', 'value');
  }

  @override
  UpdateEnvironementFeatureFlagOverrideRequest rebuild(
          void Function(UpdateEnvironementFeatureFlagOverrideRequestBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateEnvironementFeatureFlagOverrideRequestBuilder toBuilder() =>
      new UpdateEnvironementFeatureFlagOverrideRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateEnvironementFeatureFlagOverrideRequest &&
        value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'UpdateEnvironementFeatureFlagOverrideRequest')
          ..add('value', value))
        .toString();
  }
}

class UpdateEnvironementFeatureFlagOverrideRequestBuilder
    implements
        Builder<UpdateEnvironementFeatureFlagOverrideRequest,
            UpdateEnvironementFeatureFlagOverrideRequestBuilder> {
  _$UpdateEnvironementFeatureFlagOverrideRequest? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  UpdateEnvironementFeatureFlagOverrideRequestBuilder() {
    UpdateEnvironementFeatureFlagOverrideRequest._defaults(this);
  }

  UpdateEnvironementFeatureFlagOverrideRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateEnvironementFeatureFlagOverrideRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateEnvironementFeatureFlagOverrideRequest;
  }

  @override
  void update(
      void Function(UpdateEnvironementFeatureFlagOverrideRequestBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateEnvironementFeatureFlagOverrideRequest build() => _build();

  _$UpdateEnvironementFeatureFlagOverrideRequest _build() {
    final _$result = _$v ??
        new _$UpdateEnvironementFeatureFlagOverrideRequest._(
            value: BuiltValueNullFieldError.checkNotNull(value,
                r'UpdateEnvironementFeatureFlagOverrideRequest', 'value'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
