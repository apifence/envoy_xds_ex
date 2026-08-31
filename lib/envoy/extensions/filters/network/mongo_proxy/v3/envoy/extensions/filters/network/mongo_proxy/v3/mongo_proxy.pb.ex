defmodule Envoy.Extensions.Filters.Network.MongoProxy.V3.MongoProxy do
  @moduledoc """
  [#next-free-field: 7]
  [#protodoc-title: Mongo proxy]
  MongoDB :ref:`configuration overview <config_network_filters_mongo_proxy>`.
  [#extension: envoy.filters.network.mongo_proxy]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.network.mongo_proxy.v3.MongoProxy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :access_log, 2, type: :string, json_name: "accessLog"
  field :delay, 3, type: Envoy.Extensions.Filters.Common.Fault.V3.FaultDelay
  field :emit_dynamic_metadata, 4, type: :bool, json_name: "emitDynamicMetadata"
  field :commands, 5, repeated: true, type: :string

  field :max_bson_depth, 6,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxBsonDepth",
    deprecated: false
end
