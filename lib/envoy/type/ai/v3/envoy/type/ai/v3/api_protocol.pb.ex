defmodule Envoy.Type.Ai.V3.ApiProtocol do
  @moduledoc """
  Identifies the AI API contract spoken on the wire.

  This names request/response schemas and streaming event semantics, not the
  organization operating the backend: OpenAI, Azure OpenAI, vLLM, and any
  other OpenAI-compatible backend all speak ``OPENAI_CHAT_COMPLETIONS``.
  Provider identity, when needed, must come from configuration or routing
  metadata.

  Response framing is separate: JSON, SSE, and streamed JSON-array variants
  of the same API share one ``ApiProtocol`` value.
  [#protodoc-title: AI API protocol]
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.type.ai.v3.ApiProtocol",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :API_PROTOCOL_UNSPECIFIED, 0
  field :OPENAI_CHAT_COMPLETIONS, 1
  field :OPENAI_RESPONSES, 2
  field :ANTHROPIC_MESSAGES, 3
  field :GEMINI_GENERATE_CONTENT, 4
end
