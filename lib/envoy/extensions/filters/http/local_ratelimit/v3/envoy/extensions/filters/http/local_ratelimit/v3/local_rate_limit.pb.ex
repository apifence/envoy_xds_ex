defmodule Envoy.Extensions.Filters.Http.LocalRatelimit.V3.LocalRateLimit do
  @moduledoc """
  [#next-free-field: 20]
  [#protodoc-title: Local Rate limit]
  Local Rate limit :ref:`configuration overview <config_http_filters_local_rate_limit>`.
  [#extension: envoy.filters.http.local_ratelimit]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.local_ratelimit.v3.LocalRateLimit",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :status, 2, type: Envoy.Type.V3.HttpStatus
  field :token_bucket, 3, type: Envoy.Type.V3.TokenBucket, json_name: "tokenBucket"

  field :filter_enabled, 4,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "filterEnabled"

  field :filter_enforced, 5,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "filterEnforced"

  field :request_headers_to_add_when_not_enforced, 10,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "requestHeadersToAddWhenNotEnforced",
    deprecated: false

  field :response_headers_to_add, 6,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "responseHeadersToAdd",
    deprecated: false

  field :descriptors, 8,
    repeated: true,
    type: Envoy.Extensions.Common.Ratelimit.V3.LocalRateLimitDescriptor

  field :stage, 9, type: :uint32, deprecated: false

  field :local_rate_limit_per_downstream_connection, 11,
    type: :bool,
    json_name: "localRateLimitPerDownstreamConnection"

  field :local_cluster_rate_limit, 16,
    type: Envoy.Extensions.Common.Ratelimit.V3.LocalClusterRateLimit,
    json_name: "localClusterRateLimit"

  field :enable_x_ratelimit_headers, 12,
    type: Envoy.Extensions.Common.Ratelimit.V3.XRateLimitHeadersRFCVersion,
    json_name: "enableXRatelimitHeaders",
    enum: true,
    deprecated: false

  field :vh_rate_limits, 13,
    type: Envoy.Extensions.Common.Ratelimit.V3.VhRateLimitsOptions,
    json_name: "vhRateLimits",
    enum: true,
    deprecated: false

  field :always_consume_default_token_bucket, 14,
    type: Google.Protobuf.BoolValue,
    json_name: "alwaysConsumeDefaultTokenBucket"

  field :rate_limited_as_resource_exhausted, 15,
    type: :bool,
    json_name: "rateLimitedAsResourceExhausted"

  field :rate_limits, 17,
    repeated: true,
    type: Envoy.Config.Route.V3.RateLimit,
    json_name: "rateLimits"

  field :max_dynamic_descriptors, 18,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxDynamicDescriptors",
    deprecated: false

  field :enable_retry_after_header, 19, type: :bool, json_name: "enableRetryAfterHeader"
end
