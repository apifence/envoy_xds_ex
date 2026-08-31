defmodule Envoy.Config.Cluster.V3.Cluster.DiscoveryType do
  @moduledoc """
  Refer to :ref:`service discovery type <arch_overview_service_discovery_types>`
  for an explanation on each type.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.config.cluster.v3.Cluster.DiscoveryType",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :STATIC, 0
  field :STRICT_DNS, 1
  field :LOGICAL_DNS, 2
  field :EDS, 3
  field :ORIGINAL_DST, 4
end

defmodule Envoy.Config.Cluster.V3.Cluster.LbPolicy do
  @moduledoc """
  Refer to :ref:`load balancer type <arch_overview_load_balancing_types>` architecture
  overview section for information on each type.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.config.cluster.v3.Cluster.LbPolicy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :ROUND_ROBIN, 0
  field :LEAST_REQUEST, 1
  field :RING_HASH, 2
  field :RANDOM, 3
  field :MAGLEV, 5
  field :CLUSTER_PROVIDED, 6
  field :LOAD_BALANCING_POLICY_CONFIG, 7
end

defmodule Envoy.Config.Cluster.V3.Cluster.DnsLookupFamily do
  @moduledoc """
  When V4_ONLY is selected, the DNS resolver will only perform a lookup for
  addresses in the IPv4 family. If V6_ONLY is selected, the DNS resolver will
  only perform a lookup for addresses in the IPv6 family. If AUTO is
  specified, the DNS resolver will first perform a lookup for addresses in
  the IPv6 family and fallback to a lookup for addresses in the IPv4 family.
  This is semantically equivalent to a non-existent V6_PREFERRED option.
  AUTO is a legacy name that is more opaque than
  necessary and will be deprecated in favor of V6_PREFERRED in a future major version of the API.
  If V4_PREFERRED is specified, the DNS resolver will first perform a lookup for addresses in the
  IPv4 family and fallback to a lookup for addresses in the IPv6 family. i.e., the callback
  target will only get v6 addresses if there were NO v4 addresses to return.
  If ALL is specified, the DNS resolver will perform a lookup for both IPv4 and IPv6 families,
  and return all resolved addresses. When this is used, Happy Eyeballs will be enabled for
  upstream connections. Refer to :ref:`Happy Eyeballs Support <arch_overview_happy_eyeballs>`
  for more information.
  For cluster types other than
  :ref:`STRICT_DNS<envoy_v3_api_enum_value_config.cluster.v3.Cluster.DiscoveryType.STRICT_DNS>` and
  :ref:`LOGICAL_DNS<envoy_v3_api_enum_value_config.cluster.v3.Cluster.DiscoveryType.LOGICAL_DNS>`,
  this setting is
  ignored.
  [#next-major-version: deprecate AUTO in favor of a V6_PREFERRED option.]
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.config.cluster.v3.Cluster.DnsLookupFamily",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :AUTO, 0
  field :V4_ONLY, 1
  field :V6_ONLY, 2
  field :V4_PREFERRED, 3
  field :ALL, 4
end

defmodule Envoy.Config.Cluster.V3.Cluster.ClusterProtocolSelection do
  use Protobuf,
    enum: true,
    full_name: "envoy.config.cluster.v3.Cluster.ClusterProtocolSelection",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :USE_CONFIGURED_PROTOCOL, 0
  field :USE_DOWNSTREAM_PROTOCOL, 1
end

defmodule Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig.LbSubsetFallbackPolicy do
  @moduledoc """
  If NO_FALLBACK is selected, a result
  equivalent to no healthy hosts is reported. If ANY_ENDPOINT is selected,
  any cluster endpoint may be returned (subject to policy, health checks,
  etc). If DEFAULT_SUBSET is selected, load balancing is performed over the
  endpoints matching the values from the default_subset field.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.config.cluster.v3.Cluster.LbSubsetConfig.LbSubsetFallbackPolicy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :NO_FALLBACK, 0
  field :ANY_ENDPOINT, 1
  field :DEFAULT_SUBSET, 2
end

defmodule Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig.LbSubsetMetadataFallbackPolicy do
  use Protobuf,
    enum: true,
    full_name: "envoy.config.cluster.v3.Cluster.LbSubsetConfig.LbSubsetMetadataFallbackPolicy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :METADATA_NO_FALLBACK, 0
  field :FALLBACK_LIST, 1
end

