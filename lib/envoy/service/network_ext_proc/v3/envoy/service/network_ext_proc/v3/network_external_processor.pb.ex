defmodule Envoy.Service.NetworkExtProc.V3.ProcessingResponse.DataProcessedStatus do
  @moduledoc """
  DataProcessedStatus indicates whether the data was modified by the external processor.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.service.network_ext_proc.v3.ProcessingResponse.DataProcessedStatus",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :UNKNOWN, 0
  field :UNMODIFIED, 1
  field :MODIFIED, 2
end

defmodule Envoy.Service.NetworkExtProc.V3.ProcessingResponse.ConnectionStatus do
  @moduledoc """
  ConnectionStatus determines what happens to the connection after processing.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.service.network_ext_proc.v3.ProcessingResponse.ConnectionStatus",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :CONTINUE, 0
  field :CLOSE, 1
  field :CLOSE_RST, 2
end

defmodule Envoy.Service.NetworkExtProc.V3.Data do
  @moduledoc """
  The payload data from network layer
  """

  use Protobuf,
    full_name: "envoy.service.network_ext_proc.v3.Data",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :data, 1, type: :bytes
  field :end_of_stream, 2, type: :bool, json_name: "endOfStream"
end

defmodule Envoy.Service.NetworkExtProc.V3.ProcessingRequest.AttributesEntry do
  use Protobuf,
    full_name: "envoy.service.network_ext_proc.v3.ProcessingRequest.AttributesEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Struct
end

defmodule Envoy.Service.NetworkExtProc.V3.ProcessingRequest do
  @moduledoc """
  ProcessingRequest contains data sent from Envoy to the external processing server.
  Each request contains either read data (from client) or write data (to client)
  along with optional metadata and attributes.
  """

  use Protobuf,
    full_name: "envoy.service.network_ext_proc.v3.ProcessingRequest",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :read_data, 1, type: Envoy.Service.NetworkExtProc.V3.Data, json_name: "readData"
  field :write_data, 2, type: Envoy.Service.NetworkExtProc.V3.Data, json_name: "writeData"
  field :metadata, 3, type: Envoy.Config.Core.V3.Metadata

  field :attributes, 4,
    repeated: true,
    type: Envoy.Service.NetworkExtProc.V3.ProcessingRequest.AttributesEntry,
    map: true
end

defmodule Envoy.Service.NetworkExtProc.V3.ProcessingResponse do
  @moduledoc """
  ProcessingResponse contains the response from the external processing server to Envoy.
  Each response corresponds to a ProcessingRequest and indicates how the network
  traffic should be handled.
  [#next-free-field: 7]
  """

  use Protobuf,
    full_name: "envoy.service.network_ext_proc.v3.ProcessingResponse",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :read_data, 1, type: Envoy.Service.NetworkExtProc.V3.Data, json_name: "readData"
  field :write_data, 2, type: Envoy.Service.NetworkExtProc.V3.Data, json_name: "writeData"

  field :data_processing_status, 3,
    type: Envoy.Service.NetworkExtProc.V3.ProcessingResponse.DataProcessedStatus,
    json_name: "dataProcessingStatus",
    enum: true

  field :connection_status, 4,
    type: Envoy.Service.NetworkExtProc.V3.ProcessingResponse.ConnectionStatus,
    json_name: "connectionStatus",
    enum: true

  field :dynamic_metadata, 5, type: Google.Protobuf.Struct, json_name: "dynamicMetadata"
  field :close_stream_to_ext_proc_server, 6, type: :bool, json_name: "closeStreamToExtProcServer"
end

defmodule Envoy.Service.NetworkExtProc.V3.NetworkExternalProcessor.Service do
  @moduledoc """
  NetworkExternalProcessor service defines the contract between Envoy and
  external processing servers for L4 network traffic.
  [#protodoc-title: Network External Processing Service]
  The Network External Processing filter allows an external service to dynamically
  interact with and modify L4 network traffic passing through Envoy. Unlike the
  HTTP External Processing filter, this service operates at the TCP/UDP level,
  providing access to raw network data.

  The filter communicates with an external gRPC service that can:

  1. Inspect network traffic in both directions (client->server and server->client)
  2. Modify the payload data
  3. Control connection lifecycle (continue, close gracefully, or reset)

  Use cases include:

  1. Custom protocol inspection and modification
  2. Advanced traffic manipulation
  3. Security scanning and filtering
  4. Dynamic connection management

  The service uses a bidirectional gRPC stream, maintaining state throughout
  the connection lifetime while allowing asynchronous processing.
  """

  use GRPC.Service,
    name: "envoy.service.network_ext_proc.v3.NetworkExternalProcessor",
    protoc_gen_elixir_version: "0.17.0"

  rpc :Process,
      stream(Envoy.Service.NetworkExtProc.V3.ProcessingRequest),
      stream(Envoy.Service.NetworkExtProc.V3.ProcessingResponse)
end

defmodule Envoy.Service.NetworkExtProc.V3.NetworkExternalProcessor.Stub do
  use GRPC.Stub, service: Envoy.Service.NetworkExtProc.V3.NetworkExternalProcessor.Service
end
