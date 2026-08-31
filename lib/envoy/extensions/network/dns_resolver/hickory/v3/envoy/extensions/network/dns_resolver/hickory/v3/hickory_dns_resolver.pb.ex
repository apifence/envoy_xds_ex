defmodule Envoy.Extensions.Network.DnsResolver.Hickory.V3.DnsOverTlsConfig do
  @moduledoc """
  Configuration for DNS-over-TLS (DoT) servers.
  [#protodoc-title: Hickory DNS resolver]
  [#extension: envoy.network.dns_resolver.hickory]
  """

  use Protobuf,
    full_name: "envoy.extensions.network.dns_resolver.hickory.v3.DnsOverTlsConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :servers, 1, repeated: true, type: Envoy.Config.Core.V3.Address
  field :tls_server_name, 2, type: :string, json_name: "tlsServerName", deprecated: false
end

defmodule Envoy.Extensions.Network.DnsResolver.Hickory.V3.DnsOverHttpsConfig do
  @moduledoc """
  Configuration for DNS-over-HTTPS (DoH) servers.
  """

  use Protobuf,
    full_name: "envoy.extensions.network.dns_resolver.hickory.v3.DnsOverHttpsConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :server_urls, 1, repeated: true, type: :string, json_name: "serverUrls", deprecated: false
end

defmodule Envoy.Extensions.Network.DnsResolver.Hickory.V3.HickoryDnsResolverConfig do
  @moduledoc """
  Configuration for the Hickory DNS resolver. This resolver uses the Hickory DNS library,
  a pure Rust DNS implementation, for DNS resolution. It supports standard DNS (UDP/TCP),
  DNS-over-TLS (DoT), DNS-over-HTTPS (DoH), and ``DNSSEC`` validation.

  The resolver runs asynchronously on its own ``Tokio`` runtime threads, separate from Envoy's
  event loop threads. Results are delivered back to the calling dispatcher thread.
  [#next-free-field: 10]
  """

  use Protobuf,
    full_name: "envoy.extensions.network.dns_resolver.hickory.v3.HickoryDnsResolverConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :resolvers, 1, repeated: true, type: Envoy.Config.Core.V3.Address

  field :dns_over_tls, 2,
    type: Envoy.Extensions.Network.DnsResolver.Hickory.V3.DnsOverTlsConfig,
    json_name: "dnsOverTls"

  field :dns_over_https, 3,
    type: Envoy.Extensions.Network.DnsResolver.Hickory.V3.DnsOverHttpsConfig,
    json_name: "dnsOverHttps"

  field :enable_dnssec, 4, type: :bool, json_name: "enableDnssec"
  field :cache_size, 5, type: Google.Protobuf.UInt32Value, json_name: "cacheSize"

  field :num_resolver_threads, 6,
    type: Google.Protobuf.UInt32Value,
    json_name: "numResolverThreads",
    deprecated: false

  field :use_system_config, 7, type: Google.Protobuf.BoolValue, json_name: "useSystemConfig"

  field :query_timeout, 8,
    type: Google.Protobuf.Duration,
    json_name: "queryTimeout",
    deprecated: false

  field :query_tries, 9,
    type: Google.Protobuf.UInt32Value,
    json_name: "queryTries",
    deprecated: false
end
