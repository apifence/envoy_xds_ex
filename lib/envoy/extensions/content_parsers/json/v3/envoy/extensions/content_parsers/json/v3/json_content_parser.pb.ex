defmodule Envoy.Extensions.ContentParsers.Json.V3.JsonContentParser.RuleConfig do
  @moduledoc """
  Configuration for a single rule with its processing behavior.
  """

  use Protobuf,
    full_name: "envoy.extensions.content_parsers.json.v3.JsonContentParser.RuleConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :rule, 1,
    type: Envoy.Extensions.Filters.Http.JsonToMetadata.V3.JsonToMetadata.Rule,
    deprecated: false

  field :stop_processing_after_matches, 2,
    type: :uint32,
    json_name: "stopProcessingAfterMatches",
    deprecated: false
end

defmodule Envoy.Extensions.ContentParsers.Json.V3.JsonContentParser do
  @moduledoc """
  Configuration for the JSON content parser.
  [#protodoc-title: JSON Content Parser]

  Parses JSON content and extracts values using JSON path selectors.
  This parser operates on raw JSON content strings provided by the caller.

  [#extension: envoy.content_parsers.json]
  """

  use Protobuf,
    full_name: "envoy.extensions.content_parsers.json.v3.JsonContentParser",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :rules, 1,
    repeated: true,
    type: Envoy.Extensions.ContentParsers.Json.V3.JsonContentParser.RuleConfig,
    deprecated: false
end
