defmodule Envoy.Data.Core.V3.HealthCheckFailureType do
  @moduledoc """
  [#protodoc-title: Health check logging events]
  :ref:`Health check logging <arch_overview_health_check_logging>`.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.data.core.v3.HealthCheckFailureType",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :ACTIVE, 0
  field :PASSIVE, 1
  field :NETWORK, 2
  field :NETWORK_TIMEOUT, 3
end

defmodule Envoy.Data.Core.V3.HealthCheckerType do
  use Protobuf,
    enum: true,
    full_name: "envoy.data.core.v3.HealthCheckerType",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :HTTP, 0
  field :TCP, 1
  field :GRPC, 2
  field :REDIS, 3
  field :THRIFT, 4
  field :DYNAMIC_MODULE, 5
end

defmodule Envoy.Data.Core.V3.HealthCheckEvent do
  @moduledoc """
  [#next-free-field: 13]
  """

  use Protobuf,
    full_name: "envoy.data.core.v3.HealthCheckEvent",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :event, 0

  field :health_checker_type, 1,
    type: Envoy.Data.Core.V3.HealthCheckerType,
    json_name: "healthCheckerType",
    enum: true,
    deprecated: false

  field :host, 2, type: Envoy.Config.Core.V3.Address
  field :cluster_name, 3, type: :string, json_name: "clusterName", deprecated: false

  field :eject_unhealthy_event, 4,
    type: Envoy.Data.Core.V3.HealthCheckEjectUnhealthy,
    json_name: "ejectUnhealthyEvent",
    oneof: 0

  field :add_healthy_event, 5,
    type: Envoy.Data.Core.V3.HealthCheckAddHealthy,
    json_name: "addHealthyEvent",
    oneof: 0

  field :successful_health_check_event, 12,
    type: Envoy.Data.Core.V3.HealthCheckSuccessful,
    json_name: "successfulHealthCheckEvent",
    oneof: 0

  field :health_check_failure_event, 7,
    type: Envoy.Data.Core.V3.HealthCheckFailure,
    json_name: "healthCheckFailureEvent",
    oneof: 0

  field :degraded_healthy_host, 8,
    type: Envoy.Data.Core.V3.DegradedHealthyHost,
    json_name: "degradedHealthyHost",
    oneof: 0

  field :no_longer_degraded_host, 9,
    type: Envoy.Data.Core.V3.NoLongerDegradedHost,
    json_name: "noLongerDegradedHost",
    oneof: 0

  field :timestamp, 6, type: Google.Protobuf.Timestamp
  field :metadata, 10, type: Envoy.Config.Core.V3.Metadata
  field :locality, 11, type: Envoy.Config.Core.V3.Locality
end

defmodule Envoy.Data.Core.V3.HealthCheckEjectUnhealthy do
  use Protobuf,
    full_name: "envoy.data.core.v3.HealthCheckEjectUnhealthy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :failure_type, 1,
    type: Envoy.Data.Core.V3.HealthCheckFailureType,
    json_name: "failureType",
    enum: true,
    deprecated: false

  field :http_status_code, 2, type: :uint32, json_name: "httpStatusCode"
end

defmodule Envoy.Data.Core.V3.HealthCheckAddHealthy do
  use Protobuf,
    full_name: "envoy.data.core.v3.HealthCheckAddHealthy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :first_check, 1, type: :bool, json_name: "firstCheck"
end

defmodule Envoy.Data.Core.V3.HealthCheckSuccessful do
  use Protobuf,
    full_name: "envoy.data.core.v3.HealthCheckSuccessful",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Data.Core.V3.HealthCheckFailure do
  use Protobuf,
    full_name: "envoy.data.core.v3.HealthCheckFailure",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :failure_type, 1,
    type: Envoy.Data.Core.V3.HealthCheckFailureType,
    json_name: "failureType",
    enum: true,
    deprecated: false

  field :first_check, 2, type: :bool, json_name: "firstCheck"
  field :http_status_code, 3, type: :uint32, json_name: "httpStatusCode"
end

defmodule Envoy.Data.Core.V3.DegradedHealthyHost do
  use Protobuf,
    full_name: "envoy.data.core.v3.DegradedHealthyHost",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Data.Core.V3.NoLongerDegradedHost do
  use Protobuf,
    full_name: "envoy.data.core.v3.NoLongerDegradedHost",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end
