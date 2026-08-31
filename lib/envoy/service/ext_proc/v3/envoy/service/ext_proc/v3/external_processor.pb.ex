defmodule Envoy.Service.ExtProc.V3.CommonResponse.ResponseStatus do
  @moduledoc """
  The status of the response.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.service.ext_proc.v3.CommonResponse.ResponseStatus",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :CONTINUE, 0
  field :CONTINUE_AND_REPLACE, 1
end

defmodule Envoy.Service.ExtProc.V3.ProtocolConfiguration do
  @moduledoc """
  This message specifies the filter protocol configurations which will be sent to the ext_proc
  server in a :ref:`ProcessingRequest <envoy_v3_api_msg_service.ext_proc.v3.ProcessingRequest>`.
  If the server does not support these protocol configurations, it may choose to close the gRPC
  stream. If the server supports these protocol configurations, it should respond based on the
  API specifications.
  """

  use Protobuf,
    full_name: "envoy.service.ext_proc.v3.ProtocolConfiguration",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :request_body_mode, 1,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode.BodySendMode,
    json_name: "requestBodyMode",
    enum: true,
    deprecated: false

  field :response_body_mode, 2,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode.BodySendMode,
    json_name: "responseBodyMode",
    enum: true,
    deprecated: false

  field :send_body_without_waiting_for_header_response, 3,
    type: :bool,
    json_name: "sendBodyWithoutWaitingForHeaderResponse"
end

defmodule Envoy.Service.ExtProc.V3.ProcessingRequest.FlowControlInit do
  @moduledoc """
  Initial flow control window sizes for ``FULL_DUPLEX_STREAMED`` and
  ``GRPC`` body send modes.

  A sender starts with this amount of flow control window. Whenever
  it sends body data, it must decrement its flow control window by
  the number of bytes that it has sent. When its flow control
  window is less than or equal to the amount of body data it wishes
  to send, it may not send until it receives a window update causing
  its flow control window to be large enough.

  However, note that in ``GRPC`` body send mode, whenever the flow
  control window is greater than zero, a sender may send a single
  message, even if the size of that message exceeds the available flow
  control window. At that point, the flow control window will be negative
  and the sender must not send the next message until it becomes positive.

  Note that the initial size for the to-sidestream windows are set by
  the sender, not the receiver. This is because each sidestream may be
  routed to a different ext_proc server instance, but there is no
  connection-level handshake to set a default for that server
  instance, so the only alternative here would be to have the
  ext_proc server instance set this on a per-stream basis, which
  would require an additional round-trip and therefore hurt latency.
  This unfortunately means that the ext_proc server instance has a
  bit less control: as soon as it receives these initial values, it can
  immediately send a window update that reduces the window, but it
  must be prepared to handle any data that the sender has already sent.
  The initial sizes for the to-sidestream windows are generally
  expected to be in the range of 32K to 64K.

  [#not-implemented-hide:]
  """

  use Protobuf,
    full_name: "envoy.service.ext_proc.v3.ProcessingRequest.FlowControlInit",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :initial_window_downstream_to_sidestream, 1,
    type: :int64,
    json_name: "initialWindowDownstreamToSidestream"

  field :initial_window_sidestream_to_upstream, 2,
    type: :int64,
    json_name: "initialWindowSidestreamToUpstream"

  field :initial_window_upstream_to_sidestream, 3,
    type: :int64,
    json_name: "initialWindowUpstreamToSidestream"

  field :initial_window_sidestream_to_downstream, 4,
    type: :int64,
    json_name: "initialWindowSidestreamToDownstream"
end

defmodule Envoy.Service.ExtProc.V3.ProcessingRequest.ClientWindowUpdate do
  @moduledoc """
  Flow control window update. Values may be positive or negative. The
  sender must immediately add these values to its flow control window,
  which governs how much data can be sent.

  [#not-implemented-hide:]
  """

  use Protobuf,
    full_name: "envoy.service.ext_proc.v3.ProcessingRequest.ClientWindowUpdate",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :window_increment_sidestream_to_upstream, 1,
    type: :int64,
    json_name: "windowIncrementSidestreamToUpstream"

  field :window_increment_sidestream_to_downstream, 2,
    type: :int64,
    json_name: "windowIncrementSidestreamToDownstream"
end

defmodule Envoy.Service.ExtProc.V3.ProcessingRequest.AttributesEntry do
  use Protobuf,
    full_name: "envoy.service.ext_proc.v3.ProcessingRequest.AttributesEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Struct
end

defmodule Envoy.Service.ExtProc.V3.ProcessingRequest do
  @moduledoc """
  This represents the different types of messages that the data plane can send
  to an external processing server.
  [#next-free-field: 14]
  """

  use Protobuf,
    full_name: "envoy.service.ext_proc.v3.ProcessingRequest",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :request, 0

  field :request_headers, 2,
    type: Envoy.Service.ExtProc.V3.HttpHeaders,
    json_name: "requestHeaders",
    oneof: 0

  field :response_headers, 3,
    type: Envoy.Service.ExtProc.V3.HttpHeaders,
    json_name: "responseHeaders",
    oneof: 0

  field :request_body, 4,
    type: Envoy.Service.ExtProc.V3.HttpBody,
    json_name: "requestBody",
    oneof: 0

  field :response_body, 5,
    type: Envoy.Service.ExtProc.V3.HttpBody,
    json_name: "responseBody",
    oneof: 0

  field :request_trailers, 6,
    type: Envoy.Service.ExtProc.V3.HttpTrailers,
    json_name: "requestTrailers",
    oneof: 0

  field :response_trailers, 7,
    type: Envoy.Service.ExtProc.V3.HttpTrailers,
    json_name: "responseTrailers",
    oneof: 0

  field :metadata_context, 8, type: Envoy.Config.Core.V3.Metadata, json_name: "metadataContext"

  field :attributes, 9,
    repeated: true,
    type: Envoy.Service.ExtProc.V3.ProcessingRequest.AttributesEntry,
    map: true

  field :observability_mode, 10, type: :bool, json_name: "observabilityMode"

  field :protocol_config, 11,
    type: Envoy.Service.ExtProc.V3.ProtocolConfiguration,
    json_name: "protocolConfig"

  field :flow_control_init, 12,
    type: Envoy.Service.ExtProc.V3.ProcessingRequest.FlowControlInit,
    json_name: "flowControlInit"

  field :client_window_update, 13,
    type: Envoy.Service.ExtProc.V3.ProcessingRequest.ClientWindowUpdate,
    json_name: "clientWindowUpdate"
end

defmodule Envoy.Service.ExtProc.V3.ProcessingResponse.ServerWindowUpdate do
  @moduledoc """
  Flow control window update. Values may be positive or negative. The
  sender must immediately add these values to its flow control window,
  which governs how much data can be sent.

  [#not-implemented-hide:]
  """

  use Protobuf,
    full_name: "envoy.service.ext_proc.v3.ProcessingResponse.ServerWindowUpdate",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :window_increment_downstream_to_sidestream, 1,
    type: :int64,
    json_name: "windowIncrementDownstreamToSidestream"

  field :window_increment_upstream_to_sidestream, 2,
    type: :int64,
    json_name: "windowIncrementUpstreamToSidestream"
end

defmodule Envoy.Service.ExtProc.V3.ProcessingResponse.TypedDynamicMetadataEntry do
  use Protobuf,
    full_name: "envoy.service.ext_proc.v3.ProcessingResponse.TypedDynamicMetadataEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Any
end

defmodule Envoy.Service.ExtProc.V3.ProcessingResponse do
  @moduledoc """
  This represents the different types of messages the server may send back to the data plane
  when the ``observability_mode`` field in the received ``ProcessingRequest`` is set to ``false``.

  * If the corresponding ``BodySendMode`` in the
    :ref:`processing_mode <envoy_v3_api_field_extensions.filters.http.ext_proc.v3.ExternalProcessor.processing_mode>`
    is not set to ``FULL_DUPLEX_STREAMED``, then for every received ``ProcessingRequest``,
    the server must send back exactly one ``ProcessingResponse`` message.
  * If it is set to ``FULL_DUPLEX_STREAMED``, the server must follow the API defined
    for this mode to send the ``ProcessingResponse`` messages.
  [#next-free-field: 17]
  """

  use Protobuf,
    full_name: "envoy.service.ext_proc.v3.ProcessingResponse",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :response, 0

  field :request_headers, 1,
    type: Envoy.Service.ExtProc.V3.HeadersResponse,
    json_name: "requestHeaders",
    oneof: 0

  field :response_headers, 2,
    type: Envoy.Service.ExtProc.V3.HeadersResponse,
    json_name: "responseHeaders",
    oneof: 0

  field :request_body, 3,
    type: Envoy.Service.ExtProc.V3.BodyResponse,
    json_name: "requestBody",
    oneof: 0

  field :response_body, 4,
    type: Envoy.Service.ExtProc.V3.BodyResponse,
    json_name: "responseBody",
    oneof: 0

  field :request_trailers, 5,
    type: Envoy.Service.ExtProc.V3.TrailersResponse,
    json_name: "requestTrailers",
    oneof: 0

  field :response_trailers, 6,
    type: Envoy.Service.ExtProc.V3.TrailersResponse,
    json_name: "responseTrailers",
    oneof: 0

  field :immediate_response, 7,
    type: Envoy.Service.ExtProc.V3.ImmediateResponse,
    json_name: "immediateResponse",
    oneof: 0

  field :streamed_immediate_response, 11,
    type: Envoy.Service.ExtProc.V3.StreamedImmediateResponse,
    json_name: "streamedImmediateResponse",
    oneof: 0

  field :dynamic_metadata, 8, type: Google.Protobuf.Struct, json_name: "dynamicMetadata"

  field :typed_dynamic_metadata, 13,
    repeated: true,
    type: Envoy.Service.ExtProc.V3.ProcessingResponse.TypedDynamicMetadataEntry,
    json_name: "typedDynamicMetadata",
    map: true

  field :mode_override, 9,
    type: Envoy.Extensions.Filters.Http.ExtProc.V3.ProcessingMode,
    json_name: "modeOverride"

  field :request_drain, 12, type: :bool, json_name: "requestDrain", deprecated: true
  field :request_drain_requests, 15, type: :bool, json_name: "requestDrainRequests"
  field :request_drain_responses, 16, type: :bool, json_name: "requestDrainResponses"

  field :override_message_timeout, 10,
    type: Google.Protobuf.Duration,
    json_name: "overrideMessageTimeout"

  field :server_window_update, 14,
    type: Envoy.Service.ExtProc.V3.ProcessingResponse.ServerWindowUpdate,
    json_name: "serverWindowUpdate"
end

defmodule Envoy.Service.ExtProc.V3.HttpHeaders.AttributesEntry do
  use Protobuf,
    full_name: "envoy.service.ext_proc.v3.HttpHeaders.AttributesEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Struct
end

defmodule Envoy.Service.ExtProc.V3.HttpHeaders do
  @moduledoc """
  This message is sent to the external server when the HTTP request and response headers
  are first received.
  The following are messages that are sent to the server.
  """

  use Protobuf,
    full_name: "envoy.service.ext_proc.v3.HttpHeaders",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :headers, 1, type: Envoy.Config.Core.V3.HeaderMap

  field :attributes, 2,
    repeated: true,
    type: Envoy.Service.ExtProc.V3.HttpHeaders.AttributesEntry,
    map: true,
    deprecated: true

  field :end_of_stream, 3, type: :bool, json_name: "endOfStream"
end

defmodule Envoy.Service.ExtProc.V3.HttpBody do
  @moduledoc """
  This message is sent to the external server when the HTTP request and response bodies are
  received.
  [#next-free-field: 6]
  """

  use Protobuf,
    full_name: "envoy.service.ext_proc.v3.HttpBody",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :body, 1, type: :bytes
  field :end_of_stream, 2, type: :bool, json_name: "endOfStream"
  field :end_of_stream_without_message, 3, type: :bool, json_name: "endOfStreamWithoutMessage"
  field :grpc_message_compressed, 4, type: :bool, json_name: "grpcMessageCompressed"
  field :drain_complete, 5, type: :bool, json_name: "drainComplete"
end

defmodule Envoy.Service.ExtProc.V3.HttpTrailers do
  @moduledoc """
  This message is sent to the external server when the HTTP request and
  response trailers are received.
  """

  use Protobuf,
    full_name: "envoy.service.ext_proc.v3.HttpTrailers",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :trailers, 1, type: Envoy.Config.Core.V3.HeaderMap
end

defmodule Envoy.Service.ExtProc.V3.HeadersResponse do
  @moduledoc """
  This message is sent by the external server to the data plane after ``HttpHeaders`` was
  sent to it.
  The following are messages that may be sent back by the server.
  """

  use Protobuf,
    full_name: "envoy.service.ext_proc.v3.HeadersResponse",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :response, 1, type: Envoy.Service.ExtProc.V3.CommonResponse
end

defmodule Envoy.Service.ExtProc.V3.BodyResponse do
  @moduledoc """
  This message is sent by the external server to the data plane after ``HttpBody`` was
  sent to it.
  """

  use Protobuf,
    full_name: "envoy.service.ext_proc.v3.BodyResponse",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :response, 1, type: Envoy.Service.ExtProc.V3.CommonResponse
end

defmodule Envoy.Service.ExtProc.V3.TrailersResponse do
  @moduledoc """
  This message is sent by the external server to the data plane after ``HttpTrailers`` was
  sent to it.
  """

  use Protobuf,
    full_name: "envoy.service.ext_proc.v3.TrailersResponse",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :header_mutation, 1,
    type: Envoy.Service.ExtProc.V3.HeaderMutation,
    json_name: "headerMutation"
end

defmodule Envoy.Service.ExtProc.V3.StreamedImmediateResponse do
  @moduledoc """
  This message is sent by the external server to the data plane after ``HttpHeaders`` to initiate
  local response streaming. The server may follow up with multiple messages containing
  ``body_response``. The server must indicate end of stream by setting ``end_of_stream`` to
  ``true`` in the ``headers_response`` or ``body_response`` message or by sending a
  ``trailers_response`` message.
  """

  use Protobuf,
    full_name: "envoy.service.ext_proc.v3.StreamedImmediateResponse",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :response, 0

  field :headers_response, 1,
    type: Envoy.Service.ExtProc.V3.HttpHeaders,
    json_name: "headersResponse",
    oneof: 0

  field :body_response, 2,
    type: Envoy.Service.ExtProc.V3.StreamedBodyResponse,
    json_name: "bodyResponse",
    oneof: 0

  field :trailers_response, 3,
    type: Envoy.Config.Core.V3.HeaderMap,
    json_name: "trailersResponse",
    oneof: 0
end

defmodule Envoy.Service.ExtProc.V3.CommonResponse do
  @moduledoc """
  This message contains common fields between header and body responses.
  [#next-free-field: 6]
  """

  use Protobuf,
    full_name: "envoy.service.ext_proc.v3.CommonResponse",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :status, 1,
    type: Envoy.Service.ExtProc.V3.CommonResponse.ResponseStatus,
    enum: true,
    deprecated: false

  field :header_mutation, 2,
    type: Envoy.Service.ExtProc.V3.HeaderMutation,
    json_name: "headerMutation"

  field :body_mutation, 3, type: Envoy.Service.ExtProc.V3.BodyMutation, json_name: "bodyMutation"
  field :trailers, 4, type: Envoy.Config.Core.V3.HeaderMap
  field :clear_route_cache, 5, type: :bool, json_name: "clearRouteCache"
end

defmodule Envoy.Service.ExtProc.V3.ImmediateResponse do
  @moduledoc """
  This message causes the filter to attempt to create a locally generated response, send it
  downstream, stop processing additional filters, and ignore any additional messages received
  from the remote server for this request or response. If a response has already started, then
  this will either ship the reply directly to the downstream codec, or reset the stream.
  [#next-free-field: 6]
  """

  use Protobuf,
    full_name: "envoy.service.ext_proc.v3.ImmediateResponse",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :status, 1, type: Envoy.Type.V3.HttpStatus, deprecated: false
  field :headers, 2, type: Envoy.Service.ExtProc.V3.HeaderMutation
  field :body, 3, type: :bytes
  field :grpc_status, 4, type: Envoy.Service.ExtProc.V3.GrpcStatus, json_name: "grpcStatus"
  field :details, 5, type: :string
end

defmodule Envoy.Service.ExtProc.V3.GrpcStatus do
  @moduledoc """
  This message specifies a gRPC status for an ``ImmediateResponse`` message.
  """

  use Protobuf,
    full_name: "envoy.service.ext_proc.v3.GrpcStatus",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :status, 1, type: :uint32
end

defmodule Envoy.Service.ExtProc.V3.HeaderMutation do
  @moduledoc """
  Change HTTP headers or trailers by appending, replacing, or removing
  headers.
  """

  use Protobuf,
    full_name: "envoy.service.ext_proc.v3.HeaderMutation",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :set_headers, 1,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "setHeaders"

  field :remove_headers, 2, repeated: true, type: :string, json_name: "removeHeaders"
end

defmodule Envoy.Service.ExtProc.V3.StreamedBodyResponse do
  @moduledoc """
  The body response message corresponding to ``FULL_DUPLEX_STREAMED`` or ``GRPC`` body modes.
  [#next-free-field: 6]
  """

  use Protobuf,
    full_name: "envoy.service.ext_proc.v3.StreamedBodyResponse",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :body, 1, type: :bytes
  field :end_of_stream, 2, type: :bool, json_name: "endOfStream"
  field :end_of_stream_without_message, 3, type: :bool, json_name: "endOfStreamWithoutMessage"
  field :grpc_message_compressed, 4, type: :bool, json_name: "grpcMessageCompressed"
  field :drain_complete, 5, type: :bool, json_name: "drainComplete"
end

defmodule Envoy.Service.ExtProc.V3.BodyMutation do
  @moduledoc """
  This message specifies the body mutation the server sends to the data plane.
  """

  use Protobuf,
    full_name: "envoy.service.ext_proc.v3.BodyMutation",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :mutation, 0

  field :body, 1, type: :bytes, oneof: 0
  field :clear_body, 2, type: :bool, json_name: "clearBody", oneof: 0

  field :streamed_response, 3,
    type: Envoy.Service.ExtProc.V3.StreamedBodyResponse,
    json_name: "streamedResponse",
    oneof: 0,
    deprecated: false
end

defmodule Envoy.Service.ExtProc.V3.ExternalProcessor.Service do
  @moduledoc """
  A service that can access and modify HTTP requests and responses as part of a filter chain.
  The overall external processing protocol works like this:

  1. The data plane sends to the service information about the HTTP request.
  2. The service sends back a ``ProcessingResponse`` message that directs the data plane to either
     stop processing, continue without it, or send it the next chunk of the message body.
  3. If so requested, the data plane sends the server the message body in chunks, or the entire
     body at once. In either case, the server may send back a ``ProcessingResponse`` for each
     message it receives, or wait for a certain amount of body chunks to be received before
     streaming back the ``ProcessingResponse`` messages.
  4. If so requested, the data plane sends the server the HTTP trailers, and the server sends back
     a ``ProcessingResponse``.
  5. At this point, request processing is done, and we pick up again at step 1 when the data plane
     receives a response from the upstream server.
  6. At any point above, if the server closes the gRPC stream cleanly, then the data plane
     proceeds without consulting the server.
  7. At any point above, if the server closes the gRPC stream with an error, then the data plane
     returns a ``500`` error to the client, unless the filter was configured to ignore errors.

  In other words, the process is a request/response conversation, but using a gRPC stream to make
  it easier for the server to maintain state.
  [#protodoc-title: External processing service]
  """

  use GRPC.Service,
    name: "envoy.service.ext_proc.v3.ExternalProcessor",
    protoc_gen_elixir_version: "0.17.0"

  rpc :Process,
      stream(Envoy.Service.ExtProc.V3.ProcessingRequest),
      stream(Envoy.Service.ExtProc.V3.ProcessingResponse)
end

defmodule Envoy.Service.ExtProc.V3.ExternalProcessor.Stub do
  use GRPC.Stub, service: Envoy.Service.ExtProc.V3.ExternalProcessor.Service
end
