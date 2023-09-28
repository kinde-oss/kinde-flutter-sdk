// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_api_applications_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateAPIApplicationsRequest extends UpdateAPIApplicationsRequest {
  @override
  final BuiltList<UpdateAPIApplicationsRequestApplicationsInner> applications;

  factory _$UpdateAPIApplicationsRequest(
          [void Function(UpdateAPIApplicationsRequestBuilder)? updates]) =>
      (new UpdateAPIApplicationsRequestBuilder()..update(updates))._build();

  _$UpdateAPIApplicationsRequest._({required this.applications}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        applications, r'UpdateAPIApplicationsRequest', 'applications');
  }

  @override
  UpdateAPIApplicationsRequest rebuild(
          void Function(UpdateAPIApplicationsRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateAPIApplicationsRequestBuilder toBuilder() =>
      new UpdateAPIApplicationsRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateAPIApplicationsRequest &&
        applications == other.applications;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, applications.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateAPIApplicationsRequest')
          ..add('applications', applications))
        .toString();
  }
}

class UpdateAPIApplicationsRequestBuilder
    implements
        Builder<UpdateAPIApplicationsRequest,
            UpdateAPIApplicationsRequestBuilder> {
  _$UpdateAPIApplicationsRequest? _$v;

  ListBuilder<UpdateAPIApplicationsRequestApplicationsInner>? _applications;
  ListBuilder<UpdateAPIApplicationsRequestApplicationsInner> get applications =>
      _$this._applications ??=
          new ListBuilder<UpdateAPIApplicationsRequestApplicationsInner>();
  set applications(
          ListBuilder<UpdateAPIApplicationsRequestApplicationsInner>?
              applications) =>
      _$this._applications = applications;

  UpdateAPIApplicationsRequestBuilder() {
    UpdateAPIApplicationsRequest._defaults(this);
  }

  UpdateAPIApplicationsRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _applications = $v.applications.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateAPIApplicationsRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateAPIApplicationsRequest;
  }

  @override
  void update(void Function(UpdateAPIApplicationsRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateAPIApplicationsRequest build() => _build();

  _$UpdateAPIApplicationsRequest _build() {
    _$UpdateAPIApplicationsRequest _$result;
    try {
      _$result = _$v ??
          new _$UpdateAPIApplicationsRequest._(
              applications: applications.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'applications';
        applications.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateAPIApplicationsRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
