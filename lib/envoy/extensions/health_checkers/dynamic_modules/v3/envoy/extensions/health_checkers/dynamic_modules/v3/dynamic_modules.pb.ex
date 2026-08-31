defmodule Envoy.Extensions.HealthCheckers.DynamicModules.V3.DynamicModuleHealthCheck do
  @moduledoc """
  Configuration for the Dynamic Modules Health Checker. This health checker allows loading shared
  object files via ``dlopen`` to implement custom active health checking behavior.

  A module can be loaded by multiple health checkers; the module is loaded only once and shared
  across multiple health checker instances.

  Envoy drives the standard per-host interval and timeout timers and applies the common
  ``interval``, ``timeout``, ``healthy_threshold`` and ``unhealthy_threshold`` settings. On each
  interval the module is asked to check the host; it may perform the work on its own thread and
  reports the host's health status back to Envoy.
  [#protodoc-title: Dynamic Modules Health Checker]
  [#extension: envoy.health_checkers.dynamic_modules]
  """

  use Protobuf,
    full_name: "envoy.extensions.health_checkers.dynamic_modules.v3.DynamicModuleHealthCheck",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :dynamic_module_config, 1,
    type: Envoy.Extensions.DynamicModules.V3.DynamicModuleConfig,
    json_name: "dynamicModuleConfig",
    deprecated: false

  field :health_checker_name, 2, type: :string, json_name: "healthCheckerName", deprecated: false
  field :health_checker_config, 3, type: Google.Protobuf.Any, json_name: "healthCheckerConfig"
end
