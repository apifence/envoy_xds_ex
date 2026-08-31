defmodule Envoy.Extensions.Filters.Http.SseToMetadata.V3.SseToMetadata.ProcessingRules do
  @moduledoc """
  Rules for processing SSE streams and extracting metadata.

  The filter parses the SSE protocol (events delimited by blank lines), then delegates
  to a content parser to parse event content and extract metadata. The content parser
  determines which values to extract and how to write them to metadata.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.sse_to_metadata.v3.SseToMetadata.ProcessingRules",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :content_parser, 1,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "contentParser",
    deprecated: false

  field :max_event_size, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxEventSize",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.SseToMetadata.V3.SseToMetadata do
  @moduledoc """
  [#protodoc-title: SSE-To-Metadata Filter]

  The SSE-To-Metadata filter extracts values from Server-Sent Events (SSE) HTTP response bodies
  and writes them to dynamic metadata. This is useful for LLM token usage tracking,
  logging, and other observability use cases.

  The filter specifically handles SSE format (text/event-stream) and uses pluggable content
  parsers to extract values from the SSE data fields. The content parser is a typed extension
  that can be configured to handle different content types (JSON, plaintext, XML, etc.).

  The filter only processes responses with Content-Type "text/event-stream"
  (the standard SSE content type). Content-Type parameters such as charset are ignored.

  See SSE-To-Metadata :ref:`configuration overview <config_http_filters_sse_to_metadata>` for more details.
  [#extension: envoy.filters.http.sse_to_metadata]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.sse_to_metadata.v3.SseToMetadata",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :response_rules, 1,
    type: Envoy.Extensions.Filters.Http.SseToMetadata.V3.SseToMetadata.ProcessingRules,
    json_name: "responseRules",
    deprecated: false
end
