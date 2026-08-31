defmodule Envoy.Extensions.Bootstrap.ReverseTunnel.DownstreamSocketInterface.V3.DownstreamReverseConnectionSocketInterface.HttpHandshakeConfig do
  @moduledoc """
  HTTP handshake settings for initiator envoy initiated reverse tunnels.
  """

  use Protobuf,
    full_name:
      "envoy.extensions.bootstrap.reverse_tunnel.downstream_socket_interface.v3.DownstreamReverseConnectionSocketInterface.HttpHandshakeConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :request_path, 1, type: :string, json_name: "requestPath"

  field :additional_headers, 2,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "additionalHeaders"

  field :use_http_upgrade, 3, type: :bool, json_name: "useHttpUpgrade"
  field :formatters, 4, repeated: true, type: Envoy.Config.Core.V3.TypedExtensionConfig
end

defmodule Envoy.Extensions.Bootstrap.ReverseTunnel.DownstreamSocketInterface.V3.DownstreamReverseConnectionSocketInterface do
  @moduledoc """
  Configuration for the downstream reverse connection socket interface.
  This interface initiates reverse connections to upstream Envoys and provides
  them as socket connections for downstream requests.
  [#next-free-field: 7]
  [#protodoc-title: Bootstrap settings for downstream reverse connection socket interface]
  [#extension: envoy.bootstrap.reverse_tunnel.downstream_socket_interface]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.bootstrap.reverse_tunnel.downstream_socket_interface.v3.DownstreamReverseConnectionSocketInterface",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :stat_prefix, 1, type: :string, json_name: "statPrefix"
  field :enable_detailed_stats, 2, type: :bool, json_name: "enableDetailedStats"

  field :http_handshake, 3,
    type:
      Envoy.Extensions.Bootstrap.ReverseTunnel.DownstreamSocketInterface.V3.DownstreamReverseConnectionSocketInterface.HttpHandshakeConfig,
    json_name: "httpHandshake"

  field :access_log, 4,
    repeated: true,
    type: Envoy.Config.Accesslog.V3.AccessLog,
    json_name: "accessLog"

  field :max_reconnect_backoff, 5,
    type: Google.Protobuf.Duration,
    json_name: "maxReconnectBackoff",
    deprecated: false

  field :maintain_interval, 6,
    type: Google.Protobuf.Duration,
    json_name: "maintainInterval",
    deprecated: false
end
