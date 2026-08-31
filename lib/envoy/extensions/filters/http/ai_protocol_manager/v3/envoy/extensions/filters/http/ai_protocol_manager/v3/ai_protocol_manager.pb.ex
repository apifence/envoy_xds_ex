defmodule Envoy.Extensions.Filters.Http.AiProtocolManager.V3.AiProtocolManager do
  @moduledoc """
  Configuration for the AI Protocol Manager filter.

  The filter manages AI endpoint traffic on both directions of a stream. On
  the request path it holds a declared AI endpoint's payload and parses it,
  which is what lets routing, admission and policy act on a payload the proxy
  understands rather than on opaque bytes. On the response path it can
  extract normalized LLM token usage into dynamic metadata.

  Request and response processing are independently enabled by the presence
  of ``request_handling`` and ``response_handling``. Which routes are AI
  endpoints — and which :ref:`wire API <envoy_v3_api_enum_type.ai.v3.ApiProtocol>`
  each speaks — is declared with the :ref:`per-route configuration
  <envoy_v3_api_msg_extensions.filters.http.ai_protocol_manager.v3.AiProtocolManagerPerRoute>`.
  [#protodoc-title: AI Protocol Manager]
  AI Protocol Manager filter
  :ref:`configuration overview <config_http_filters_ai_protocol_manager>`.
  [#extension: envoy.filters.http.ai_protocol_manager]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.ai_protocol_manager.v3.AiProtocolManager",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :request_handling, 1,
    type: Envoy.Extensions.Filters.Http.AiProtocolManager.V3.RequestHandling,
    json_name: "requestHandling"

  field :response_handling, 2,
    type: Envoy.Extensions.Filters.Http.AiProtocolManager.V3.ResponseHandling,
    json_name: "responseHandling"
end

defmodule Envoy.Extensions.Filters.Http.AiProtocolManager.V3.RequestHandling do
  @moduledoc """
  Request-side processing configuration. A route that carries a
  :ref:`per-route request declaration
  <envoy_v3_api_field_extensions.filters.http.ai_protocol_manager.v3.AiProtocolManagerPerRoute.request>`
  has its payload held, offloaded, and parsed strictly: a body that is not
  well-formed JSON is rejected with a 400 rather than forwarded for the
  upstream to interpret differently.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.ai_protocol_manager.v3.RequestHandling",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :parse_unconfigured_routes, 1, type: :bool, json_name: "parseUnconfiguredRoutes"
end

defmodule Envoy.Extensions.Filters.Http.AiProtocolManager.V3.ResponseHandling do
  @moduledoc """
  Response-side processing configuration. Individual response features are
  enabled by the presence of their corresponding messages.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.ai_protocol_manager.v3.ResponseHandling",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :token_usage, 1,
    type: Envoy.Extensions.Filters.Http.AiProtocolManager.V3.TokenUsageExtraction,
    json_name: "tokenUsage"
end

defmodule Envoy.Extensions.Filters.Http.AiProtocolManager.V3.TokenUsageExtraction do
  @moduledoc """
  Configuration for canonical response token-usage extraction.

  Eligible 2xx SSE and JSON responses are observed as they stream through;
  the filter never stops iteration or modifies the response, and no
  extraction failure can affect it. The result is published at a clean end
  of stream under one namespace as typed dynamic metadata: the authoritative
  record is :ref:`envoy.data.ai.v3.TokenUsage
  <envoy_v3_api_msg_data.ai.v3.TokenUsage>`, consumable through typed
  metadata readers such as ext_proc typed forwarding. No untyped ``Struct``
  mirror is emitted.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.ai_protocol_manager.v3.TokenUsageExtraction",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :include_unconfigured_routes, 1, type: :bool, json_name: "includeUnconfiguredRoutes"

  field :default_api_protocol, 2,
    type: Envoy.Type.Ai.V3.ApiProtocol,
    json_name: "defaultApiProtocol",
    enum: true,
    deprecated: false

  field :metadata_namespace, 3, type: :string, json_name: "metadataNamespace"

  field :limits, 4,
    type: Envoy.Extensions.Filters.Http.AiProtocolManager.V3.TokenUsageExtractionLimits
end

defmodule Envoy.Extensions.Filters.Http.AiProtocolManager.V3.TokenUsageExtractionLimits do
  @moduledoc """
  Per-stream memory and work limits for token-usage extraction. The response
  itself always streams through unaffected; on any limit only extraction
  state is dropped and the published record is flagged.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.ai_protocol_manager.v3.TokenUsageExtractionLimits",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :max_sse_event_size, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxSseEventSize",
    deprecated: false

  field :max_json_body_size, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxJsonBodySize",
    deprecated: false

  field :max_parsed_sse_events, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxParsedSseEvents",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.AiProtocolManager.V3.AiProtocolManagerPerRoute do
  @moduledoc """
  Per-route configuration. Its presence declares the route an AI endpoint.

  Request and response wire protocols are declared separately because
  protocol translation can make the client-facing request API differ from
  the provider's response API. For response token-usage extraction the
  effective wire API is resolved in precedence order: per-route
  ``response.api_protocol``, then per-route ``request.api_protocol``, then
  :ref:`default_api_protocol
  <envoy_v3_api_field_extensions.filters.http.ai_protocol_manager.v3.TokenUsageExtraction.default_api_protocol>`,
  then auto-detection.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.ai_protocol_manager.v3.AiProtocolManagerPerRoute",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :request, 1, type: Envoy.Extensions.Filters.Http.AiProtocolManager.V3.RequestPerRoute
  field :response, 2, type: Envoy.Extensions.Filters.Http.AiProtocolManager.V3.ResponsePerRoute
end

defmodule Envoy.Extensions.Filters.Http.AiProtocolManager.V3.RequestPerRoute do
  @moduledoc """
  Per-route request-side behavior.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.ai_protocol_manager.v3.RequestPerRoute",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :api_protocol, 1,
    type: Envoy.Type.Ai.V3.ApiProtocol,
    json_name: "apiProtocol",
    enum: true,
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.AiProtocolManager.V3.ResponsePerRoute do
  @moduledoc """
  Per-route response-side behavior.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.ai_protocol_manager.v3.ResponsePerRoute",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :api_protocol, 1,
    type: Envoy.Type.Ai.V3.ApiProtocol,
    json_name: "apiProtocol",
    enum: true,
    deprecated: false
end
