defmodule Envoy.Extensions.Filters.Http.McpRouter.V3.ValidationPolicy.Mode do
  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.filters.http.mcp_router.v3.ValidationPolicy.Mode",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :MODE_UNSPECIFIED, 0
  field :DISABLED, 1
  field :ENFORCE, 2
end

defmodule Envoy.Extensions.Filters.Http.McpRouter.V3.HeaderSource do
  @moduledoc """
  Extract identity from a request header.
  [#protodoc-title: MCP Multiplexer/Demultiplexer]
  [#extension: envoy.filters.http.mcp_router]
  Configuration for the MCP Multiplexer/Demultiplexer.

  This extension aggregates capabilities, tools and resources of remote MCP servers and presents Envoy
  as a singe MCP server to the client. This allows a unified policy to be applied to multiple remote
  servers and abstracts multiple MCP servers as a single one.

  This filter must be a terminal filter in the filter chain and replaces the HTTP router filter.

  Not all route level policies are applicable to this filter.
  Specifically the following policies are ignored:
  * :ref:`route <envoy_v3_api_field_config.route.v3.Route.route>`
  * :ref:`redirect <envoy_v3_api_field_config.route.v3.Route.redirect>`
  * :ref:`direct_response <envoy_v3_api_field_config.route.v3.Route.direct_response>`
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.mcp_router.v3.HeaderSource",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.McpRouter.V3.DynamicMetadataSource do
  @moduledoc """
  Extract identity from dynamic metadata (e.g., populated by JWT or ext_authz filter).
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.mcp_router.v3.DynamicMetadataSource",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: Envoy.Type.Metadata.V3.MetadataKey, deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.McpRouter.V3.IdentityExtractor do
  @moduledoc """
  Defines how the identity (user/principal) is extracted from the request.
  Exactly one of ``header`` or ``dynamic_metadata`` must be set.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.mcp_router.v3.IdentityExtractor",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :header, 1, type: Envoy.Extensions.Filters.Http.McpRouter.V3.HeaderSource

  field :dynamic_metadata, 2,
    type: Envoy.Extensions.Filters.Http.McpRouter.V3.DynamicMetadataSource,
    json_name: "dynamicMetadata"
end

defmodule Envoy.Extensions.Filters.Http.McpRouter.V3.ValidationPolicy do
  @moduledoc """
  Specifies how to handle requests where the identity is missing or mismatched.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.mcp_router.v3.ValidationPolicy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :mode, 1,
    type: Envoy.Extensions.Filters.Http.McpRouter.V3.ValidationPolicy.Mode,
    enum: true,
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.McpRouter.V3.SessionIdentity do
  @moduledoc """
  Session identity configuration.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.mcp_router.v3.SessionIdentity",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :identity, 1,
    type: Envoy.Extensions.Filters.Http.McpRouter.V3.IdentityExtractor,
    deprecated: false

  field :validation, 2, type: Envoy.Extensions.Filters.Http.McpRouter.V3.ValidationPolicy
end

defmodule Envoy.Extensions.Filters.Http.McpRouter.V3.McpRouter.McpBackend do
  @moduledoc """
  Specification of the MCP server.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.mcp_router.v3.McpRouter.McpBackend",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :name, 1, type: :string

  field :mcp_cluster, 2,
    type: Envoy.Extensions.Filters.Http.McpRouter.V3.McpRouter.McpCluster,
    json_name: "mcpCluster"
end

defmodule Envoy.Extensions.Filters.Http.McpRouter.V3.McpRouter.McpCluster do
  @moduledoc """
  Cluster-based backend configuration.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.mcp_router.v3.McpRouter.McpCluster",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :cluster, 1, type: :string, deprecated: false
  field :path, 2, type: :string
  field :timeout, 3, type: Google.Protobuf.Duration
  field :host_rewrite_literal, 4, type: :string, json_name: "hostRewriteLiteral"
end

defmodule Envoy.Extensions.Filters.Http.McpRouter.V3.McpRouter do
  use Protobuf,
    full_name: "envoy.extensions.filters.http.mcp_router.v3.McpRouter",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :servers, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.McpRouter.V3.McpRouter.McpBackend

  field :session_identity, 2,
    type: Envoy.Extensions.Filters.Http.McpRouter.V3.SessionIdentity,
    json_name: "sessionIdentity"

  field :lazy_initialization, 3, type: :bool, json_name: "lazyInitialization"
end
