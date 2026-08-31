defmodule Envoy.Extensions.Filters.Http.McpJsonRestBridge.V3.McpJsonRestBridge.RequestStorageMode do
  @moduledoc """
  Where to store parsed MCP request attributes.
  """

  use Protobuf,
    enum: true,
    full_name:
      "envoy.extensions.filters.http.mcp_json_rest_bridge.v3.McpJsonRestBridge.RequestStorageMode",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :MODE_UNSPECIFIED, 0
  field :DYNAMIC_METADATA, 1
end

defmodule Envoy.Extensions.Filters.Http.McpJsonRestBridge.V3.McpJsonRestBridge do
  @moduledoc """
  Configuration for the MCP MCP JSON REST Bridge.

  This extension translates Model Context Protocol (MCP) JSON-RPC requests into standard JSON-REST
  HTTP requests. This enables existing REST backends to function as MCP servers without native MCP
  support.

  Main functionalities:

  1. Transcoding: Converts JSON-RPC request payload to HTTP REST request, and maps JSON response
     back to JSON-RPC.
  2. Session negotiation: Handles MCP connection prerequisites.

  The core logic transforms "tools/call" request into HTTP request following the ``HttpRule``
  specification.

  Example 1: GET request with path and query parameters

  .. code-block:: text

    tools: {
      name: "getResource"
      http_rule: {
        get: "/v1/projects/{project_id}/resources/{resource_id}"
        // body is omitted for GET
      }
    }
    If tools/call params are:
    { "name": "getResource", "arguments": {"project_id": "foo", "resource_id": "res-789", "view": "FULL"} }
    Translation:
    - Method: GET
    - URL: /v1/projects/foo/resources/res-789?view=FULL
      (Arguments not matching path templates become query parameters.)

  Example 2: POST request with wildcard body

  .. code-block:: text

    tools: {
      name: "createResource"
      http_rule: {
        post: "/v1/projects/{project_id}/resources"
        body: "*"
      }
    }
    If tools/call params are:
    { "name": "createResource", "arguments": {"project_id": "foo", "resource_id": "res-456", "payload": { "data": "some value" }} }
    Translation:
    - Method: POST
    - URL: /v1/projects/foo/resources
    - Body: {"resource_id": "res-456", "payload": { "data": "some value" }}
      (Arguments not used in the path form the body, as per body: "*".)

  Example 3: PUT request with a specific field as body

  .. code-block:: text

    tools: {
      name: "updateResource"
      http_rule: {
        put: "/v1/projects/{project_id}"
        body: "payload"
      }
    }
    If tools/call params are:
    { "name": "updateResource", "arguments": {"project_id": "foo", "resource_id": "res-456", "payload": { "data": "updated value" }} }
    Translation:
    - Method: PUT
    - URL: /v1/projects/foo?resource_id=res-456
    - Body: {"data": "updated value"}
      (Only the "payload" field from arguments is used as the body. Other arguments not in the
      path, like 'resource_id', become query parameters.)
  [#next-free-field: 9]
  [#protodoc-title: MCP JSON REST Bridge]
  [#extension: envoy.filters.http.mcp_json_rest_bridge]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.mcp_json_rest_bridge.v3.McpJsonRestBridge",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :server_info, 1,
    type: Envoy.Extensions.Filters.Http.McpJsonRestBridge.V3.ServerInfo,
    json_name: "serverInfo"

  field :tool_config, 2,
    type: Envoy.Extensions.Filters.Http.McpJsonRestBridge.V3.ServerToolConfig,
    json_name: "toolConfig"

  field :max_request_body_size, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxRequestBodySize"

  field :max_response_body_size, 4,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxResponseBodySize"

  field :request_storage_mode, 5,
    type: Envoy.Extensions.Filters.Http.McpJsonRestBridge.V3.McpJsonRestBridge.RequestStorageMode,
    json_name: "requestStorageMode",
    enum: true,
    deprecated: false

  field :trace_context_extraction, 6,
    type: Envoy.Extensions.Filters.Http.McpJsonRestBridge.V3.TraceContextExtractionOptions,
    json_name: "traceContextExtraction"

  field :disable_clear_route_cache, 7, type: :bool, json_name: "disableClearRouteCache"
  field :per_route_only, 8, type: :bool, json_name: "perRouteOnly"
end

defmodule Envoy.Extensions.Filters.Http.McpJsonRestBridge.V3.TraceContextExtractionOptions do
  @moduledoc """
  Options for trace context extraction.
  """

  use Protobuf,
    full_name:
      "envoy.extensions.filters.http.mcp_json_rest_bridge.v3.TraceContextExtractionOptions",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Extensions.Filters.Http.McpJsonRestBridge.V3.ServerInfo do
  @moduledoc """
  Configuration for the server metadata.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.mcp_json_rest_bridge.v3.ServerInfo",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :supported_protocol_versions, 1,
    repeated: true,
    type: :string,
    json_name: "supportedProtocolVersions"

  field :description, 2, type: :string

  field :fallback_protocol_version, 3,
    type: Google.Protobuf.StringValue,
    json_name: "fallbackProtocolVersion"
