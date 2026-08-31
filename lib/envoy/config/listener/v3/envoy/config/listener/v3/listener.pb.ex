defmodule Envoy.Config.Listener.V3.Listener.DrainType do
  use Protobuf,
    enum: true,
    full_name: "envoy.config.listener.v3.Listener.DrainType",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :DEFAULT, 0
  field :MODIFY_ONLY, 1
end

defmodule Envoy.Config.Listener.V3.AdditionalAddress do
  @moduledoc """
  The additional address the listener is listening on.
  [#protodoc-title: Listener configuration]
  Listener :ref:`configuration overview <config_listeners>`
  """

  use Protobuf,
    full_name: "envoy.config.listener.v3.AdditionalAddress",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :address, 1, type: Envoy.Config.Core.V3.Address

  field :socket_options, 2,
    type: Envoy.Config.Core.V3.SocketOptionsOverride,
    json_name: "socketOptions"

  field :tcp_keepalive, 3, type: Envoy.Config.Core.V3.TcpKeepalive, json_name: "tcpKeepalive"
end

defmodule Envoy.Config.Listener.V3.ListenerCollection do
  @moduledoc """
  Listener list collections. Entries are ``Listener`` resources or references.
  [#not-implemented-hide:]
  """

  use Protobuf,
    full_name: "envoy.config.listener.v3.ListenerCollection",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :entries, 1, repeated: true, type: Xds.Core.V3.CollectionEntry
end

defmodule Envoy.Config.Listener.V3.Listener.DeprecatedV1 do
  @moduledoc """
  [#not-implemented-hide:]
  """

  use Protobuf,
    full_name: "envoy.config.listener.v3.Listener.DeprecatedV1",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :bind_to_port, 1, type: Google.Protobuf.BoolValue, json_name: "bindToPort"
end

defmodule Envoy.Config.Listener.V3.Listener.ConnectionBalanceConfig.ExactBalance do
  @moduledoc """
  A connection balancer implementation that does exact balancing. This means that a lock is
  held during balancing so that connection counts are nearly exactly balanced between worker
  threads. This is "nearly" exact in the sense that a connection might close in parallel thus
  making the counts incorrect, but this should be rectified on the next accept. This balancer
  sacrifices accept throughput for accuracy and should be used when there are a small number of
  connections that rarely cycle (e.g., service mesh gRPC egress).
  """

  use Protobuf,
    full_name: "envoy.config.listener.v3.Listener.ConnectionBalanceConfig.ExactBalance",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Config.Listener.V3.Listener.ConnectionBalanceConfig.CpuLocalityBalance do
  @moduledoc """
  A connection balancer that steers each new TCP connection to the worker thread pinned to the
  CPU that received the connection, using a kernel ``SO_REUSEPORT`` BPF program. This removes
  the lock that the :ref:`exact balancer
  <envoy_v3_api_msg_config.listener.v3.Listener.ConnectionBalanceConfig.ExactBalance>` takes on
  every accept and keeps each connection on a single worker for cache and ``NUMA`` locality. To
  realize locality the operator should align ``NIC`` receive steering so connections arrive on
  the worker CPUs, for example with receive side scaling or ``IRQ`` affinity.

  It is available on Linux only and requires :ref:`enable_worker_cpu_affinity
  <envoy_v3_api_field_config.bootstrap.v3.Bootstrap.enable_worker_cpu_affinity>` so worker ``i``
  is pinned to the CPU the program steers to it, :ref:`enable_reuse_port
  <envoy_v3_api_field_config.listener.v3.Listener.enable_reuse_port>`, a kernel that supports
  reuse port BPF steering, and a worker count no greater than the number of CPUs in the process
  affinity mask. When any of these is not met, or if the kernel rejects the steering program at
  runtime, the listener keeps serving with the kernel default reuse port hashing and without CPU
  locality.

  Worker affinity is fixed when the worker threads start, so a listener added dynamically via LDS
  steers with the same mapping. During a hot restart new connections may be steered to the
  draining parent process until it exits.
  """

  use Protobuf,
    full_name: "envoy.config.listener.v3.Listener.ConnectionBalanceConfig.CpuLocalityBalance",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Config.Listener.V3.Listener.ConnectionBalanceConfig do
  @moduledoc """
  Configuration for listener connection balancing.
  """

  use Protobuf,
    full_name: "envoy.config.listener.v3.Listener.ConnectionBalanceConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :balance_type, 0

  field :exact_balance, 1,
    type: Envoy.Config.Listener.V3.Listener.ConnectionBalanceConfig.ExactBalance,
    json_name: "exactBalance",
    oneof: 0

  field :extend_balance, 2,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "extendBalance",
    oneof: 0

  field :cpu_locality_balance, 3,
    type: Envoy.Config.Listener.V3.Listener.ConnectionBalanceConfig.CpuLocalityBalance,
    json_name: "cpuLocalityBalance",
    oneof: 0
end

defmodule Envoy.Config.Listener.V3.Listener.InternalListenerConfig do
  @moduledoc """
  Configuration for envoy internal listener. All the future internal listener features should be added here.
  """

  use Protobuf,
    full_name: "envoy.config.listener.v3.Listener.InternalListenerConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Config.Listener.V3.Listener.FcdsConfig do
  @moduledoc """
  Configuration for filter chains discovery.
  [#not-implemented-hide:]
  """

  use Protobuf,
    full_name: "envoy.config.listener.v3.Listener.FcdsConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :name, 1, type: :string
  field :config_source, 2, type: Envoy.Config.Core.V3.ConfigSource, json_name: "configSource"
