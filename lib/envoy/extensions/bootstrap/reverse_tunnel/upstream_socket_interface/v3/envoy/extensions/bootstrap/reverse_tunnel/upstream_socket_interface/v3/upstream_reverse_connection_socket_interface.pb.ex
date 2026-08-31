defmodule Envoy.Extensions.Bootstrap.ReverseTunnel.UpstreamSocketInterface.V3.UpstreamReverseConnectionSocketInterface do
  @moduledoc """
  Configuration for the upstream reverse connection socket interface.
  [#next-free-field: 8]
  [#protodoc-title: Upstream reverse connection socket interface]
  [#extension: envoy.bootstrap.reverse_tunnel.upstream_socket_interface]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.bootstrap.reverse_tunnel.upstream_socket_interface.v3.UpstreamReverseConnectionSocketInterface",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :stat_prefix, 1, type: :string, json_name: "statPrefix"

  field :ping_failure_threshold, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "pingFailureThreshold",
    deprecated: false

  field :enable_detailed_stats, 3, type: :bool, json_name: "enableDetailedStats"

  field :reporter_config, 4,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "reporterConfig"

  field :enable_tenant_isolation, 5,
    type: Google.Protobuf.BoolValue,
    json_name: "enableTenantIsolation"

  field :access_log, 6,
    repeated: true,
    type: Envoy.Config.Accesslog.V3.AccessLog,
    json_name: "accessLog"

  field :max_connections_per_node, 7, type: :uint32, json_name: "maxConnectionsPerNode"
end
