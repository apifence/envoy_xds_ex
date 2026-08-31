defmodule Envoy.Extensions.Upstreams.Http.DynamicModules.V3.Config do
  @moduledoc """
  Configuration for the dynamic modules upstream HTTP TCP bridge.

  This upstream type delegates HTTP-to-TCP protocol bridging to a dynamic module. The module
  transforms HTTP request headers and body into raw TCP data for the upstream connection, and
  converts raw TCP response data back into HTTP responses for the downstream client.

  [#extension: envoy.upstreams.http.dynamic_modules]
  [#protodoc-title: Dynamic Modules Upstream HTTP TCP Bridge]
  """

  use Protobuf,
    full_name: "envoy.extensions.upstreams.http.dynamic_modules.v3.Config",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :dynamic_module_config, 1,
    type: Envoy.Extensions.DynamicModules.V3.DynamicModuleConfig,
    json_name: "dynamicModuleConfig",
    deprecated: false

  field :bridge_name, 2, type: :string, json_name: "bridgeName", deprecated: false
  field :bridge_config, 3, type: Google.Protobuf.Any, json_name: "bridgeConfig"
end
