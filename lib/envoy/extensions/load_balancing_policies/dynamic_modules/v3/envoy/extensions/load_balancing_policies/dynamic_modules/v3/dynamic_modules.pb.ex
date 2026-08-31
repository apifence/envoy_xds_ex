defmodule Envoy.Extensions.LoadBalancingPolicies.DynamicModules.V3.DynamicModulesLoadBalancerConfig do
  @moduledoc """
  Configuration for a load balancing policy implemented via dynamic modules.
  This enables custom load balancing algorithms to be implemented in dynamic modules
  (shared libraries loaded at runtime).

  The dynamic module must implement the load balancer ABI functions defined in
  :repo:`abi.h <source/extensions/dynamic_modules/abi/abi.h>`.
  [#extension: envoy.load_balancing_policies.dynamic_modules]
  [#protodoc-title: Dynamic Modules Load Balancing Policy]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.load_balancing_policies.dynamic_modules.v3.DynamicModulesLoadBalancerConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :dynamic_module_config, 1,
    type: Envoy.Extensions.DynamicModules.V3.DynamicModuleConfig,
    json_name: "dynamicModuleConfig",
    deprecated: false

  field :lb_policy_name, 2, type: :string, json_name: "lbPolicyName", deprecated: false
  field :lb_policy_config, 3, type: Google.Protobuf.Any, json_name: "lbPolicyConfig"
end
