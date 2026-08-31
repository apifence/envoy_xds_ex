defmodule Envoy.Extensions.Filters.Udp.DnsFilter.V3.DnsFilterConfig.ServerContextConfig do
  @moduledoc """
  This message contains the configuration for the DNS Filter operating
  in a server context. This message will contain the virtual hosts and
  associated addresses with which Envoy will respond to queries
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.udp.dns_filter.v3.DnsFilterConfig.ServerContextConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :config_source, 0

  field :inline_dns_table, 1,
    type: Envoy.Data.Dns.V3.DnsTable,
    json_name: "inlineDnsTable",
    oneof: 0

  field :external_dns_table, 2,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "externalDnsTable",
    oneof: 0
end

defmodule Envoy.Extensions.Filters.Udp.DnsFilter.V3.DnsFilterConfig.ClientContextConfig do
  @moduledoc """
  This message contains the configuration for the DNS Filter operating
  in a client context. This message will contain the timeouts, retry,
  and forwarding configuration for Envoy to make DNS requests to other
  resolvers

  [#next-free-field: 6]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.udp.dns_filter.v3.DnsFilterConfig.ClientContextConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :resolver_timeout, 1,
    type: Google.Protobuf.Duration,
    json_name: "resolverTimeout",
    deprecated: false

  field :upstream_resolvers, 2,
    repeated: true,
    type: Envoy.Config.Core.V3.Address,
    json_name: "upstreamResolvers",
    deprecated: true

  field :dns_resolution_config, 5,
    type: Envoy.Config.Core.V3.DnsResolutionConfig,
    json_name: "dnsResolutionConfig",
    deprecated: true

  field :typed_dns_resolver_config, 4,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "typedDnsResolverConfig"

  field :max_pending_lookups, 3, type: :uint64, json_name: "maxPendingLookups", deprecated: false
end

defmodule Envoy.Extensions.Filters.Udp.DnsFilter.V3.DnsFilterConfig do
  @moduledoc """
  Configuration for the DNS filter.
  [#next-free-field: 6]
  [#protodoc-title: DNS Filter]
  DNS Filter :ref:`configuration overview <config_udp_listener_filters_dns_filter>`.
  [#extension: envoy.filters.udp.dns_filter]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.udp.dns_filter.v3.DnsFilterConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false

  field :server_config, 2,
    type: Envoy.Extensions.Filters.Udp.DnsFilter.V3.DnsFilterConfig.ServerContextConfig,
    json_name: "serverConfig"

  field :client_config, 3,
    type: Envoy.Extensions.Filters.Udp.DnsFilter.V3.DnsFilterConfig.ClientContextConfig,
    json_name: "clientConfig"

  field :access_log, 4,
    repeated: true,
    type: Envoy.Config.Accesslog.V3.AccessLog,
    json_name: "accessLog"

  field :case_insensitive, 5, type: :bool, json_name: "caseInsensitive"
end
