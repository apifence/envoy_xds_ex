defmodule Envoy.Config.Cluster.V3.CircuitBreakers.Thresholds.RetryBudget do
  use Protobuf,
    full_name: "envoy.config.cluster.v3.CircuitBreakers.Thresholds.RetryBudget",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :budget_percent, 1, type: Envoy.Type.V3.Percent, json_name: "budgetPercent"
  field :budget_interval, 3, type: Google.Protobuf.Duration, json_name: "budgetInterval"

  field :min_retry_concurrency, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "minRetryConcurrency"
end

defmodule Envoy.Config.Cluster.V3.CircuitBreakers.Thresholds do
  @moduledoc """
  A Thresholds defines CircuitBreaker settings for a
  :ref:`RoutingPriority<envoy_v3_api_enum_config.core.v3.RoutingPriority>`.
  [#next-free-field: 9]
  """

  use Protobuf,
    full_name: "envoy.config.cluster.v3.CircuitBreakers.Thresholds",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :priority, 1, type: Envoy.Config.Core.V3.RoutingPriority, enum: true, deprecated: false
  field :max_connections, 2, type: Google.Protobuf.UInt32Value, json_name: "maxConnections"

  field :max_pending_requests, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxPendingRequests"

  field :max_requests, 4, type: Google.Protobuf.UInt32Value, json_name: "maxRequests"
  field :max_retries, 5, type: Google.Protobuf.UInt32Value, json_name: "maxRetries"

  field :retry_budget, 8,
    type: Envoy.Config.Cluster.V3.CircuitBreakers.Thresholds.RetryBudget,
    json_name: "retryBudget"

  field :track_remaining, 6, type: :bool, json_name: "trackRemaining"

  field :max_connection_pools, 7,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxConnectionPools"
end

defmodule Envoy.Config.Cluster.V3.CircuitBreakers do
  @moduledoc """
  :ref:`Circuit breaking<arch_overview_circuit_break>` settings can be
  specified individually for each defined priority.
  [#protodoc-title: Circuit breakers]
  """

  use Protobuf,
    full_name: "envoy.config.cluster.v3.CircuitBreakers",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :thresholds, 1, repeated: true, type: Envoy.Config.Cluster.V3.CircuitBreakers.Thresholds

  field :per_host_thresholds, 2,
    repeated: true,
    type: Envoy.Config.Cluster.V3.CircuitBreakers.Thresholds,
    json_name: "perHostThresholds"
end
