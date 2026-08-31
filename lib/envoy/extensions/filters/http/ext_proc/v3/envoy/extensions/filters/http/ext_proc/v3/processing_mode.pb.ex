defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode.HeaderSendMode do
  @moduledoc """
  Control how headers and trailers are handled.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.filters.http.ext_proc.v3.ProcessingMode.HeaderSendMode",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :DEFAULT, 0
  field :SEND, 1
  field :SKIP, 2
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode.BodySendMode do
  @moduledoc """
  Control how the request and response bodies are handled.

  When body mutation by the external processor is enabled, the ext_proc filter will always remove the
  content length header in the following four cases, unless
  :ref:`allow_content_length_header <envoy_v3_api_field_extensions.filters.http.ext_proc.v3.ExternalProcessor.allow_content_length_header>`
  is enabled. This is because the content length cannot be guaranteed to be set correctly:

  1) ``STREAMED`` BodySendMode: header processing completes before body mutation comes back.
  2) ``BUFFERED_PARTIAL`` BodySendMode: body is buffered and could be injected in different phases.
  3) ``BUFFERED`` BodySendMode + ``SKIP`` HeaderSendMode: header processing (e.g., update content-length) is skipped.
  4) ``FULL_DUPLEX_STREAMED`` BodySendMode: header processing completes before body mutation comes back.

  In Envoy's HTTP/1 codec implementation, removing content length will enable chunked transfer
  encoding whenever feasible. The recipient (either client or server) must be able to parse and
  decode the chunked transfer coding
  (see `details in RFC9112 <https://tools.ietf.org/html/rfc9112#section-7.1>`_).

  In ``BUFFERED`` BodySendMode + ``SEND`` HeaderSendMode, content length header is allowed but it
  is the external processor's responsibility to set the content length correctly matched to the
  length of the mutated body. If they don't match, the corresponding body mutation will be
  rejected and a local reply will be sent with an error message.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.filters.http.ext_proc.v3.ProcessingMode.BodySendMode",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :NONE, 0
  field :STREAMED, 1
  field :BUFFERED, 2
  field :BUFFERED_PARTIAL, 3
  field :FULL_DUPLEX_STREAMED, 4
  field :GRPC, 5
end

defmodule Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode do
  @moduledoc """
  [#next-free-field: 7]
  [#protodoc-title: External Processing Filter]
  External Processing Filter Processing Mode
  [#extension: envoy.filters.http.ext_proc]
  This configuration describes which parts of an HTTP request and
  response are sent to a remote server and how they are delivered.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.ext_proc.v3.ProcessingMode",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :request_header_mode, 1,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode.HeaderSendMode,
    json_name: "requestHeaderMode",
    enum: true,
    deprecated: false

  field :response_header_mode, 2,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode.HeaderSendMode,
    json_name: "responseHeaderMode",
    enum: true,
    deprecated: false

  field :request_body_mode, 3,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode.BodySendMode,
    json_name: "requestBodyMode",
    enum: true,
    deprecated: false

  field :response_body_mode, 4,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode.BodySendMode,
    json_name: "responseBodyMode",
    enum: true,
    deprecated: false

  field :request_trailer_mode, 5,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode.HeaderSendMode,
    json_name: "requestTrailerMode",
    enum: true,
    deprecated: false

  field :response_trailer_mode, 6,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode.HeaderSendMode,
    json_name: "responseTrailerMode",
    enum: true,
    deprecated: false
end
