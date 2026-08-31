defmodule Envoy.Extensions.Filters.Http.AdaptiveConcurrency.V3.GradientControllerConfig.ConcurrencyLimitCalculationParams do
  @moduledoc """
  Parameters controlling the periodic recalculation of the concurrency limit from sampled request
  latencies.
  """

  use Protobuf,
    full_name:
      "envoy.extensions.filters.http.adaptive_concurrency.v3.GradientControllerConfig.ConcurrencyLimitCalculationParams",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :max_concurrency_limit, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxConcurrencyLimit",
    deprecated: false

  field :concurrency_update_interval, 3,
    type: Google.Protobuf.Duration,
    json_name: "concurrencyUpdateInterval",
    deprecated: false

  field :min_concurrency_limit, 4,
    type: Google.Protobuf.UInt32Value,
    json_name: "minConcurrencyLimit",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.AdaptiveConcurrency.V3.GradientControllerConfig.MinimumRTTCalculationParams do
  @moduledoc """
  Parameters controlling the periodic minRTT recalculation.
  [#next-free-field: 7]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.filters.http.adaptive_concurrency.v3.GradientControllerConfig.MinimumRTTCalculationParams",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :interval, 1, type: Google.Protobuf.Duration, deprecated: false

  field :fixed_value, 6,
    type: Google.Protobuf.Duration,
    json_name: "fixedValue",
    deprecated: false

  field :request_count, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "requestCount",
    deprecated: false

  field :jitter, 3, type: Envoy.Type.V3.Percent

  field :min_concurrency, 4,
    type: Google.Protobuf.UInt32Value,
    json_name: "minConcurrency",
    deprecated: false

  field :buffer, 5, type: Envoy.Type.V3.Percent
end

defmodule Envoy.Extensions.Filters.Http.AdaptiveConcurrency.V3.GradientControllerConfig do
  @moduledoc """
  Configuration parameters for the gradient controller.
  [#protodoc-title: Adaptive Concurrency]
  Adaptive Concurrency Control :ref:`configuration overview
  <config_http_filters_adaptive_concurrency>`.
  [#extension: envoy.filters.http.adaptive_concurrency]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.adaptive_concurrency.v3.GradientControllerConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :sample_aggregate_percentile, 1,
    type: Envoy.Type.V3.Percent,
    json_name: "sampleAggregatePercentile"

  field :concurrency_limit_params, 2,
    type:
      Envoy.Extensions.Filters.Http.AdaptiveConcurrency.V3.GradientControllerConfig.ConcurrencyLimitCalculationParams,
    json_name: "concurrencyLimitParams",
    deprecated: false

  field :min_rtt_calc_params, 3,
    type:
      Envoy.Extensions.Filters.Http.AdaptiveConcurrency.V3.GradientControllerConfig.MinimumRTTCalculationParams,
    json_name: "minRttCalcParams",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.AdaptiveConcurrency.V3.AdaptiveConcurrency do
  use Protobuf,
    full_name: "envoy.extensions.filters.http.adaptive_concurrency.v3.AdaptiveConcurrency",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :concurrency_controller_config, 0

  field :gradient_controller_config, 1,
    type: Envoy.Extensions.Filters.Http.AdaptiveConcurrency.V3.GradientControllerConfig,
    json_name: "gradientControllerConfig",
    oneof: 0,
    deprecated: false

  field :enabled, 2, type: Envoy.Config.Core.V3.RuntimeFeatureFlag

  field :concurrency_limit_exceeded_status, 3,
    type: Envoy.Type.V3.HttpStatus,
    json_name: "concurrencyLimitExceededStatus"
end
