defmodule Envoy.Extensions.GeoipProviders.Common.V3.CommonGeoipProviderConfig.GeolocationHeadersToAdd do
  @moduledoc """
  The set of geolocation headers to add to request. If any of the configured headers is present
  in the incoming request, it will be overridden by the :ref:`HTTP GeoIP filter <config_http_filters_geoip>`.
  [#next-free-field: 14]

  .. attention::
    This field is deprecated in favor of :ref:`geo_field_keys
    <envoy_v3_api_field_extensions.geoip_providers.common.v3.CommonGeoipProviderConfig.geo_field_keys>`.
  """

  use Protobuf,
    full_name:
      "envoy.extensions.geoip_providers.common.v3.CommonGeoipProviderConfig.GeolocationHeadersToAdd",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :country, 1, type: :string, deprecated: false
  field :city, 2, type: :string, deprecated: false
  field :region, 3, type: :string, deprecated: false
  field :asn, 4, type: :string, deprecated: false
  field :asn_org, 13, type: :string, json_name: "asnOrg", deprecated: false
  field :is_anon, 5, type: :string, json_name: "isAnon", deprecated: true
  field :anon, 12, type: :string, deprecated: false
  field :anon_vpn, 6, type: :string, json_name: "anonVpn", deprecated: false
  field :anon_hosting, 7, type: :string, json_name: "anonHosting", deprecated: false
  field :anon_tor, 8, type: :string, json_name: "anonTor", deprecated: false
  field :anon_proxy, 9, type: :string, json_name: "anonProxy", deprecated: false
  field :isp, 10, type: :string, deprecated: false
  field :apple_private_relay, 11, type: :string, json_name: "applePrivateRelay", deprecated: false
end

defmodule Envoy.Extensions.GeoipProviders.Common.V3.CommonGeoipProviderConfig.GeolocationFieldKeys do
  @moduledoc """
  The set of geolocation field keys to use for storing lookup results.
  These keys define how the geolocation lookup results will be stored. The actual storage
  mechanism depends on the filter using the provider:

  - The :ref:`HTTP GeoIP filter <config_http_filters_geoip>` stores results as HTTP request headers.
  - The :ref:`Network GeoIP filter <config_network_filters_geoip>` stores results in the
    connection's filter state under the well-known key ``envoy.geoip``.

  [#next-free-field: 13]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.geoip_providers.common.v3.CommonGeoipProviderConfig.GeolocationFieldKeys",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :country, 1, type: :string
  field :city, 2, type: :string
  field :region, 3, type: :string
  field :asn, 4, type: :string
  field :asn_org, 12, type: :string, json_name: "asnOrg"
  field :anon, 5, type: :string
  field :anon_vpn, 6, type: :string, json_name: "anonVpn"
  field :anon_hosting, 7, type: :string, json_name: "anonHosting"
  field :anon_tor, 8, type: :string, json_name: "anonTor"
  field :anon_proxy, 9, type: :string, json_name: "anonProxy"
  field :isp, 10, type: :string
  field :apple_private_relay, 11, type: :string, json_name: "applePrivateRelay"
end

defmodule Envoy.Extensions.GeoipProviders.Common.V3.CommonGeoipProviderConfig do
  @moduledoc """
  [#protodoc-title: Common Geolocation Provider Configuration]
  Common geolocation provider :ref:`configuration overview <config_geoip_providers_common>`.
  Common configuration shared across geolocation providers.
  """

  use Protobuf,
    full_name: "envoy.extensions.geoip_providers.common.v3.CommonGeoipProviderConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :geo_headers_to_add, 1,
    type:
      Envoy.Extensions.GeoipProviders.Common.V3.CommonGeoipProviderConfig.GeolocationHeadersToAdd,
    json_name: "geoHeadersToAdd",
    deprecated: true

  field :geo_field_keys, 3,
    type:
      Envoy.Extensions.GeoipProviders.Common.V3.CommonGeoipProviderConfig.GeolocationFieldKeys,
    json_name: "geoFieldKeys"
end
