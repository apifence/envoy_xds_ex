defmodule Envoy.Extensions.Clusters.DynamicModules.V3.ClusterConfig do
  @moduledoc """
  Configuration for the dynamic modules cluster.

  This cluster type delegates host discovery and load balancing to a dynamic module. The module
  manages hosts via callbacks such as ``envoy_dynamic_module_callback_cluster_add_host`` and
  ``envoy_dynamic_module_callback_cluster_remove_host``. The cluster must use
  ``lb_policy: CLUSTER_PROVIDED`` since the module provides its own load balancer.

  [#extension: envoy.clusters.dynamic_modules]
  [#protodoc-title: Dynamic Modules Cluster]
  """

  use Protobuf,
    full_name: "envoy.extensions.clusters.dynamic_modules.v3.ClusterConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :dynamic_module_config, 1,
    type: Envoy.Extensions.DynamicModules.V3.DynamicModuleConfig,
    json_name: "dynamicModuleConfig",
    deprecated: false

  field :cluster_name, 2, type: :string, json_name: "clusterName", deprecated: false
  field :cluster_config, 3, type: Google.Protobuf.Any, json_name: "clusterConfig"
end
