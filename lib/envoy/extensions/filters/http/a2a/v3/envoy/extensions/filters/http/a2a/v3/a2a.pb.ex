defmodule Envoy.Extensions.Filters.Http.A2a.V3.A2a.TrafficMode do
  @moduledoc """
  Traffic handling mode for non-A2A traffic.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.filters.http.a2a.v3.A2a.TrafficMode",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :PASS_THROUGH, 0
  field :REJECT, 1
end

defmodule Envoy.Extensions.Filters.Http.A2a.V3.A2a.StorageMode do
  @moduledoc """
  Where to store parsed A2A message attributes.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.filters.http.a2a.v3.A2a.StorageMode",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :NONE, 0
  field :DYNAMIC_METADATA, 1
  field :FILTER_STATE, 2
  field :DYNAMIC_METADATA_AND_FILTER_STATE, 3
end

defmodule Envoy.Extensions.Filters.Http.A2a.V3.A2a do
  @moduledoc """
  This filter will inspect and get attributes from A2A traffic.
  [#next-free-field: 6]
  [#protodoc-title: A2A]
  A2A filter :ref:`configuration overview <config_http_filters_a2a>`.
  [#extension: envoy.filters.http.a2a]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.a2a.v3.A2a",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :traffic_mode, 1,
    type: Envoy.Extensions.Filters.Http.A2a.V3.A2a.TrafficMode,
    json_name: "trafficMode",
    enum: true,
    deprecated: false

  field :max_request_body_size, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxRequestBodySize",
    deprecated: false

  field :parser_config, 4,
    type: Envoy.Extensions.Filters.Http.A2a.V3.ParserConfig,
    json_name: "parserConfig"

  field :storage_mode, 5,
    type: Envoy.Extensions.Filters.Http.A2a.V3.A2a.StorageMode,
    json_name: "storageMode",
    enum: true,
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.A2a.V3.MethodParsingConfig do
  use Protobuf,
    full_name: "envoy.extensions.filters.http.a2a.v3.MethodParsingConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :group, 1, type: :string
  field :paths, 2, repeated: true, type: :string
end

defmodule Envoy.Extensions.Filters.Http.A2a.V3.ParserConfig.MethodConfigsEntry do
  use Protobuf,
    full_name: "envoy.extensions.filters.http.a2a.v3.ParserConfig.MethodConfigsEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Extensions.Filters.Http.A2a.V3.MethodParsingConfig
end

defmodule Envoy.Extensions.Filters.Http.A2a.V3.ParserConfig do
  use Protobuf,
    full_name: "envoy.extensions.filters.http.a2a.v3.ParserConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :method_configs, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.A2a.V3.ParserConfig.MethodConfigsEntry,
    json_name: "methodConfigs",
    map: true

  field :always_extract_attributes, 2,
    repeated: true,
    type: :string,
    json_name: "alwaysExtractAttributes"

  field :group_metadata_key, 3, type: :string, json_name: "groupMetadataKey"
end
