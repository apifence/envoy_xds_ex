defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimit.XRateLimitHeadersRFCVersion do
  @moduledoc """
  Defines the version of the standard to use for X-RateLimit headers.

  [#next-major-version: unify with local ratelimit, should use common.ratelimit.v3.XRateLimitHeadersRFCVersion instead.]
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.filters.http.ratelimit.v3.RateLimit.XRateLimitHeadersRFCVersion",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :OFF, 0
  field :DRAFT_VERSION_03, 1
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitPerRoute.VhRateLimitsOptions do
  @moduledoc """
  [#next-major-version: unify with local ratelimit, should use common.ratelimit.v3.VhRateLimitsOptions instead.]
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.filters.http.ratelimit.v3.RateLimitPerRoute.VhRateLimitsOptions",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :OVERRIDE, 0
  field :INCLUDE, 1
  field :IGNORE, 2
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitPerRoute.OverrideOptions do
  @moduledoc """
  The override option determines how the filter handles the cases where there is an override config at a more specific level than this one (from least to most specific: virtual host, route, cluster weight).
  [#not-implemented-hide:]
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.filters.http.ratelimit.v3.RateLimitPerRoute.OverrideOptions",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :DEFAULT, 0
  field :OVERRIDE_POLICY, 1
  field :INCLUDE_POLICY, 2
  field :IGNORE_POLICY, 3
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimit do
  @moduledoc """
  [#next-free-field: 20]
  [#protodoc-title: Rate limit]
  Rate limit :ref:`configuration overview <config_http_filters_rate_limit>`.
  [#extension: envoy.filters.http.ratelimit]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.ratelimit.v3.RateLimit",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :domain, 1, type: :string, deprecated: false
  field :stage, 2, type: :uint32, deprecated: false
  field :request_type, 3, type: :string, json_name: "requestType", deprecated: false
  field :timeout, 4, type: Google.Protobuf.Duration
  field :failure_mode_deny, 5, type: :bool, json_name: "failureModeDeny"

  field :rate_limited_as_resource_exhausted, 6,
    type: :bool,
    json_name: "rateLimitedAsResourceExhausted"

  field :rate_limit_service, 7,
    type: Envoy.Config.Ratelimit.V3.RateLimitServiceConfig,
    json_name: "rateLimitService",
    deprecated: false

  field :enable_x_ratelimit_headers, 8,
    type: Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimit.XRateLimitHeadersRFCVersion,
    json_name: "enableXRatelimitHeaders",
    enum: true,
    deprecated: false

  field :disable_x_envoy_ratelimited_header, 9,
    type: :bool,
    json_name: "disableXEnvoyRatelimitedHeader"

  field :rate_limited_status, 10, type: Envoy.Type.V3.HttpStatus, json_name: "rateLimitedStatus"

  field :response_headers_to_add, 11,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "responseHeadersToAdd",
    deprecated: false

  field :status_on_error, 12, type: Envoy.Type.V3.HttpStatus, json_name: "statusOnError"
  field :stat_prefix, 13, type: :string, json_name: "statPrefix"

  field :filter_enabled, 14,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "filterEnabled"

  field :filter_enforced, 15,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "filterEnforced"

  field :failure_mode_deny_percent, 16,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "failureModeDenyPercent"

  field :rate_limits, 17,
    repeated: true,
    type: Envoy.Config.Route.V3.RateLimit,
    json_name: "rateLimits"

  field :metadata_namespace, 18, type: :string, json_name: "metadataNamespace"
  field :enable_retry_after_header, 19, type: :bool, json_name: "enableRetryAfterHeader"
end

defmodule Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitPerRoute do
  use Protobuf,
    full_name: "envoy.extensions.filters.http.ratelimit.v3.RateLimitPerRoute",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :vh_rate_limits, 1,
    type: Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitPerRoute.VhRateLimitsOptions,
    json_name: "vhRateLimits",
    enum: true,
    deprecated: false

  field :override_option, 2,
    type: Envoy.Extensions.Filters.Http.Ratelimit.V3.RateLimitPerRoute.OverrideOptions,
    json_name: "overrideOption",
    enum: true,
    deprecated: false

  field :rate_limits, 3,
    repeated: true,
    type: Envoy.Config.Route.V3.RateLimit,
    json_name: "rateLimits"

  field :domain, 4, type: :string
end
