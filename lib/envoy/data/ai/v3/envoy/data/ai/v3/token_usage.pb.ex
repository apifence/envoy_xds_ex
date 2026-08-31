defmodule Envoy.Data.Ai.V3.TokenUsage.ExtractionStatus do
  @moduledoc """
  Quality of the extraction result.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.data.ai.v3.TokenUsage.ExtractionStatus",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :EXTRACTION_STATUS_UNSPECIFIED, 0
  field :COMPLETE, 1
  field :PARTIAL, 2
  field :FAILED, 3
end

defmodule Envoy.Data.Ai.V3.TokenUsage do
  @moduledoc """
  Canonical LLM token usage extracted from a provider response by the
  :ref:`AI Protocol Manager filter <config_http_filters_ai_protocol_manager>`,
  published as typed dynamic metadata under one namespace at a clean end of
  stream.

  Counts are normalized onto one *inclusive* contract regardless of wire API:
  ``input_tokens`` covers all input consumed (uncached input, cached reads,
  cache writes, and tool-use prompt tokens) and ``output_tokens`` covers all
  generated output including reasoning/thought tokens; the detail messages
  are subsets of those canonical values. Every value remains
  provider-reported and is not independently verified by Envoy.

  Every count is optional: wire APIs report different subsets, and a
  status-only record (``api_protocol``, ``model`` when captured, and
  ``extraction_status: FAILED``) is published when extraction failed
  outright, distinguishing that from a response that supplied no usage
  (which publishes nothing).
  [#next-free-field: 10]
  [#protodoc-title: AI token usage]
  """

  use Protobuf,
    full_name: "envoy.data.ai.v3.TokenUsage",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :api_protocol, 1, type: Envoy.Type.Ai.V3.ApiProtocol, json_name: "apiProtocol", enum: true
  field :model, 2, type: :string
  field :input_tokens, 3, type: Google.Protobuf.UInt64Value, json_name: "inputTokens"
  field :output_tokens, 4, type: Google.Protobuf.UInt64Value, json_name: "outputTokens"
  field :total_tokens, 5, type: Google.Protobuf.UInt64Value, json_name: "totalTokens"

  field :input_token_details, 6,
    type: Envoy.Data.Ai.V3.InputTokenDetails,
    json_name: "inputTokenDetails"

  field :output_token_details, 7,
    type: Envoy.Data.Ai.V3.OutputTokenDetails,
    json_name: "outputTokenDetails"

  field :provider_total_tokens, 8,
    type: Google.Protobuf.UInt64Value,
    json_name: "providerTotalTokens"

  field :extraction_status, 9,
    type: Envoy.Data.Ai.V3.TokenUsage.ExtractionStatus,
    json_name: "extractionStatus",
    enum: true
end

defmodule Envoy.Data.Ai.V3.InputTokenDetails do
  @moduledoc """
  Subsets of :ref:`input_tokens
  <envoy_v3_api_field_data.ai.v3.TokenUsage.input_tokens>`.
  """

  use Protobuf,
    full_name: "envoy.data.ai.v3.InputTokenDetails",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :cached_tokens, 1, type: Google.Protobuf.UInt64Value, json_name: "cachedTokens"

  field :cache_creation_tokens, 2,
    type: Google.Protobuf.UInt64Value,
    json_name: "cacheCreationTokens"

  field :tool_use_tokens, 3, type: Google.Protobuf.UInt64Value, json_name: "toolUseTokens"
end

defmodule Envoy.Data.Ai.V3.OutputTokenDetails do
  @moduledoc """
  Subsets of :ref:`output_tokens
  <envoy_v3_api_field_data.ai.v3.TokenUsage.output_tokens>`.
  """

  use Protobuf,
    full_name: "envoy.data.ai.v3.OutputTokenDetails",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :reasoning_tokens, 1, type: Google.Protobuf.UInt64Value, json_name: "reasoningTokens"
end
