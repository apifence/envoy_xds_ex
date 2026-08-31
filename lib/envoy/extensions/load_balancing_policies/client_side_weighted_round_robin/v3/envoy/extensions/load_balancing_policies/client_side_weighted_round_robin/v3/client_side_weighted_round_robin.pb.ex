defmodule Envoy.Extensions.LoadBalancingPolicies.ClientSideWeightedRoundRobin.V3.ClientSideWeightedRoundRobin do
  @moduledoc """
  Configuration for the client_side_weighted_round_robin LB policy.

  This policy differs from the built-in ROUND_ROBIN policy in terms of
  how the endpoint weights are determined. In the ROUND_ROBIN policy,
  the endpoint weights are sent by the control plane via EDS. However,
  in this policy, the endpoint weights are instead determined via qps (queries
  per second), eps (errors per second), and utilization metrics sent by the
  endpoint using the Open Request Cost Aggregation (ORCA) protocol. All queries
  count toward qps, regardless of result. Only failed queries count toward eps.
  A config parameter error_utilization_penalty controls the penalty to adjust
  endpoint weights using eps and qps. The weight of a given endpoint is computed
  as: ``qps / (utilization + eps/qps * error_utilization_penalty)``.

  For a load report to update an endpoint's weight, it must set :ref:`rps_fractional
  <envoy_v3_api_field_.xds.data.orca.v3.OrcaLoadReport.rps_fractional>` (used as
  qps) greater than 0, and the final utilization (resolved utilization plus any
  error penalty) must be greater than 0. Resolved utilization (see
  :ref:`metric_names_for_computing_utilization
  <envoy_v3_api_field_extensions.load_balancing_policies.client_side_weighted_round_robin.v3.ClientSideWeightedRoundRobin.metric_names_for_computing_utilization>`)
  is used as the baseline. Reports that fail to do so are ignored, and an endpoint
  with no valid weight is assigned the median weight of the endpoints that have one.

  Note that Envoy will forward the ORCA response headers/trailers from the upstream
  cluster to the downstream client. This means that if the downstream client is also
  configured to use ``client_side_weighted_round_robin`` it will load balance against
  Envoy based on upstream weights. This can happen when Envoy is used as a reverse proxy.
  To avoid this issue you can configure the :ref:`header_mutation filter  <envoy_v3_api_msg_extensions.filters.http.header_mutation.v3.HeaderMutation>` to remove
  the ORCA payload from the response headers/trailers.

  See the :ref:`load balancing architecture
  overview<arch_overview_load_balancing_types>` for more information.

  [#next-free-field: 10]
  [#protodoc-title: Client-Side Weighted Round Robin Load Balancing Policy]
  [#extension: envoy.load_balancing_policies.client_side_weighted_round_robin]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.load_balancing_policies.client_side_weighted_round_robin.v3.ClientSideWeightedRoundRobin",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :enable_oob_load_report, 1,
    type: Google.Protobuf.BoolValue,
    json_name: "enableOobLoadReport"

  field :oob_reporting_period, 2, type: Google.Protobuf.Duration, json_name: "oobReportingPeriod"
  field :blackout_period, 3, type: Google.Protobuf.Duration, json_name: "blackoutPeriod"

  field :weight_expiration_period, 4,
    type: Google.Protobuf.Duration,
    json_name: "weightExpirationPeriod"

  field :weight_update_period, 5, type: Google.Protobuf.Duration, json_name: "weightUpdatePeriod"

  field :error_utilization_penalty, 6,
    type: Google.Protobuf.FloatValue,
    json_name: "errorUtilizationPenalty",
    deprecated: false

  field :metric_names_for_computing_utilization, 7,
    repeated: true,
    type: :string,
    json_name: "metricNamesForComputingUtilization"

  field :slow_start_config, 8,
    type: Envoy.Extensions.LoadBalancingPolicies.Common.V3.SlowStartConfig,
    json_name: "slowStartConfig"

  field :oob_reporting_config, 9,
    type: Envoy.Extensions.LoadBalancingPolicies.Common.V3.OrcaOobReportingConfig,
    json_name: "oobReportingConfig"
end