defmodule Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig.LbSubsetSelector.LbSubsetSelectorFallbackPolicy do
  @moduledoc """
  Allows to override top level fallback policy per selector.
  """

  use Protobuf,
    enum: true,
    full_name:
      "envoy.config.cluster.v3.Cluster.LbSubsetConfig.LbSubsetSelector.LbSubsetSelectorFallbackPolicy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :NOT_DEFINED, 0
  field :NO_FALLBACK, 1
  field :ANY_ENDPOINT, 2
  field :DEFAULT_SUBSET, 3
  field :KEYS_SUBSET, 4
end

defmodule Envoy.Config.Cluster.V3.Cluster.RingHashLbConfig.HashFunction do
  @moduledoc """
  The hash function used to hash hosts onto the ketama ring.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.config.cluster.v3.Cluster.RingHashLbConfig.HashFunction",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :XX_HASH, 0
  field :MURMUR_HASH_2, 1
end

defmodule Envoy.Config.Cluster.V3.UpstreamConnectionOptions.FirstAddressFamilyVersion do
  @moduledoc """
  [#comment: Keep this list of address types in sync with api/config/core/v3/address.proto.]
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.config.cluster.v3.UpstreamConnectionOptions.FirstAddressFamilyVersion",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :DEFAULT, 0
  field :V4, 1
  field :V6, 2
  field :PIPE, 3
  field :INTERNAL, 4
end

defmodule Envoy.Config.Cluster.V3.ClusterCollection do
  @moduledoc """
  Cluster list collections. Entries are ``Cluster`` resources or references.
  [#not-implemented-hide:]
  [#protodoc-title: Cluster configuration]
  """

  use Protobuf,
    full_name: "envoy.config.cluster.v3.ClusterCollection",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :entries, 1, type: Xds.Core.V3.CollectionEntry
end

defmodule Envoy.Config.Cluster.V3.Cluster.TransportSocketMatch do
  @moduledoc """
  TransportSocketMatch specifies what transport socket config will be used
  when the match conditions are satisfied.
  """

  use Protobuf,
    full_name: "envoy.config.cluster.v3.Cluster.TransportSocketMatch",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :match, 2, type: Google.Protobuf.Struct

  field :transport_socket, 3,
    type: Envoy.Config.Core.V3.TransportSocket,
    json_name: "transportSocket"
end

defmodule Envoy.Config.Cluster.V3.Cluster.CustomClusterType do
  @moduledoc """
  Extended cluster type.
  """

  use Protobuf,
    full_name: "envoy.config.cluster.v3.Cluster.CustomClusterType",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 2, type: Google.Protobuf.Any, json_name: "typedConfig"
end

defmodule Envoy.Config.Cluster.V3.Cluster.EdsClusterConfig do
  @moduledoc """
  Only valid when discovery type is EDS.
  """

  use Protobuf,
    full_name: "envoy.config.cluster.v3.Cluster.EdsClusterConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :eds_config, 1, type: Envoy.Config.Core.V3.ConfigSource, json_name: "edsConfig"
  field :service_name, 2, type: :string, json_name: "serviceName"
end

defmodule Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig.LbSubsetSelector do
  @moduledoc """
  Specifications for subsets.
  """

  use Protobuf,
    full_name: "envoy.config.cluster.v3.Cluster.LbSubsetConfig.LbSubsetSelector",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :keys, 1, repeated: true, type: :string
  field :single_host_per_subset, 4, type: :bool, json_name: "singleHostPerSubset"

  field :fallback_policy, 2,
    type:
      Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig.LbSubsetSelector.LbSubsetSelectorFallbackPolicy,
    json_name: "fallbackPolicy",
    enum: true,
    deprecated: false

  field :fallback_keys_subset, 3, repeated: true, type: :string, json_name: "fallbackKeysSubset"
end

defmodule Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig do
  @moduledoc """
  Optionally divide the endpoints in this cluster into subsets defined by
  endpoint metadata and selected by route and weighted cluster metadata.
  [#next-free-field: 9]
  """

  use Protobuf,
    full_name: "envoy.config.cluster.v3.Cluster.LbSubsetConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :fallback_policy, 1,
    type: Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig.LbSubsetFallbackPolicy,
    json_name: "fallbackPolicy",
    enum: true,
    deprecated: false

  field :default_subset, 2, type: Google.Protobuf.Struct, json_name: "defaultSubset"

  field :subset_selectors, 3,
    repeated: true,
    type: Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig.LbSubsetSelector,
    json_name: "subsetSelectors"

  field :locality_weight_aware, 4, type: :bool, json_name: "localityWeightAware"
  field :scale_locality_weight, 5, type: :bool, json_name: "scaleLocalityWeight"
  field :panic_mode_any, 6, type: :bool, json_name: "panicModeAny"
  field :list_as_any, 7, type: :bool, json_name: "listAsAny"

  field :metadata_fallback_policy, 8,
    type: Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig.LbSubsetMetadataFallbackPolicy,
    json_name: "metadataFallbackPolicy",
    enum: true,
    deprecated: false
end

defmodule Envoy.Config.Cluster.V3.Cluster.SlowStartConfig do
  @moduledoc """
  Configuration for :ref:`slow start mode <arch_overview_load_balancing_slow_start>`.
  """

  use Protobuf,
    full_name: "envoy.config.cluster.v3.Cluster.SlowStartConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :slow_start_window, 1, type: Google.Protobuf.Duration, json_name: "slowStartWindow"
  field :aggression, 2, type: Envoy.Config.Core.V3.RuntimeDouble
  field :min_weight_percent, 3, type: Envoy.Type.V3.Percent, json_name: "minWeightPercent"
end

defmodule Envoy.Config.Cluster.V3.Cluster.RoundRobinLbConfig do
  @moduledoc """
  Specific configuration for the RoundRobin load balancing policy.
  """

  use Protobuf,
    full_name: "envoy.config.cluster.v3.Cluster.RoundRobinLbConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :slow_start_config, 1,
    type: Envoy.Config.Cluster.V3.Cluster.SlowStartConfig,
    json_name: "slowStartConfig"
end

defmodule Envoy.Config.Cluster.V3.Cluster.LeastRequestLbConfig do
  @moduledoc """
  Specific configuration for the LeastRequest load balancing policy.
  """

  use Protobuf,
    full_name: "envoy.config.cluster.v3.Cluster.LeastRequestLbConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :choice_count, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "choiceCount",
    deprecated: false

  field :active_request_bias, 2,
    type: Envoy.Config.Core.V3.RuntimeDouble,
    json_name: "activeRequestBias"

  field :slow_start_config, 3,
    type: Envoy.Config.Cluster.V3.Cluster.SlowStartConfig,
    json_name: "slowStartConfig"
end

defmodule Envoy.Config.Cluster.V3.Cluster.RingHashLbConfig do
  @moduledoc """
  Specific configuration for the :ref:`RingHash<arch_overview_load_balancing_types_ring_hash>`
  load balancing policy.
  """

  use Protobuf,
    full_name: "envoy.config.cluster.v3.Cluster.RingHashLbConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :minimum_ring_size, 1,
    type: Google.Protobuf.UInt64Value,
    json_name: "minimumRingSize",
    deprecated: false

  field :hash_function, 3,
    type: Envoy.Config.Cluster.V3.Cluster.RingHashLbConfig.HashFunction,
    json_name: "hashFunction",
    enum: true,
    deprecated: false

  field :maximum_ring_size, 4,
    type: Google.Protobuf.UInt64Value,
    json_name: "maximumRingSize",
    deprecated: false
end

defmodule Envoy.Config.Cluster.V3.Cluster.MaglevLbConfig do
  @moduledoc """
  Specific configuration for the :ref:`Maglev<arch_overview_load_balancing_types_maglev>`
  load balancing policy.
  """

  use Protobuf,
    full_name: "envoy.config.cluster.v3.Cluster.MaglevLbConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :table_size, 1,
    type: Google.Protobuf.UInt64Value,
    json_name: "tableSize",
    deprecated: false
end

defmodule Envoy.Config.Cluster.V3.Cluster.OriginalDstLbConfig do
  @moduledoc """
  Specific configuration for the
  :ref:`Original Destination <arch_overview_load_balancing_types_original_destination>`
  load balancing policy.
  [#extension: envoy.clusters.original_dst]
  """

  use Protobuf,
    full_name: "envoy.config.cluster.v3.Cluster.OriginalDstLbConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :use_http_header, 1, type: :bool, json_name: "useHttpHeader"
  field :http_header_name, 2, type: :string, json_name: "httpHeaderName"

  field :upstream_port_override, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "upstreamPortOverride",
    deprecated: false

  field :metadata_key, 4, type: Envoy.Type.Metadata.V3.MetadataKey, json_name: "metadataKey"
end

defmodule Envoy.Config.Cluster.V3.Cluster.CommonLbConfig.ZoneAwareLbConfig do
  @moduledoc """
  Configuration for :ref:`zone aware routing
  <arch_overview_load_balancing_zone_aware_routing>`.
  """

  use Protobuf,
    full_name: "envoy.config.cluster.v3.Cluster.CommonLbConfig.ZoneAwareLbConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :routing_enabled, 1, type: Envoy.Type.V3.Percent, json_name: "routingEnabled"
  field :min_cluster_size, 2, type: Google.Protobuf.UInt64Value, json_name: "minClusterSize"
  field :fail_traffic_on_panic, 3, type: :bool, json_name: "failTrafficOnPanic"
end

defmodule Envoy.Config.Cluster.V3.Cluster.CommonLbConfig.LocalityWeightedLbConfig do
  @moduledoc """
  Configuration for :ref:`locality weighted load balancing
  <arch_overview_load_balancing_locality_weighted_lb>`
  """

  use Protobuf,
    full_name: "envoy.config.cluster.v3.Cluster.CommonLbConfig.LocalityWeightedLbConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Config.Cluster.V3.Cluster.CommonLbConfig.ConsistentHashingLbConfig do
  @moduledoc """
  Common Configuration for all consistent hashing load balancers (MaglevLb, RingHashLb, etc.)
  """

  use Protobuf,
    full_name: "envoy.config.cluster.v3.Cluster.CommonLbConfig.ConsistentHashingLbConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :use_hostname_for_hashing, 1, type: :bool, json_name: "useHostnameForHashing"

  field :hash_balance_factor, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "hashBalanceFactor",
    deprecated: false
end

defmodule Envoy.Config.Cluster.V3.Cluster.CommonLbConfig do
  @moduledoc """
  Common configuration for all load balancer implementations.
  [#next-free-field: 9]
  """

  use Protobuf,
    full_name: "envoy.config.cluster.v3.Cluster.CommonLbConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :locality_config_specifier, 0

  field :healthy_panic_threshold, 1,
    type: Envoy.Type.V3.Percent,
    json_name: "healthyPanicThreshold"

  field :zone_aware_lb_config, 2,
    type: Envoy.Config.Cluster.V3.Cluster.CommonLbConfig.ZoneAwareLbConfig,
    json_name: "zoneAwareLbConfig",
    oneof: 0

  field :locality_weighted_lb_config, 3,
    type: Envoy.Config.Cluster.V3.Cluster.CommonLbConfig.LocalityWeightedLbConfig,
    json_name: "localityWeightedLbConfig",
    oneof: 0

  field :update_merge_window, 4, type: Google.Protobuf.Duration, json_name: "updateMergeWindow"
  field :ignore_new_hosts_until_first_hc, 5, type: :bool, json_name: "ignoreNewHostsUntilFirstHc"

  field :close_connections_on_host_set_change, 6,
    type: :bool,
    json_name: "closeConnectionsOnHostSetChange"

  field :consistent_hashing_lb_config, 7,
    type: Envoy.Config.Cluster.V3.Cluster.CommonLbConfig.ConsistentHashingLbConfig,
    json_name: "consistentHashingLbConfig"

  field :override_host_status, 8,
    type: Envoy.Config.Core.V3.HealthStatusSet,
    json_name: "overrideHostStatus"
end

defmodule Envoy.Config.Cluster.V3.Cluster.RefreshRate do
  use Protobuf,
    full_name: "envoy.config.cluster.v3.Cluster.RefreshRate",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :base_interval, 1,
    type: Google.Protobuf.Duration,
    json_name: "baseInterval",
    deprecated: false

  field :max_interval, 2,
    type: Google.Protobuf.Duration,
    json_name: "maxInterval",
    deprecated: false
end

defmodule Envoy.Config.Cluster.V3.Cluster.PreconnectPolicy do
  use Protobuf,
    full_name: "envoy.config.cluster.v3.Cluster.PreconnectPolicy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :per_upstream_preconnect_ratio, 1,
    type: Google.Protobuf.DoubleValue,
    json_name: "perUpstreamPreconnectRatio",
    deprecated: false

  field :predictive_preconnect_ratio, 2,
    type: Google.Protobuf.DoubleValue,
    json_name: "predictivePreconnectRatio",
    deprecated: false

  field :preconnect_enabled_metadata, 3,
    type: Envoy.Type.Matcher.V3.MetadataMatcher,
    json_name: "preconnectEnabledMetadata"
end

defmodule Envoy.Config.Cluster.V3.Cluster.QueuingPolicies do
  @moduledoc """
  Queueing policies for the cluster.
  """

  use Protobuf,
    full_name: "envoy.config.cluster.v3.Cluster.QueuingPolicies",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :pending_rq_policy, 1,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "pendingRqPolicy"
end

defmodule Envoy.Config.Cluster.V3.Cluster.TypedExtensionProtocolOptionsEntry do
  use Protobuf,
    full_name: "envoy.config.cluster.v3.Cluster.TypedExtensionProtocolOptionsEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Any
end

defmodule Envoy.Config.Cluster.V3.Cluster do
  @moduledoc """
  Configuration for a single upstream cluster.
  [#next-free-field: 63]
  """

  use Protobuf,
    full_name: "envoy.config.cluster.v3.Cluster",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :cluster_discovery_type, 0

  oneof :lb_config, 1

  field :transport_socket_matches, 43,
    repeated: true,
    type: Envoy.Config.Cluster.V3.Cluster.TransportSocketMatch,
    json_name: "transportSocketMatches"

  field :transport_socket_matcher, 59,
    type: Xds.Type.Matcher.V3.Matcher,
    json_name: "transportSocketMatcher"

  field :name, 1, type: :string, deprecated: false
  field :alt_stat_name, 28, type: :string, json_name: "altStatName", deprecated: false
  field :stats_matcher, 61, type: Envoy.Config.Metrics.V3.StatsMatcher, json_name: "statsMatcher"

  field :type, 2,
    type: Envoy.Config.Cluster.V3.Cluster.DiscoveryType,
    enum: true,
    oneof: 0,
    deprecated: false

  field :cluster_type, 38,
    type: Envoy.Config.Cluster.V3.Cluster.CustomClusterType,
    json_name: "clusterType",
    oneof: 0

  field :eds_cluster_config, 3,
    type: Envoy.Config.Cluster.V3.Cluster.EdsClusterConfig,
    json_name: "edsClusterConfig"

  field :connect_timeout, 4,
    type: Google.Protobuf.Duration,
    json_name: "connectTimeout",
    deprecated: false

  field :per_connection_buffer_limit_bytes, 5,
    type: Google.Protobuf.UInt32Value,
    json_name: "perConnectionBufferLimitBytes",
    deprecated: false

  field :per_connection_buffer_high_watermark_timeout, 60,
    type: Google.Protobuf.Duration,
    json_name: "perConnectionBufferHighWatermarkTimeout",
    deprecated: false

  field :lb_policy, 6,
    type: Envoy.Config.Cluster.V3.Cluster.LbPolicy,
    json_name: "lbPolicy",
    enum: true,
    deprecated: false

  field :load_assignment, 33,
    type: Envoy.Config.Endpoint.V3.ClusterLoadAssignment,
    json_name: "loadAssignment"

  field :health_checks, 8,
    repeated: true,
    type: Envoy.Config.Core.V3.HealthCheck,
    json_name: "healthChecks"

  field :max_requests_per_connection, 9,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxRequestsPerConnection",
    deprecated: true

  field :circuit_breakers, 10,
    type: Envoy.Config.Cluster.V3.CircuitBreakers,
    json_name: "circuitBreakers"

  field :upstream_http_protocol_options, 46,
    type: Envoy.Config.Core.V3.UpstreamHttpProtocolOptions,
    json_name: "upstreamHttpProtocolOptions",
    deprecated: true

  field :common_http_protocol_options, 29,
    type: Envoy.Config.Core.V3.HttpProtocolOptions,
    json_name: "commonHttpProtocolOptions",
    deprecated: true

  field :http_protocol_options, 13,
    type: Envoy.Config.Core.V3.Http1ProtocolOptions,
    json_name: "httpProtocolOptions",
    deprecated: true

  field :http2_protocol_options, 14,
    type: Envoy.Config.Core.V3.Http2ProtocolOptions,
    json_name: "http2ProtocolOptions",
    deprecated: true

  field :typed_extension_protocol_options, 36,
    repeated: true,
    type: Envoy.Config.Cluster.V3.Cluster.TypedExtensionProtocolOptionsEntry,
    json_name: "typedExtensionProtocolOptions",
    map: true

  field :dns_refresh_rate, 16,
    type: Google.Protobuf.Duration,
    json_name: "dnsRefreshRate",
    deprecated: true

  field :dns_jitter, 58, type: Google.Protobuf.Duration, json_name: "dnsJitter", deprecated: true

  field :dns_failure_refresh_rate, 44,
    type: Envoy.Config.Cluster.V3.Cluster.RefreshRate,
    json_name: "dnsFailureRefreshRate",
    deprecated: true

  field :respect_dns_ttl, 39, type: :bool, json_name: "respectDnsTtl", deprecated: true

  field :dns_lookup_family, 17,
    type: Envoy.Config.Cluster.V3.Cluster.DnsLookupFamily,
    json_name: "dnsLookupFamily",
    enum: true,
    deprecated: false

  field :dns_resolvers, 18,
    repeated: true,
    type: Envoy.Config.Core.V3.Address,
    json_name: "dnsResolvers",
    deprecated: true

  field :use_tcp_for_dns_lookups, 45,
    type: :bool,
    json_name: "useTcpForDnsLookups",
    deprecated: true

  field :dns_resolution_config, 53,
    type: Envoy.Config.Core.V3.DnsResolutionConfig,
    json_name: "dnsResolutionConfig",
    deprecated: true

  field :typed_dns_resolver_config, 55,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "typedDnsResolverConfig"

  field :wait_for_warm_on_init, 54,
    type: Google.Protobuf.BoolValue,
    json_name: "waitForWarmOnInit"

  field :outlier_detection, 19,
    type: Envoy.Config.Cluster.V3.OutlierDetection,
    json_name: "outlierDetection"

  field :cleanup_interval, 20,
    type: Google.Protobuf.Duration,
    json_name: "cleanupInterval",
    deprecated: false

  field :upstream_bind_config, 21,
    type: Envoy.Config.Core.V3.BindConfig,
    json_name: "upstreamBindConfig"

  field :lb_subset_config, 22,
    type: Envoy.Config.Cluster.V3.Cluster.LbSubsetConfig,
    json_name: "lbSubsetConfig"

  field :ring_hash_lb_config, 23,
    type: Envoy.Config.Cluster.V3.Cluster.RingHashLbConfig,
    json_name: "ringHashLbConfig",
    oneof: 1

  field :maglev_lb_config, 52,
    type: Envoy.Config.Cluster.V3.Cluster.MaglevLbConfig,
    json_name: "maglevLbConfig",
    oneof: 1

  field :original_dst_lb_config, 34,
    type: Envoy.Config.Cluster.V3.Cluster.OriginalDstLbConfig,
    json_name: "originalDstLbConfig",
    oneof: 1

  field :least_request_lb_config, 37,
    type: Envoy.Config.Cluster.V3.Cluster.LeastRequestLbConfig,
    json_name: "leastRequestLbConfig",
    oneof: 1

  field :round_robin_lb_config, 56,
    type: Envoy.Config.Cluster.V3.Cluster.RoundRobinLbConfig,
    json_name: "roundRobinLbConfig",
    oneof: 1

  field :common_lb_config, 27,
    type: Envoy.Config.Cluster.V3.Cluster.CommonLbConfig,
    json_name: "commonLbConfig"

  field :transport_socket, 24,
    type: Envoy.Config.Core.V3.TransportSocket,
    json_name: "transportSocket"

  field :metadata, 25, type: Envoy.Config.Core.V3.Metadata

  field :protocol_selection, 26,
    type: Envoy.Config.Cluster.V3.Cluster.ClusterProtocolSelection,
    json_name: "protocolSelection",
    enum: true,
    deprecated: true

  field :upstream_connection_options, 30,
    type: Envoy.Config.Cluster.V3.UpstreamConnectionOptions,
    json_name: "upstreamConnectionOptions"

  field :close_connections_on_host_health_failure, 31,
    type: :bool,
    json_name: "closeConnectionsOnHostHealthFailure"

  field :ignore_health_on_host_removal, 32, type: :bool, json_name: "ignoreHealthOnHostRemoval"
  field :filters, 40, repeated: true, type: Envoy.Config.Cluster.V3.Filter

  field :load_balancing_policy, 41,
    type: Envoy.Config.Cluster.V3.LoadBalancingPolicy,
    json_name: "loadBalancingPolicy"

  field :lrs_server, 42, type: Envoy.Config.Core.V3.ConfigSource, json_name: "lrsServer"

  field :lrs_report_endpoint_metrics, 57,
    repeated: true,
    type: :string,
    json_name: "lrsReportEndpointMetrics"

  field :track_timeout_budgets, 47,
    type: :bool,
    json_name: "trackTimeoutBudgets",
    deprecated: true

  field :upstream_config, 48,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "upstreamConfig"

  field :track_cluster_stats, 49,
    type: Envoy.Config.Cluster.V3.TrackClusterStats,
    json_name: "trackClusterStats"

  field :preconnect_policy, 50,
    type: Envoy.Config.Cluster.V3.Cluster.PreconnectPolicy,
    json_name: "preconnectPolicy"

  field :connection_pool_per_downstream_connection, 51,
    type: :bool,
    json_name: "connectionPoolPerDownstreamConnection"

  field :queuing_policies, 62,
    type: Envoy.Config.Cluster.V3.Cluster.QueuingPolicies,
    json_name: "queuingPolicies"
end

defmodule Envoy.Config.Cluster.V3.LoadBalancingPolicy.Policy do
  use Protobuf,
    full_name: "envoy.config.cluster.v3.LoadBalancingPolicy.Policy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :typed_extension_config, 4,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "typedExtensionConfig"
end

defmodule Envoy.Config.Cluster.V3.LoadBalancingPolicy do
  @moduledoc """
  Extensible load balancing policy configuration.

  Every LB policy defined via this mechanism will be identified via a unique name using reverse
  DNS notation. If the policy needs configuration parameters, it must define a message for its
  own configuration, which will be stored in the config field. The name of the policy will tell
  clients which type of message they should expect to see in the config field.

  Note that there are cases where it is useful to be able to independently select LB policies
  for choosing a locality and for choosing an endpoint within that locality. For example, a
  given deployment may always use the same policy to choose the locality, but for choosing the
  endpoint within the locality, some clusters may use weighted-round-robin, while others may
  use some sort of session-based balancing.

  This can be accomplished via hierarchical LB policies, where the parent LB policy creates a
  child LB policy for each locality. For each request, the parent chooses the locality and then
  delegates to the child policy for that locality to choose the endpoint within the locality.

  To facilitate this, the config message for the top-level LB policy may include a field of
  type LoadBalancingPolicy that specifies the child policy.
  """

  use Protobuf,
    full_name: "envoy.config.cluster.v3.LoadBalancingPolicy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :policies, 1, repeated: true, type: Envoy.Config.Cluster.V3.LoadBalancingPolicy.Policy
end

defmodule Envoy.Config.Cluster.V3.UpstreamConnectionOptions.HappyEyeballsConfig do
  use Protobuf,
    full_name: "envoy.config.cluster.v3.UpstreamConnectionOptions.HappyEyeballsConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :first_address_family_version, 1,
    type: Envoy.Config.Cluster.V3.UpstreamConnectionOptions.FirstAddressFamilyVersion,
    json_name: "firstAddressFamilyVersion",
    enum: true

  field :first_address_family_count, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "firstAddressFamilyCount",
    deprecated: false
end

defmodule Envoy.Config.Cluster.V3.UpstreamConnectionOptions do
  use Protobuf,
    full_name: "envoy.config.cluster.v3.UpstreamConnectionOptions",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :tcp_keepalive, 1, type: Envoy.Config.Core.V3.TcpKeepalive, json_name: "tcpKeepalive"

  field :set_local_interface_name_on_upstream_connections, 2,
    type: :bool,
    json_name: "setLocalInterfaceNameOnUpstreamConnections"

  field :happy_eyeballs_config, 3,
    type: Envoy.Config.Cluster.V3.UpstreamConnectionOptions.HappyEyeballsConfig,
    json_name: "happyEyeballsConfig"
end

defmodule Envoy.Config.Cluster.V3.TrackClusterStats do
  use Protobuf,
    full_name: "envoy.config.cluster.v3.TrackClusterStats",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :timeout_budgets, 1, type: :bool, json_name: "timeoutBudgets"
  field :request_response_sizes, 2, type: :bool, json_name: "requestResponseSizes"
  field :per_endpoint_stats, 3, type: :bool, json_name: "perEndpointStats"
end
