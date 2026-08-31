defmodule Envoy.Extensions.Matching.Http.DynamicModules.V3.HttpDynamicModuleMatchInput do
  @moduledoc """
  Configuration for the dynamic modules HTTP match input. This input extracts HTTP request and
  response data from the matching context and makes it available to the dynamic module matcher
  via ABI callbacks during match evaluation.

  This data input should be used together with the
  :ref:`dynamic modules input matcher
  <envoy_v3_api_msg_extensions.matching.input_matchers.dynamic_modules.v3.DynamicModuleMatcher>`.
  [#protodoc-title: Dynamic Modules HTTP Match Input]
  [#extension: envoy.matching.inputs.dynamic_module_data_input]
  """

  use Protobuf,
    full_name: "envoy.extensions.matching.http.dynamic_modules.v3.HttpDynamicModuleMatchInput",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Extensions.Matching.Http.DynamicModules.V3.DynamicModuleDataInput do
  @moduledoc """
  Configuration for the dynamic modules data input. This input loads a shared object file
  via ``dlopen`` and invokes it during match evaluation to extract a value from the HTTP
  request and response. The extracted value is a string that an exact match map can dispatch on,
  so a module can select one of many matches with a single evaluation.

  Unlike :ref:`HttpDynamicModuleMatchInput
  <envoy_v3_api_msg_extensions.matching.http.dynamic_modules.v3.HttpDynamicModuleMatchInput>`, the
  module produces the value directly rather than pairing with the dynamic modules input matcher.
  [#extension: envoy.matching.inputs.dynamic_module_string_data_input]
  """

  use Protobuf,
    full_name: "envoy.extensions.matching.http.dynamic_modules.v3.DynamicModuleDataInput",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :dynamic_module_config, 1,
    type: Envoy.Extensions.DynamicModules.V3.DynamicModuleConfig,
    json_name: "dynamicModuleConfig",
    deprecated: false

  field :input_name, 2, type: :string, json_name: "inputName"
  field :input_config, 3, type: Google.Protobuf.Any, json_name: "inputConfig"
end
