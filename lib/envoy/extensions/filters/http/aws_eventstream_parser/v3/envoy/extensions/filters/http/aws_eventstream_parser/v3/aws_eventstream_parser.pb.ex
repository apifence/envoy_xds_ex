defmodule Envoy.Extensions.Filters.Http.AwsEventstreamParser.V3.AwsEventstreamParser.HeaderKeyValuePair do
  @moduledoc """
  Metadata action to write when an EventStream header matches or is missing.
  """

  use Protobuf,
    full_name:
      "envoy.extensions.filters.http.aws_eventstream_parser.v3.AwsEventstreamParser.HeaderKeyValuePair",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :metadata_namespace, 1, type: :string, json_name: "metadataNamespace"
  field :key, 2, type: :string, deprecated: false
  field :value, 3, type: Google.Protobuf.Value
end

defmodule Envoy.Extensions.Filters.Http.AwsEventstreamParser.V3.AwsEventstreamParser.HeaderRule do
  @moduledoc """
  A rule for extracting an EventStream message header to dynamic metadata.
  """

  use Protobuf,
    full_name:
      "envoy.extensions.filters.http.aws_eventstream_parser.v3.AwsEventstreamParser.HeaderRule",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :header_name, 1, type: :string, json_name: "headerName", deprecated: false

  field :on_present, 2,
    type:
      Envoy.Extensions.Filters.Http.AwsEventstreamParser.V3.AwsEventstreamParser.HeaderKeyValuePair,
    json_name: "onPresent"

  field :on_missing, 3,
    type:
      Envoy.Extensions.Filters.Http.AwsEventstreamParser.V3.AwsEventstreamParser.HeaderKeyValuePair,
    json_name: "onMissing"

  field :stop_processing_after_matches, 4,
    type: Google.Protobuf.UInt32Value,
    json_name: "stopProcessingAfterMatches",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.AwsEventstreamParser.V3.AwsEventstreamParser.ProcessingRules do
  @moduledoc """
  Rules for processing AWS EventStream streams and extracting metadata.

  The filter parses the AWS EventStream binary protocol (messages with headers and payloads),
  then delegates to a content parser to parse the message payload and extract metadata.
  The content parser determines which values to extract and how to write them to metadata.
  """

  use Protobuf,
    full_name:
      "envoy.extensions.filters.http.aws_eventstream_parser.v3.AwsEventstreamParser.ProcessingRules",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :content_parser, 1,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "contentParser",
    deprecated: false

  field :header_rules, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.AwsEventstreamParser.V3.AwsEventstreamParser.HeaderRule,
    json_name: "headerRules"
end

defmodule Envoy.Extensions.Filters.Http.AwsEventstreamParser.V3.AwsEventstreamParser do
  @moduledoc """
  [#protodoc-title: AWS-EventStream-Parser Filter]

  The AWS-EventStream-Parser filter extracts values from AWS EventStream HTTP response bodies
  and writes them to dynamic metadata. This is useful for AWS Bedrock streaming response processing,
  token usage tracking, logging, and other observability use cases.

  The filter specifically handles the AWS EventStream binary protocol
  (application/vnd.amazon.eventstream) and uses pluggable content parsers to extract values
  from the message payloads. The content parser is a typed extension that can be configured
  to handle different content types (JSON, plaintext, XML, etc.).

  The filter only processes responses with Content-Type "application/vnd.amazon.eventstream".
  Content-Type parameters are ignored.

  See AWS-EventStream-Parser :ref:`configuration overview <config_http_filters_aws_eventstream_parser>` for more details.
  [#extension: envoy.filters.http.aws_eventstream_parser]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.aws_eventstream_parser.v3.AwsEventstreamParser",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :response_rules, 1,
    type:
      Envoy.Extensions.Filters.Http.AwsEventstreamParser.V3.AwsEventstreamParser.ProcessingRules,
    json_name: "responseRules",
    deprecated: false
end
