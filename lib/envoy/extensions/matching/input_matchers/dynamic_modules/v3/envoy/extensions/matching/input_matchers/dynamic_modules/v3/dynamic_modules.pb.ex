defmodule Envoy.Extensions.Matching.InputMatchers.DynamicModules.V3.DynamicModuleMatcher do
  @moduledoc """
  Configuration for the Dynamic Modules Input Matcher. This matcher allows loading shared object
  files via ``dlopen`` to implement custom matching logic in dynamic modules (e.g. Rust, Go).

  A module can implement arbitrary matching logic by examining request headers and other HTTP
  attributes during the match evaluation. This is useful for scenarios that require complex
  matching beyond what built-in matchers provide, such as JWT/OAuth token analysis, custom
  routing decisions, or integration with external data sources.
  [#protodoc-title: Dynamic Modules Input Matcher]
  [#extension: envoy.matching.matchers.dynamic_modules]
  """

  use Protobuf,
    full_name: "envoy.extensions.matching.input_matchers.dynamic_modules.v3.DynamicModuleMatcher",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :dynamic_module_config, 1,
    type: Envoy.Extensions.DynamicModules.V3.DynamicModuleConfig,
    json_name: "dynamicModuleConfig",
    deprecated: false

  field :matcher_name, 2, type: :string, json_name: "matcherName"
  field :matcher_config, 3, type: Google.Protobuf.Any, json_name: "matcherConfig"
end
