defmodule Envoy.Extensions.StatSinks.DynamicModules.V3.DynamicModuleStatsSink do
  @moduledoc """
  Configuration for the Dynamic Modules Stats Sink. This sink allows loading shared object
  files via ``dlopen`` to implement custom stats sink behavior.

  A module can be loaded by multiple stat sinks. It is loaded only once and shared
  across multiple sink instances.

  The stats sink receives periodic metric snapshots of counters, gauges, and text readouts,
  and is also called synchronously when histogram observations are recorded.
  [#protodoc-title: Dynamic Modules Stats Sink]
  [#extension: envoy.stat_sinks.dynamic_modules]
  """

  use Protobuf,
    full_name: "envoy.extensions.stat_sinks.dynamic_modules.v3.DynamicModuleStatsSink",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :dynamic_module_config, 1,
    type: Envoy.Extensions.DynamicModules.V3.DynamicModuleConfig,
    json_name: "dynamicModuleConfig",
    deprecated: false

  field :sink_name, 2, type: :string, json_name: "sinkName"
  field :sink_config, 3, type: Google.Protobuf.Any, json_name: "sinkConfig"
end
