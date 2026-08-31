defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.ProtocolVersion do
  @moduledoc """
  RESP protocol version supported on this listener.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.filters.network.redis_proxy.v3.RedisProxy.ProtocolVersion",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :RESP2, 0
  field :RESP3, 1
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.ConnPoolSettings.ReadPolicy do
  @moduledoc """
  ReadPolicy controls how Envoy routes read commands to Redis nodes. This is currently
  supported for Redis Cluster. All ReadPolicy settings except MASTER may return stale data
  because replication is asynchronous and requires some delay. You need to ensure that your
  application can tolerate stale data.
  """

  use Protobuf,
    enum: true,
    full_name:
      "envoy.extensions.filters.network.redis_proxy.v3.RedisProxy.ConnPoolSettings.ReadPolicy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :MASTER, 0
  field :PREFER_MASTER, 1
  field :REPLICA, 2
  field :PREFER_REPLICA, 3
  field :ANY, 4
  field :LOCAL_ZONE_AFFINITY, 5
  field :LOCAL_ZONE_AFFINITY_REPLICAS_AND_PRIMARY, 6
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.RedisFault.RedisFaultType do
  use Protobuf,
    enum: true,
    full_name:
      "envoy.extensions.filters.network.redis_proxy.v3.RedisProxy.RedisFault.RedisFaultType",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :DELAY, 0
  field :ERROR, 1
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.ConnPoolSettings do
  @moduledoc """
  Redis connection pool settings.
  [#next-free-field: 11]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.network.redis_proxy.v3.RedisProxy.ConnPoolSettings",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :op_timeout, 1, type: Google.Protobuf.Duration, json_name: "opTimeout", deprecated: false
  field :enable_hashtagging, 2, type: :bool, json_name: "enableHashtagging"
  field :enable_redirection, 3, type: :bool, json_name: "enableRedirection"

  field :dns_cache_config, 9,
    type: Envoy.Extensions.Common.DynamicForwardProxy.V3.DnsCacheConfig,
    json_name: "dnsCacheConfig"

  field :max_buffer_size_before_flush, 4, type: :uint32, json_name: "maxBufferSizeBeforeFlush"
  field :buffer_flush_timeout, 5, type: Google.Protobuf.Duration, json_name: "bufferFlushTimeout"

  field :max_upstream_unknown_connections, 6,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxUpstreamUnknownConnections"

  field :enable_command_stats, 8, type: :bool, json_name: "enableCommandStats"

  field :read_policy, 7,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.ConnPoolSettings.ReadPolicy,
    json_name: "readPolicy",
    enum: true,
    deprecated: false

  field :connection_rate_limit, 10,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.ConnectionRateLimit,
    json_name: "connectionRateLimit"
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes.Route.RequestMirrorPolicy do
  @moduledoc """
  The router is capable of shadowing traffic from one cluster to another. The current
  implementation is "fire and forget," meaning Envoy will not wait for the shadow cluster to
  respond before returning the response from the primary cluster. All normal statistics are
  collected for the shadow cluster making this feature useful for testing.
  """

  use Protobuf,
    full_name:
      "envoy.extensions.filters.network.redis_proxy.v3.RedisProxy.PrefixRoutes.Route.RequestMirrorPolicy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :cluster, 1, type: :string, deprecated: false

  field :runtime_fraction, 2,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "runtimeFraction"

  field :exclude_read_commands, 3, type: :bool, json_name: "excludeReadCommands"
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes.Route.ReadCommandPolicy do
  @moduledoc """
  ReadCommandPolicy specifies that Envoy should route read commands to another cluster.
  """

  use Protobuf,
    full_name:
      "envoy.extensions.filters.network.redis_proxy.v3.RedisProxy.PrefixRoutes.Route.ReadCommandPolicy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :cluster, 1, type: :string, deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes.Route do
  @moduledoc """
  [#next-free-field: 7]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.network.redis_proxy.v3.RedisProxy.PrefixRoutes.Route",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :prefix, 1, type: :string, deprecated: false
  field :remove_prefix, 2, type: :bool, json_name: "removePrefix"
  field :cluster, 3, type: :string, deprecated: false

  field :request_mirror_policy, 4,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes.Route.RequestMirrorPolicy,
    json_name: "requestMirrorPolicy"

  field :key_formatter, 5, type: :string, json_name: "keyFormatter"

  field :read_command_policy, 6,
    type:
      Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes.Route.ReadCommandPolicy,
    json_name: "readCommandPolicy"
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes do
  use Protobuf,
    full_name: "envoy.extensions.filters.network.redis_proxy.v3.RedisProxy.PrefixRoutes",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :routes, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes.Route

  field :case_insensitive, 2, type: :bool, json_name: "caseInsensitive"

  field :catch_all_route, 4,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes.Route,
    json_name: "catchAllRoute"
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.RedisFault do
  @moduledoc """
  RedisFault defines faults used for fault injection.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.network.redis_proxy.v3.RedisProxy.RedisFault",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :fault_type, 1,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.RedisFault.RedisFaultType,
    json_name: "faultType",
    enum: true,
    deprecated: false

  field :fault_enabled, 2,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "faultEnabled",
    deprecated: false

  field :delay, 3, type: Google.Protobuf.Duration
  field :commands, 4, repeated: true, type: :string
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.ConnectionRateLimit do
  @moduledoc """
  Configuration to limit reconnection rate to redis server to protect redis server
  from client reconnection storm.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.network.redis_proxy.v3.RedisProxy.ConnectionRateLimit",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :connection_rate_limit_per_sec, 1,
    type: :uint32,
    json_name: "connectionRateLimitPerSec",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy do
  @moduledoc """
  [#next-free-field: 13]
  [#protodoc-title: Redis Proxy]
  Redis Proxy :ref:`configuration overview <config_network_filters_redis_proxy>`.
  [#extension: envoy.filters.network.redis_proxy]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.network.redis_proxy.v3.RedisProxy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false

  field :settings, 3,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.ConnPoolSettings,
    deprecated: false

  field :latency_in_micros, 4, type: :bool, json_name: "latencyInMicros"

  field :prefix_routes, 5,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.PrefixRoutes,
    json_name: "prefixRoutes"

  field :downstream_auth_password, 6,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "downstreamAuthPassword",
    deprecated: true

  field :downstream_auth_passwords, 9,
    repeated: true,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "downstreamAuthPasswords",
    deprecated: false

  field :faults, 8,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.RedisFault

  field :downstream_auth_username, 7,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "downstreamAuthUsername",
    deprecated: false

  field :external_auth_provider, 10,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisExternalAuthProvider,
    json_name: "externalAuthProvider"

  field :custom_commands, 11, repeated: true, type: :string, json_name: "customCommands"

  field :protocol_version, 12,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProxy.ProtocolVersion,
    json_name: "protocolVersion",
    enum: true,
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProtocolOptions.Credential do
  use Protobuf,
    full_name: "envoy.extensions.filters.network.redis_proxy.v3.RedisProtocolOptions.Credential",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :address, 1, type: Envoy.Config.Core.V3.Address

  field :auth_password, 2,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "authPassword",
    deprecated: false

  field :auth_username, 3,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "authUsername",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProtocolOptions do
  @moduledoc """
  RedisProtocolOptions specifies Redis upstream protocol options. This object is used in
  :ref:`typed_extension_protocol_options<envoy_v3_api_field_config.cluster.v3.Cluster.typed_extension_protocol_options>`,
  keyed by the name ``envoy.filters.network.redis_proxy``.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.network.redis_proxy.v3.RedisProtocolOptions",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :auth_password, 1,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "authPassword",
    deprecated: false

  field :auth_username, 2,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "authUsername",
    deprecated: false

  field :aws_iam, 3,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.AwsIam,
    json_name: "awsIam"

  field :credentials, 4,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisProtocolOptions.Credential
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.AwsIam do
  @moduledoc """
  [#next-free-field: 6]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.network.redis_proxy.v3.AwsIam",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :credential_provider, 1,
    type: Envoy.Extensions.Common.Aws.V3.AwsCredentialProvider,
    json_name: "credentialProvider"

  field :cache_name, 2, type: :string, json_name: "cacheName", deprecated: false
  field :service_name, 3, type: :string, json_name: "serviceName"
  field :region, 4, type: :string

  field :expiration_time, 5,
    type: Google.Protobuf.Duration,
    json_name: "expirationTime",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.RedisProxy.V3.RedisExternalAuthProvider do
  @moduledoc """
  RedisExternalAuthProvider specifies a gRPC service that can be used to authenticate Redis clients.
  This service will be called every time an AUTH command is received from a client.
  If the service returns an error, authentication is considered failed.
  If the service returns a success, the client is considered authenticated.
  The service can also return an expiration timestamp, which will be used to disable any further
  commands from the client after it passes, unless a new AUTH command is received and the
  external auth service returns a new expiration timestamp.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.network.redis_proxy.v3.RedisExternalAuthProvider",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :grpc_service, 1, type: Envoy.Config.Core.V3.GrpcService, json_name: "grpcService"
  field :enable_auth_expiration, 2, type: :bool, json_name: "enableAuthExpiration"
end
