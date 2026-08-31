defmodule Envoy.Extensions.LoadBalancingPolicies.LoadAwareLocality.V3.LoadAwareLocality do
  @moduledoc """
  Configuration for the load_aware_locality LB policy which uses ORCA utilization data
  to route traffic between localities based on available headroom.
  [#next-free-field: 10]
  [#protodoc-title: Load-Aware Locality-Picking Load Balancing Policy]
  [#extension: envoy.load_balancing_policies.load_aware_locality]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.load_balancing_policies.load_aware_locality.v3.LoadAwareLocality",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :endpoint_picking_policy, 1,
    type: Envoy.Config.Cluster.V3.LoadBalancingPolicy,
    json_name: "endpointPickingPolicy",
    deprecated: false

  field :weight_update_period, 2,
    type: Google.Protobuf.Duration,
    json_name: "weightUpdatePeriod",
    deprecated: false

  field :metric_names_for_computing_utilization, 3,
    repeated: true,
    type: :string,
    json_name: "metricNamesForComputingUtilization"

  field :utilization_variance_threshold, 4,
    type: Google.Protobuf.DoubleValue,
    json_name: "utilizationVarianceThreshold",
    deprecated: false

  field :smoothing_time_constant, 5,
    type: Google.Protobuf.Duration,
    json_name: "smoothingTimeConstant",
    deprecated: false

  field :remote_probe_fraction, 6,
    type: Google.Protobuf.DoubleValue,
    json_name: "remoteProbeFraction",
    deprecated: false

  field :weight_expiration_period, 7,
    type: Google.Protobuf.Duration,
    json_name: "weightExpirationPeriod",
    deprecated: false

  field :enable_oob_load_report, 8,
    type: Google.Protobuf.BoolValue,
    json_name: "enableOobLoadReport"

  field :oob_reporting_period, 9, type: Google.Protobuf.Duration, json_name: "oobReportingPeriod"
end
