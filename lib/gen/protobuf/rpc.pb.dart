///
//  Generated code. Do not modify.
//  source: rpc.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'rpc.pbenum.dart';

export 'rpc.pbenum.dart';

class RpcRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RpcRequest',
      createEmptyInstance: create)
    ..e<RpcType>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OE,
        defaultOrMaker: RpcType.RPC_TYPE_IMAGE_PARSER,
        valueOf: RpcType.valueOf,
        enumValues: RpcType.values)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data')
    ..a<$core.List<$core.int>>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'parserData',
        $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  RpcRequest._() : super();
  factory RpcRequest({
    RpcType? type,
    $core.String? data,
    $core.List<$core.int>? parserData,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (data != null) {
      _result.data = data;
    }
    if (parserData != null) {
      _result.parserData = parserData;
    }
    return _result;
  }
  factory RpcRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RpcRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RpcRequest clone() => RpcRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RpcRequest copyWith(void Function(RpcRequest) updates) =>
      super.copyWith((message) => updates(message as RpcRequest))
          as RpcRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RpcRequest create() => RpcRequest._();
  RpcRequest createEmptyInstance() => create();
  static $pb.PbList<RpcRequest> createRepeated() => $pb.PbList<RpcRequest>();
  @$core.pragma('dart2js:noInline')
  static RpcRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RpcRequest>(create);
  static RpcRequest? _defaultInstance;

  @$pb.TagNumber(1)
  RpcType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(RpcType v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get data => $_getSZ(1);
  @$pb.TagNumber(2)
  set data($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get parserData => $_getN(2);
  @$pb.TagNumber(3)
  set parserData($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasParserData() => $_has(2);
  @$pb.TagNumber(3)
  void clearParserData() => clearField(3);
}