end

defmodule Envoy.Extensions.Filters.Http.McpJsonRestBridge.V3.ToolsListLocal do
  @moduledoc """
  Configuration for sending locally-generated responses to tools/list requests.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.mcp_json_rest_bridge.v3.ToolsListLocal",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Extensions.Filters.Http.McpJsonRestBridge.V3.ServerToolConfig do
  @moduledoc """
  Configuration for the MCP tool capability of the server.
  [#next-free-field: 6]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.mcp_json_rest_bridge.v3.ServerToolConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :tool_list_config, 0

  field :tools, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.McpJsonRestBridge.V3.ToolConfig

  field :list_changed, 2, type: :bool, json_name: "listChanged"

  field :tool_list_http_rule, 3,
    type: Envoy.Extensions.Filters.Http.McpJsonRestBridge.V3.HttpRule,
    json_name: "toolListHttpRule",
    oneof: 0

  field :tool_list_local, 4,
    type: Envoy.Extensions.Filters.Http.McpJsonRestBridge.V3.ToolsListLocal,
    json_name: "toolListLocal",
    oneof: 0

  field :default_server_info, 5,
    type: Envoy.Extensions.Filters.Http.McpJsonRestBridge.V3.McpServerInfo,
    json_name: "defaultServerInfo"
end

defmodule Envoy.Extensions.Filters.Http.McpJsonRestBridge.V3.ToolsListSpecificConfig do
  @moduledoc """
  Configuration for a tool's entry in tools/list responses.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.mcp_json_rest_bridge.v3.ToolsListSpecificConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :title, 1, type: :string
  field :description, 2, type: :string
  field :input_schema, 3, type: :string, json_name: "inputSchema"
end

defmodule Envoy.Extensions.Filters.Http.McpJsonRestBridge.V3.McpServerInfo do
  use Protobuf,
    full_name: "envoy.extensions.filters.http.mcp_json_rest_bridge.v3.McpServerInfo",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :path, 1, type: :string
  field :host, 2, type: :string
end

defmodule Envoy.Extensions.Filters.Http.McpJsonRestBridge.V3.ToolConfig do
  @moduledoc """
  [#next-free-field: 6]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.mcp_json_rest_bridge.v3.ToolConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false

  field :http_rule, 2,
    type: Envoy.Extensions.Filters.Http.McpJsonRestBridge.V3.HttpRule,
    json_name: "httpRule"

  field :tool_list_config, 3,
    type: Envoy.Extensions.Filters.Http.McpJsonRestBridge.V3.ToolsListSpecificConfig,
    json_name: "toolListConfig"

  field :text_content_streaming_enabled, 4, type: :bool, json_name: "textContentStreamingEnabled"

  field :server_info, 5,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.McpJsonRestBridge.V3.McpServerInfo,
    json_name: "serverInfo"
end

defmodule Envoy.Extensions.Filters.Http.McpJsonRestBridge.V3.HttpRule do
  @moduledoc """
  Defines the schema of the JSON-RPC to REST mapping. It specifies how the "arguments"
  in a tools/call request are mapped to the URL path, query parameters, and HTTP request body.

  Mapping Rules:

  1. Path: Fields defined in the path template (e.g., ``/v1/resources/{id}``) are extracted from
     arguments and placed in the URL.
  2. Body: Determined by the ``body`` field.
     - If "*": All arguments not used in the path become the HTTP JSON body.
     - If specify a field: Only that specific argument becomes the HTTP JSON body.
     - If empty: No body is sent.
  3. Query: Any leaf arguments not mapped to Path or Body are added as URL query parameters.
  [#next-free-field: 7]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.mcp_json_rest_bridge.v3.HttpRule",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :get, 1, type: :string
  field :put, 2, type: :string
  field :post, 3, type: :string
  field :delete, 4, type: :string
  field :patch, 5, type: :string
  field :body, 6, type: :string
end

defmodule Envoy.Extensions.Filters.Http.McpJsonRestBridge.V3.McpJsonRestBridgePerRoute do
  @moduledoc """
  Per-route override configuration for the MCP JSON REST Bridge filter.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.mcp_json_rest_bridge.v3.McpJsonRestBridgePerRoute",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :tool_config, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.McpJsonRestBridge.V3.ServerToolConfig,
    json_name: "toolConfig"
end
