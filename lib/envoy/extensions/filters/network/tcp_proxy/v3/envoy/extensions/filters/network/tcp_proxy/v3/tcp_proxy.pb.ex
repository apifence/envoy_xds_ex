defmodule Envoy.Extensions.Filters.Network.TcpProxy.V3.UpstreamConnectMode do
  @moduledoc """
  Specifies when the TCP proxy establishes the upstream connection.
  [#protodoc-title: TCP Proxy]
  TCP Proxy :ref:`configuration overview <config_network_filters_tcp_proxy>`.
  [#extension: envoy.filters.network.tcp_proxy]
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.filters.network.tcp_proxy.v3.UpstreamConnectMode",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :IMMEDIATE, 0
  field :ON_DOWNSTREAM_DATA, 1
  field :ON_DOWNSTREAM_TLS_HANDSHAKE, 2
end

defmodule Envoy.Extensions.Filters.Network.TcpProxy.V3.ProxyProtocolTlvMergePolicy do
  @moduledoc """
  Specifies how TLVs in ``proxy_protocol_tlvs`` are merged with existing PROXY protocol state
  (e.g., downstream TLVs parsed by the proxy_protocol listener filter).
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.filters.network.tcp_proxy.v3.ProxyProtocolTlvMergePolicy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :ADD_IF_ABSENT, 0
  field :OVERWRITE_BY_TYPE_IF_EXISTS_OR_ADD, 1
  field :APPEND_IF_EXISTS_OR_ADD, 2
end

defmodule Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.WeightedCluster.ClusterWeight do
  use Protobuf,
    full_name:
      "envoy.extensions.filters.network.tcp_proxy.v3.TcpProxy.WeightedCluster.ClusterWeight",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :weight, 2, type: :uint32, deprecated: false
  field :metadata_match, 3, type: Envoy.Config.Core.V3.Metadata, json_name: "metadataMatch"
end

defmodule Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.WeightedCluster do
  @moduledoc """
  Allows specification of multiple upstream clusters along with weights indicating the percentage of
  traffic forwarded to each cluster. The cluster selection is based on these weights.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.network.tcp_proxy.v3.TcpProxy.WeightedCluster",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :clusters, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.WeightedCluster.ClusterWeight,
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.TunnelingConfig do
  @moduledoc """
  Configuration for tunneling TCP over other transports or application layers.
  Tunneling is supported over HTTP/1.1 and HTTP/2. The upstream protocol is
  determined by the cluster configuration.
  [#next-free-field: 11]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.network.tcp_proxy.v3.TcpProxy.TunnelingConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :hostname, 1, type: :string, deprecated: false
  field :use_post, 2, type: :bool, json_name: "usePost"

  field :headers_to_add, 3,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "headersToAdd",
    deprecated: false

  field :propagate_response_headers, 4, type: :bool, json_name: "propagateResponseHeaders"
  field :post_path, 5, type: :string, json_name: "postPath"
  field :propagate_response_trailers, 6, type: :bool, json_name: "propagateResponseTrailers"

  field :request_id_extension, 7,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.RequestIDExtension,
    json_name: "requestIdExtension"

  field :request_id_header, 8, type: :string, json_name: "requestIdHeader"
  field :request_id_metadata_key, 9, type: :string, json_name: "requestIdMetadataKey"
  field :formatters, 10, repeated: true, type: Envoy.Config.Core.V3.TypedExtensionConfig
end

defmodule Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.OnDemand do
  use Protobuf,
    full_name: "envoy.extensions.filters.network.tcp_proxy.v3.TcpProxy.OnDemand",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :odcds_config, 1, type: Envoy.Config.Core.V3.ConfigSource, json_name: "odcdsConfig"
  field :resources_locator, 2, type: :string, json_name: "resourcesLocator"
  field :timeout, 3, type: Google.Protobuf.Duration
end

defmodule Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.TcpAccessLogOptions do
  use Protobuf,
    full_name: "envoy.extensions.filters.network.tcp_proxy.v3.TcpProxy.TcpAccessLogOptions",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :access_log_flush_interval, 1,
    type: Google.Protobuf.Duration,
    json_name: "accessLogFlushInterval",
    deprecated: false

  field :flush_access_log_on_connected, 2, type: :bool, json_name: "flushAccessLogOnConnected"
  field :flush_access_log_on_start, 3, type: :bool, json_name: "flushAccessLogOnStart"
end

defmodule Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy do
  @moduledoc """
  [#next-free-field: 25]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.network.tcp_proxy.v3.TcpProxy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :cluster_specifier, 0

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :cluster, 2, type: :string, oneof: 0

  field :weighted_clusters, 10,
    type: Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.WeightedCluster,
    json_name: "weightedClusters",
    oneof: 0

  field :on_demand, 14,
    type: Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.OnDemand,
    json_name: "onDemand"

  field :metadata_match, 9, type: Envoy.Config.Core.V3.Metadata, json_name: "metadataMatch"
  field :idle_timeout, 8, type: Google.Protobuf.Duration, json_name: "idleTimeout"

  field :downstream_idle_timeout, 3,
    type: Google.Protobuf.Duration,
    json_name: "downstreamIdleTimeout"

  field :upstream_idle_timeout, 4,
    type: Google.Protobuf.Duration,
    json_name: "upstreamIdleTimeout"

  field :access_log, 5,
    repeated: true,
    type: Envoy.Config.Accesslog.V3.AccessLog,
    json_name: "accessLog"

  field :max_connect_attempts, 7,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxConnectAttempts",
    deprecated: false

  field :backoff_options, 18,
    type: Envoy.Config.Core.V3.BackoffStrategy,
    json_name: "backoffOptions"

  field :hash_policy, 11,
    repeated: true,
    type: Envoy.Type.V3.HashPolicy,
    json_name: "hashPolicy",
    deprecated: false

  field :tunneling_config, 12,
    type: Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.TunnelingConfig,
    json_name: "tunnelingConfig"

  field :max_downstream_connection_duration, 13,
    type: Google.Protobuf.Duration,
    json_name: "maxDownstreamConnectionDuration",
    deprecated: false

  field :max_downstream_connection_duration_jitter_percentage, 20,
    type: Envoy.Type.V3.Percent,
    json_name: "maxDownstreamConnectionDurationJitterPercentage"

  field :access_log_flush_interval, 15,
    type: Google.Protobuf.Duration,
    json_name: "accessLogFlushInterval",
    deprecated: true

  field :flush_access_log_on_connected, 16,
    type: :bool,
    json_name: "flushAccessLogOnConnected",
    deprecated: true

  field :access_log_options, 17,
    type: Envoy.Extensions.Filters.Network.TcpProxy.V3.TcpProxy.TcpAccessLogOptions,
    json_name: "accessLogOptions"

  field :proxy_protocol_tlvs, 19,
    repeated: true,
    type: Envoy.Config.Core.V3.TlvEntry,
    json_name: "proxyProtocolTlvs"

  field :proxy_protocol_tlv_merge_policy, 23,
    type: Envoy.Extensions.Filters.Network.TcpProxy.V3.ProxyProtocolTlvMergePolicy,
    json_name: "proxyProtocolTlvMergePolicy",
    enum: true,
    deprecated: false

  field :upstream_connect_mode, 21,
    type: Envoy.Extensions.Filters.Network.TcpProxy.V3.UpstreamConnectMode,
    json_name: "upstreamConnectMode",
    enum: true,
    deprecated: false

  field :max_early_data_bytes, 22,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxEarlyDataBytes",
    deprecated: false

  field :check_drain_close, 24, type: Google.Protobuf.BoolValue, json_name: "checkDrainClose"
end
