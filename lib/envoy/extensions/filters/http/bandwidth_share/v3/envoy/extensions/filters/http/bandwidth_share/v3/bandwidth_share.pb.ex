defmodule Envoy.Extensions.Filters.Http.BandwidthShare.V3.BandwidthShare.TenantConfig do
  use Protobuf,
    full_name: "envoy.extensions.filters.http.bandwidth_share.v3.BandwidthShare.TenantConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :weight, 1, type: :uint32
  field :include_stats_tag, 2, type: :bool, json_name: "includeStatsTag"
end

defmodule Envoy.Extensions.Filters.Http.BandwidthShare.V3.BandwidthShare.Limit do
  use Protobuf,
    full_name: "envoy.extensions.filters.http.bandwidth_share.v3.BandwidthShare.Limit",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :bucket_id, 1, type: :string, json_name: "bucketId"
  field :kbps, 2, type: Envoy.Config.Core.V3.RuntimeUInt32, deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.BandwidthShare.V3.BandwidthShare.TenantConfigsEntry do
  use Protobuf,
    full_name:
      "envoy.extensions.filters.http.bandwidth_share.v3.BandwidthShare.TenantConfigsEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string

  field :value, 2,
    type: Envoy.Extensions.Filters.Http.BandwidthShare.V3.BandwidthShare.TenantConfig
end

defmodule Envoy.Extensions.Filters.Http.BandwidthShare.V3.BandwidthShare do
  @moduledoc """
  [#next-free-field: 9]
  [#protodoc-title: Bandwidth share]
  Bandwidth share :ref:`configuration overview <config_http_filters_bandwidth_share>`.
  [#extension: envoy.filters.http.bandwidth_share]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.bandwidth_share.v3.BandwidthShare",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :request_limit, 1,
    type: Envoy.Extensions.Filters.Http.BandwidthShare.V3.BandwidthShare.Limit,
    json_name: "requestLimit"

  field :response_limit, 2,
    type: Envoy.Extensions.Filters.Http.BandwidthShare.V3.BandwidthShare.Limit,
    json_name: "responseLimit"

  field :fill_interval, 3,
    type: Google.Protobuf.Duration,
    json_name: "fillInterval",
    deprecated: false

  field :enable_response_trailers, 4, type: :bool, json_name: "enableResponseTrailers"

  field :response_trailer_prefix, 5,
    type: :string,
    json_name: "responseTrailerPrefix",
    deprecated: false

  field :tenant_name_selector, 6,
    type: Xds.Type.Matcher.V3.Matcher,
    json_name: "tenantNameSelector"

  field :tenant_configs, 7,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.BandwidthShare.V3.BandwidthShare.TenantConfigsEntry,
    json_name: "tenantConfigs",
    map: true

  field :default_tenant_config, 8,
    type: Envoy.Extensions.Filters.Http.BandwidthShare.V3.BandwidthShare.TenantConfig,
    json_name: "defaultTenantConfig"
end
