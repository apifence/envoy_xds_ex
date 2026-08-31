defmodule Envoy.Extensions.Formatter.DynamicModules.V3.DynamicModuleFormatter do
  @moduledoc """
  Configuration for the Dynamic Modules Formatter. This formatter allows loading shared object
  files via ``dlopen`` to implement custom ``%COMMAND%`` operators for access logs and header
  formatting.

  A module can be loaded by multiple formatters; the module is loaded only once and shared across
  multiple command parser instances. Each parsed command produces a provider that is invoked on the
  worker threads to compute the substitution value, with access to request and response headers,
  stream info attributes, dynamic metadata, and the local reply body.
  [#protodoc-title: Dynamic Modules Formatter]
  [#extension: envoy.formatter.dynamic_modules]
  """

  use Protobuf,
    full_name: "envoy.extensions.formatter.dynamic_modules.v3.DynamicModuleFormatter",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :dynamic_module_config, 1,
    type: Envoy.Extensions.DynamicModules.V3.DynamicModuleConfig,
    json_name: "dynamicModuleConfig",
    deprecated: false

  field :formatter_name, 2, type: :string, json_name: "formatterName"
  field :formatter_config, 3, type: Google.Protobuf.Any, json_name: "formatterConfig"
end