end

defmodule Envoy.Config.Listener.V3.Listener do
  @moduledoc """
  [#next-free-field: 40]
  """

  use Protobuf,
    full_name: "envoy.config.listener.v3.Listener",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :listener_specifier, 0

  field :name, 1, type: :string
  field :address, 2, type: Envoy.Config.Core.V3.Address

  field :additional_addresses, 33,
    repeated: true,
    type: Envoy.Config.Listener.V3.AdditionalAddress,
    json_name: "additionalAddresses"

  field :stat_prefix, 28, type: :string, json_name: "statPrefix"
  field :stats_matcher, 39, type: Envoy.Config.Metrics.V3.StatsMatcher, json_name: "statsMatcher"

  field :filter_chains, 3,
    repeated: true,
    type: Envoy.Config.Listener.V3.FilterChain,
    json_name: "filterChains"

  field :fcds_config, 36,
    type: Envoy.Config.Listener.V3.Listener.FcdsConfig,
    json_name: "fcdsConfig"

  field :filter_chain_matcher, 32,
    type: Xds.Type.Matcher.V3.Matcher,
    json_name: "filterChainMatcher"

  field :use_original_dst, 4, type: Google.Protobuf.BoolValue, json_name: "useOriginalDst"

  field :default_filter_chain, 25,
    type: Envoy.Config.Listener.V3.FilterChain,
    json_name: "defaultFilterChain"

  field :per_connection_buffer_limit_bytes, 5,
    type: Google.Protobuf.UInt32Value,
    json_name: "perConnectionBufferLimitBytes",
    deprecated: false

  field :per_connection_buffer_high_watermark_timeout, 38,
    type: Google.Protobuf.Duration,
    json_name: "perConnectionBufferHighWatermarkTimeout",
    deprecated: false

  field :metadata, 6, type: Envoy.Config.Core.V3.Metadata

  field :deprecated_v1, 7,
    type: Envoy.Config.Listener.V3.Listener.DeprecatedV1,
    json_name: "deprecatedV1",
    deprecated: true

  field :drain_type, 8,
    type: Envoy.Config.Listener.V3.Listener.DrainType,
    json_name: "drainType",
    enum: true

  field :listener_filters, 9,
    repeated: true,
    type: Envoy.Config.Listener.V3.ListenerFilter,
    json_name: "listenerFilters"

  field :listener_filters_timeout, 15,
    type: Google.Protobuf.Duration,
    json_name: "listenerFiltersTimeout"

  field :continue_on_listener_filters_timeout, 17,
    type: :bool,
    json_name: "continueOnListenerFiltersTimeout"

  field :transparent, 10, type: Google.Protobuf.BoolValue
  field :freebind, 11, type: Google.Protobuf.BoolValue

  field :socket_options, 13,
    repeated: true,
    type: Envoy.Config.Core.V3.SocketOption,
    json_name: "socketOptions"

  field :tcp_fast_open_queue_length, 12,
    type: Google.Protobuf.UInt32Value,
    json_name: "tcpFastOpenQueueLength"

  field :traffic_direction, 16,
    type: Envoy.Config.Core.V3.TrafficDirection,
    json_name: "trafficDirection",
    enum: true

  field :udp_listener_config, 18,
    type: Envoy.Config.Listener.V3.UdpListenerConfig,
    json_name: "udpListenerConfig"

  field :api_listener, 19, type: Envoy.Config.Listener.V3.ApiListener, json_name: "apiListener"

  field :connection_balance_config, 20,
    type: Envoy.Config.Listener.V3.Listener.ConnectionBalanceConfig,
    json_name: "connectionBalanceConfig"

  field :reuse_port, 21, type: :bool, json_name: "reusePort", deprecated: true
  field :enable_reuse_port, 29, type: Google.Protobuf.BoolValue, json_name: "enableReusePort"

  field :access_log, 22,
    repeated: true,
    type: Envoy.Config.Accesslog.V3.AccessLog,
    json_name: "accessLog"

  field :tcp_backlog_size, 24, type: Google.Protobuf.UInt32Value, json_name: "tcpBacklogSize"

  field :max_connections_to_accept_per_socket_event, 34,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxConnectionsToAcceptPerSocketEvent",
    deprecated: false

  field :bind_to_port, 26, type: Google.Protobuf.BoolValue, json_name: "bindToPort"

  field :internal_listener, 27,
    type: Envoy.Config.Listener.V3.Listener.InternalListenerConfig,
    json_name: "internalListener",
    oneof: 0

  field :enable_mptcp, 30, type: :bool, json_name: "enableMptcp"
  field :ignore_global_conn_limit, 31, type: :bool, json_name: "ignoreGlobalConnLimit"
  field :bypass_overload_manager, 35, type: :bool, json_name: "bypassOverloadManager"
  field :tcp_keepalive, 37, type: Envoy.Config.Core.V3.TcpKeepalive, json_name: "tcpKeepalive"
end
