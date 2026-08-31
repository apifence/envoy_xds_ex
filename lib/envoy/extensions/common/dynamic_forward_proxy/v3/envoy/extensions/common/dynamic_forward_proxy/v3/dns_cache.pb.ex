defmodule Envoy.Extensions.Common.DynamicForwardProxy.V3.DnsCacheCircuitBreakers do
  @moduledoc """
  Configuration of circuit breakers for resolver.
  [#protodoc-title: Dynamic forward proxy common configuration]
  """

  use Protobuf,
    full_name: "envoy.extensions.common.dynamic_forward_proxy.v3.DnsCacheCircuitBreakers",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :max_pending_requests, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxPendingRequests"
end

defmodule Envoy.Extensions.Common.DynamicForwardProxy.V3.DnsCacheConfig do
  @moduledoc """
  Configuration for the dynamic forward proxy DNS cache. See the :ref:`architecture overview
  <arch_overview_http_dynamic_forward_proxy>` for more information.
  [#next-free-field: 17]
  """

  use Protobuf,
    full_name: "envoy.extensions.common.dynamic_forward_proxy.v3.DnsCacheConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false

  field :dns_lookup_family, 2,
    type: Envoy.Config.Cluster.V3.Cluster.DnsLookupFamily,
    json_name: "dnsLookupFamily",
    enum: true,
    deprecated: false

  field :dns_refresh_rate, 3,
    type: Google.Protobuf.Duration,
    json_name: "dnsRefreshRate",
    deprecated: false

  field :dns_min_refresh_rate, 14,
    type: Google.Protobuf.Duration,
    json_name: "dnsMinRefreshRate",
    deprecated: false

  field :host_ttl, 4, type: Google.Protobuf.Duration, json_name: "hostTtl", deprecated: false
  field :max_hosts, 5, type: Google.Protobuf.UInt32Value, json_name: "maxHosts", deprecated: false
  field :disable_dns_refresh_on_failure, 15, type: :bool, json_name: "disableDnsRefreshOnFailure"

  field :dns_failure_refresh_rate, 6,
    type: Envoy.Config.Cluster.V3.Cluster.RefreshRate,
    json_name: "dnsFailureRefreshRate"

  field :dns_cache_circuit_breaker, 7,
    type: Envoy.Extensions.Common.DynamicForwardProxy.V3.DnsCacheCircuitBreakers,
    json_name: "dnsCacheCircuitBreaker"

  field :use_tcp_for_dns_lookups, 8,
    type: :bool,
    json_name: "useTcpForDnsLookups",
    deprecated: true

  field :dns_resolution_config, 9,
    type: Envoy.Config.Core.V3.DnsResolutionConfig,
    json_name: "dnsResolutionConfig",
    deprecated: true

  field :typed_dns_resolver_config, 12,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "typedDnsResolverConfig"

  field :preresolve_hostnames, 10,
    repeated: true,
    type: Envoy.Config.Core.V3.SocketAddress,
    json_name: "preresolveHostnames"

  field :dns_query_timeout, 11,
    type: Google.Protobuf.Duration,
    json_name: "dnsQueryTimeout",
    deprecated: false

  field :key_value_config, 13,
    type: Envoy.Config.Common.KeyValue.V3.KeyValueStoreConfig,
    json_name: "keyValueConfig"

  field :resolved_address_filter, 16,
    type: Envoy.Type.Matcher.V3.AddressMatcher,
    json_name: "resolvedAddressFilter"
end
