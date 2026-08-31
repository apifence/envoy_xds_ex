defmodule Envoy.Extensions.Filters.Http.FileServer.V3.FileServerConfig.PathMapping do
  use Protobuf,
    full_name: "envoy.extensions.filters.http.file_server.v3.FileServerConfig.PathMapping",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :request_path_prefix, 1, type: :string, json_name: "requestPathPrefix", deprecated: false
  field :file_path_prefix, 2, type: :string, json_name: "filePathPrefix", deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.FileServer.V3.FileServerConfig.DirectoryBehavior.List do
  @moduledoc """
  [#not-implemented-hide:] Directory operations currently have no async implementation.
  """

  use Protobuf,
    full_name:
      "envoy.extensions.filters.http.file_server.v3.FileServerConfig.DirectoryBehavior.List",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Extensions.Filters.Http.FileServer.V3.FileServerConfig.DirectoryBehavior do
  use Protobuf,
    full_name: "envoy.extensions.filters.http.file_server.v3.FileServerConfig.DirectoryBehavior",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :default_file, 1, type: :string, json_name: "defaultFile", deprecated: false

  field :list, 2,
    type: Envoy.Extensions.Filters.Http.FileServer.V3.FileServerConfig.DirectoryBehavior.List
end

defmodule Envoy.Extensions.Filters.Http.FileServer.V3.FileServerConfig.ContentTypesEntry do
  use Protobuf,
    full_name: "envoy.extensions.filters.http.file_server.v3.FileServerConfig.ContentTypesEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Extensions.Filters.Http.FileServer.V3.FileServerConfig do
  @moduledoc """
  A :ref:`file server <config_http_filters_file_server>` filter configuration.
  [#next-free-field: 6]
  [#protodoc-title: FileServerConfig]
  [#extension: envoy.filters.http.file_server]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.file_server.v3.FileServerConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :manager_config, 1,
    type: Envoy.Extensions.Common.AsyncFiles.V3.AsyncFileManagerConfig,
    json_name: "managerConfig",
    deprecated: false

  field :path_mappings, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.FileServer.V3.FileServerConfig.PathMapping,
    json_name: "pathMappings"

  field :content_types, 3,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.FileServer.V3.FileServerConfig.ContentTypesEntry,
    json_name: "contentTypes",
    map: true,
    deprecated: false

  field :default_content_type, 4, type: :string, json_name: "defaultContentType"

  field :directory_behaviors, 5,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.FileServer.V3.FileServerConfig.DirectoryBehavior,
    json_name: "directoryBehaviors"
end
