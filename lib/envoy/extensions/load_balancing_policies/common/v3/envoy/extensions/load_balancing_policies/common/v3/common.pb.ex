defmodule Envoy.Extensions.LoadBalancingPolicies.Common.V3.LocalityLbConfig.ZoneAwareLbConfig.LocalityBasis do
  @moduledoc """
  Basis for computing per-locality percentages in zone-aware routing.
  """

  use Protobuf,
    enum: true,
    full_name:
      "envoy.extensions.load_balancing_policies.common.v3.LocalityLbConfig.ZoneAwareLbConfig.LocalityBasis",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :HEALTHY_HOSTS_NUM, 0
  field :HEALTHY_HOSTS_WEIGHT, 1
end

defmodule Envoy.Extensions.LoadBalancingPolicies.Common.V3.LocalityLbConfig.ZoneAwareLbConfig.ForceLocalZone do
  @moduledoc """
  Configures Envoy to always route requests to the local zone regardless of the
  upstream zone structure. In Envoy's default configuration, traffic is distributed proportionally
  across all upstream hosts while trying to maximize local routing when possible. The approach
  with force_local_zone aims to be more predictable and if there are upstream hosts in the local
  zone, they will receive all traffic.
  * :ref:`runtime values <config_cluster_manager_cluster_runtime_zone_routing>`.
  * :ref:`Zone aware routing support <arch_overview_load_balancing_zone_aware_routing>`.
  """

  use Protobuf,
    full_name:
      "envoy.extensions.load_balancing_policies.common.v3.LocalityLbConfig.ZoneAwareLbConfig.ForceLocalZone",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :min_size, 1, type: Google.Protobuf.UInt32Value, json_name: "minSize"
end

defmodule Envoy.Extensions.LoadBalancingPolicies.Common.V3.LocalityLbConfig.ZoneAwareLbConfig do
  @moduledoc """
  Configuration for :ref:`zone aware routing
  <arch_overview_load_balancing_zone_aware_routing>`.
  [#next-free-field: 7]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.load_balancing_policies.common.v3.LocalityLbConfig.ZoneAwareLbConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :routing_enabled, 1, type: Envoy.Type.V3.Percent, json_name: "routingEnabled"
  field :min_cluster_size, 2, type: Google.Protobuf.UInt64Value, json_name: "minClusterSize"
  field :fail_traffic_on_panic, 3, type: :bool, json_name: "failTrafficOnPanic"

  field :force_locality_direct_routing, 4,
    type: :bool,
    json_name: "forceLocalityDirectRouting",
    deprecated: true

  field :force_local_zone, 5,
    type:
      Envoy.Extensions.LoadBalancingPolicies.Common.V3.LocalityLbConfig.ZoneAwareLbConfig.ForceLocalZone,
    json_name: "forceLocalZone"

  field :locality_basis, 6,
    type:
      Envoy.Extensions.LoadBalancingPolicies.Common.V3.LocalityLbConfig.ZoneAwareLbConfig.LocalityBasis,
    json_name: "localityBasis",
    enum: true
end

defmodule Envoy.Extensions.LoadBalancingPolicies.Common.V3.LocalityLbConfig.LocalityWeightedLbConfig do
  @moduledoc """
  Configuration for :ref:`locality weighted load balancing
  <arch_overview_load_balancing_locality_weighted_lb>`
  """

  use Protobuf,
    full_name:
      "envoy.extensions.load_balancing_policies.common.v3.LocalityLbConfig.LocalityWeightedLbConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Extensions.LoadBalancingPolicies.Common.V3.LocalityLbConfig do
  @moduledoc """
  [#protodoc-title: Common configuration for two or more load balancing policy extensions]
  """

  use Protobuf,
    full_name: "envoy.extensions.load_balancing_policies.common.v3.LocalityLbConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :locality_config_specifier, 0

  field :zone_aware_lb_config, 1,
    type: Envoy.Extensions.LoadBalancingPolicies.Common.V3.LocalityLbConfig.ZoneAwareLbConfig,
    json_name: "zoneAwareLbConfig",
    oneof: 0

  field :locality_weighted_lb_config, 2,
    type:
      Envoy.Extensions.LoadBalancingPolicies.Common.V3.LocalityLbConfig.LocalityWeightedLbConfig,
    json_name: "localityWeightedLbConfig",
    oneof: 0
end

defmodule Envoy.Extensions.LoadBalancingPolicies.Common.V3.SlowStartConfig do
  @moduledoc """
  Configuration for :ref:`slow start mode <arch_overview_load_balancing_slow_start>`.
  """

  use Protobuf,
    full_name: "envoy.extensions.load_balancing_policies.common.v3.SlowStartConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :slow_start_window, 1, type: Google.Protobuf.Duration, json_name: "slowStartWindow"
  field :aggression, 2, type: Envoy.Config.Core.V3.RuntimeDouble
  field :min_weight_percent, 3, type: Envoy.Type.V3.Percent, json_name: "minWeightPercent"
end

defmodule Envoy.Extensions.LoadBalancingPolicies.Common.V3.ConsistentHashingLbConfig do
  @moduledoc """
  Common Configuration for all consistent hashing load balancers (MaglevLb, RingHashLb, etc.)
  """

  use Protobuf,
    full_name: "envoy.extensions.load_balancing_policies.common.v3.ConsistentHashingLbConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :use_hostname_for_hashing, 1, type: :bool, json_name: "useHostnameForHashing"

  field :hash_balance_factor, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "hashBalanceFactor",
    deprecated: false

  field :hash_policy, 3,
    repeated: true,
    type: Envoy.Config.Route.V3.RouteAction.HashPolicy,
    json_name: "hashPolicy"
end

defmodule Envoy.Extensions.LoadBalancingPolicies.Common.V3.OrcaOobReportingConfig do
  @moduledoc """
  Connection overrides for the ORCA out-of-band (OOB) reporting stream, used by
  load balancing policies that consume ORCA load reports (e.g.
  :ref:`client_side_weighted_round_robin
  <envoy_v3_api_msg_extensions.load_balancing_policies.client_side_weighted_round_robin.v3.ClientSideWeightedRoundRobin>`).
  Whether and when OOB reporting runs is controlled by the embedding policy.
  """

  use Protobuf,
    full_name: "envoy.extensions.load_balancing_policies.common.v3.OrcaOobReportingConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :port_value, 1, type: :uint32, json_name: "portValue", deprecated: false
  field :authority, 2, type: :string, deprecated: false

  field :transport_socket_match_criteria, 3,
    type: Google.Protobuf.Struct,
    json_name: "transportSocketMatchCriteria"
end
