defmodule Envoy.Extensions.Network.DnsResolver.Cares.V3.CaresDnsResolverConfig do
  @moduledoc """
  Configuration for c-ares DNS resolver.
  [#next-free-field: 13]
  [#protodoc-title: c-ares DNS resolver]
  [#extension: envoy.network.dns_resolver.cares]
  """

  use Protobuf,
    full_name: "envoy.extensions.network.dns_resolver.cares.v3.CaresDnsResolverConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :resolvers, 1, repeated: true, type: Envoy.Config.Core.V3.Address
  field :use_resolvers_as_fallback, 3, type: :bool, json_name: "useResolversAsFallback"
  field :filter_unroutable_families, 4, type: :bool, json_name: "filterUnroutableFamilies"

  field :dns_resolver_options, 2,
    type: Envoy.Config.Core.V3.DnsResolverOptions,
    json_name: "dnsResolverOptions"

  field :udp_max_queries, 5, type: Google.Protobuf.UInt32Value, json_name: "udpMaxQueries"

  field :query_timeout_seconds, 6,
    type: Google.Protobuf.UInt64Value,
    json_name: "queryTimeoutSeconds",
    deprecated: false

  field :query_tries, 7,
    type: Google.Protobuf.UInt32Value,
    json_name: "queryTries",
    deprecated: false

  field :rotate_nameservers, 8, type: :bool, json_name: "rotateNameservers"

  field :edns0_max_payload_size, 9,
    type: Google.Protobuf.UInt32Value,
    json_name: "edns0MaxPayloadSize",
    deprecated: false

  field :max_udp_channel_duration, 10,
    type: Google.Protobuf.Duration,
    json_name: "maxUdpChannelDuration",
    deprecated: false

  field :reinit_channel_on_timeout, 11, type: :bool, json_name: "reinitChannelOnTimeout"

  field :qcache_max_ttl, 12,
    type: Google.Protobuf.UInt32Value,
    json_name: "qcacheMaxTtl",
    deprecated: false
end
