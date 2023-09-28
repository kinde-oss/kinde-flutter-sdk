// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_api_applications_request_applications_inner.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateAPIApplicationsRequestApplicationsInner
    extends UpdateAPIApplicationsRequestApplicationsInner {
  @override
  final String id;
  @override
  final String? operation;

  factory _$UpdateAPIApplicationsRequestApplicationsInner(
          [void Function(UpdateAPIApplicationsRequestApplicationsInnerBuilder)?
              updates]) =>
      (new UpdateAPIApplicationsRequestApplicationsInnerBuilder()
            ..update(updates))
          ._build();

  _$UpdateAPIApplicationsRequestApplicationsInner._(
      {required this.id, this.operation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        id, r'UpdateAPIApplicationsRequestApplicationsInner', 'id');
  }

  @override
  UpdateAPIApplicationsRequestApplicationsInner rebuild(
          void Function(UpdateAPIApplicationsRequestApplicationsInnerBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateAPIApplicationsRequestApplicationsInnerBuilder toBuilder() =>
      new UpdateAPIApplicationsRequestApplicationsInnerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateAPIApplicationsRequestApplicationsInner &&
        id == other.id &&
        operation == other.operation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, operation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'UpdateAPIApplicationsRequestApplicationsInner')
          ..add('id', id)
          ..add('operation', operation))
        .toString();
  }
}

class UpdateAPIApplicationsRequestApplicationsInnerBuilder
    implements
        Builder<UpdateAPIApplicationsRequestApplicationsInner,
            UpdateAPIApplicationsRequestApplicationsInnerBuilder> {
  _$UpdateAPIApplicationsRequestApplicationsInner? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _operation;
  String? get operation => _$this._operation;
  set operation(String? operation) => _$this._operation = operation;

  UpdateAPIApplicationsRequestApplicationsInnerBuilder() {
    UpdateAPIApplicationsRequestApplicationsInner._defaults(this);
  }

  UpdateAPIApplicationsRequestApplicationsInnerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateAPIApplicationsRequestApplicationsInner other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateAPIApplicationsRequestApplicationsInner;
  }

  @override
  void update(
      void Function(UpdateAPIApplicationsRequestApplicationsInnerBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateAPIApplicationsRequestApplicationsInner build() => _build();

  _$UpdateAPIApplicationsRequestApplicationsInner _build() {
    final _$result = _$v ??
        new _$UpdateAPIApplicationsRequestApplicationsInner._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'UpdateAPIApplicationsRequestApplicationsInner', 'id'),
            operation: operation);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
