defmodule Envoy.Extensions.Filters.Network.TcpBandwidthLimit.V3.TcpBandwidthLimit do
  @moduledoc """
  [#next-free-field: 6]
  [#protodoc-title: TCP Bandwidth Limit]
  TCP Bandwidth Limit :ref:`configuration overview <config_network_filters_tcp_bandwidth_limit>`.
  [#extension: envoy.filters.network.tcp_bandwidth_limit]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.network.tcp_bandwidth_limit.v3.TcpBandwidthLimit",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :read_limit_kbps, 2, type: Google.Protobuf.UInt64Value, json_name: "readLimitKbps"
  field :write_limit_kbps, 3, type: Google.Protobuf.UInt64Value, json_name: "writeLimitKbps"

  field :fill_interval, 4,
    type: Google.Protobuf.Duration,
    json_name: "fillInterval",
    deprecated: false

  field :runtime_enabled, 5,
    type: Envoy.Config.Core.V3.RuntimeFeatureFlag,
    json_name: "runtimeEnabled"
end
