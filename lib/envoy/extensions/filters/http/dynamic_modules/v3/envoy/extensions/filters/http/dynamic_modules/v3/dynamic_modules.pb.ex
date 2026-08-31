defmodule Envoy.Extensions.Filters.Http.DynamicModules.V3.DynamicModuleFilter do
  @moduledoc """
  Configuration for the Dynamic Modules HTTP filter. This filter allows loading shared object files
  that can be loaded via ``dlopen`` to extend the HTTP filter chain.

  A module can be loaded by multiple HTTP filters; the module is loaded only once and shared across
  multiple filters.

  A dynamic module HTTP filter can opt into being a terminal filter with no upstream by setting
  :ref:`terminal_filter
  <envoy_v3_api_field_extensions.filters.http.dynamic_modules.v3.DynamicModuleFilter.terminal_filter>`
  to ``true``. A terminal dynamic module can use ``send_`` ABI methods to send response headers,
  body, and trailers to the downstream.
  [#protodoc-title: Dynamic Modules HTTP Filter]
  [#extension: envoy.filters.http.dynamic_modules]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.dynamic_modules.v3.DynamicModuleFilter",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :dynamic_module_config, 1,
    type: Envoy.Extensions.DynamicModules.V3.DynamicModuleConfig,
    json_name: "dynamicModuleConfig"

  field :filter_name, 2, type: :string, json_name: "filterName"
  field :filter_config, 3, type: Google.Protobuf.Any, json_name: "filterConfig"
  field :terminal_filter, 4, type: :bool, json_name: "terminalFilter"
end

defmodule Envoy.Extensions.Filters.Http.DynamicModules.V3.DynamicModuleFilterPerRoute do
  @moduledoc """
  Configuration of the HTTP per-route filter for dynamic modules.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.dynamic_modules.v3.DynamicModuleFilterPerRoute",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :dynamic_module_config, 1,
    type: Envoy.Extensions.DynamicModules.V3.DynamicModuleConfig,
    json_name: "dynamicModuleConfig"

  field :per_route_config_name, 2,
    type: :string,
    json_name: "perRouteConfigName",
    deprecated: true

  field :filter_name, 4, type: :string, json_name: "filterName"
  field :filter_config, 3, type: Google.Protobuf.Any, json_name: "filterConfig"
end
