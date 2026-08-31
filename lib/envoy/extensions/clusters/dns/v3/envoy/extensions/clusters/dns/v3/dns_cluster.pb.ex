defmodule Envoy.Extensions.Clusters.Dns.V3.DnsCluster.RefreshRate do
  use Protobuf,
    full_name: "envoy.extensions.clusters.dns.v3.DnsCluster.RefreshRate",
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

defmodule Envoy.Extensions.Clusters.Dns.V3.DnsCluster do
  @moduledoc """
  [#next-free-field: 11]
  [#protodoc-title: DNS cluster configuration]
  Configuration for DNS discovery clusters.
  [#extension: envoy.clusters.dns]
  """

  use Protobuf,
    full_name: "envoy.extensions.clusters.dns.v3.DnsCluster",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :dns_refresh_rate, 3,
    type: Google.Protobuf.Duration,
    json_name: "dnsRefreshRate",
    deprecated: false

  field :dns_failure_refresh_rate, 4,
    type: Envoy.Extensions.Clusters.Dns.V3.DnsCluster.RefreshRate,
    json_name: "dnsFailureRefreshRate"

  field :respect_dns_ttl, 5, type: :bool, json_name: "respectDnsTtl"
  field :dns_jitter, 6, type: Google.Protobuf.Duration, json_name: "dnsJitter", deprecated: false

  field :typed_dns_resolver_config, 7,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "typedDnsResolverConfig"

  field :dns_lookup_family, 8,
    type: Envoy.Extensions.Clusters.Common.Dns.V3.DnsLookupFamily,
    json_name: "dnsLookupFamily",
    enum: true

  field :all_addresses_in_single_endpoint, 9,
    type: :bool,
    json_name: "allAddressesInSingleEndpoint"

  field :dns_min_refresh_rate, 10,
    type: Google.Protobuf.Duration,
    json_name: "dnsMinRefreshRate",
    deprecated: false
end
