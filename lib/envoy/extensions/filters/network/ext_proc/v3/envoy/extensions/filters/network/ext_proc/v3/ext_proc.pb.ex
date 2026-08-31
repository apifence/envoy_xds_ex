defmodule Envoy.Extensions.Filters.Network.ExtProc.V3.ProcessingMode.DataSendMode do
  @moduledoc """
  Defines how traffic should be handled by the external processor.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.filters.network.ext_proc.v3.ProcessingMode.DataSendMode",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :STREAMED, 0
  field :SKIP, 1
end

defmodule Envoy.Extensions.Filters.Network.ExtProc.V3.NetworkExternalProcessor do
  @moduledoc """
  The Network External Processing filter allows an external service to process raw TCP/UDP traffic
  in a flexible way using a bidirectional gRPC stream. Unlike the HTTP External Processing filter,
  this filter operates at the L4 (transport) layer, giving access to raw network traffic.

  The filter communicates with an external gRPC service that can:

  1. Inspect traffic in both directions
  2. Modify the network traffic
  3. Control connection lifecycle (continue, close, or reset)

  By using the filter's processing mode, you can selectively choose which data
  directions to process (read, write or both), allowing for efficient processing.
  [#next-free-field: 8]
  [#protodoc-title: External Processing Filter]
  External Processing Filter: Process network traffic using an external service.
  [#extension: envoy.filters.network.ext_proc]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.network.ext_proc.v3.NetworkExternalProcessor",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :grpc_service, 1, type: Envoy.Config.Core.V3.GrpcService, json_name: "grpcService"
  field :failure_mode_allow, 2, type: :bool, json_name: "failureModeAllow"

  field :processing_mode, 3,
    type: Envoy.Extensions.Filters.Network.ExtProc.V3.ProcessingMode,
    json_name: "processingMode"

  field :message_timeout, 4,
    type: Google.Protobuf.Duration,
    json_name: "messageTimeout",
    deprecated: false

  field :stat_prefix, 5, type: :string, json_name: "statPrefix", deprecated: false

  field :metadata_options, 6,
    type: Envoy.Extensions.Filters.Network.ExtProc.V3.MetadataOptions,
    json_name: "metadataOptions"

  field :connection_attributes, 7,
    repeated: true,
    type: :string,
    json_name: "connectionAttributes"
end

defmodule Envoy.Extensions.Filters.Network.ExtProc.V3.ProcessingMode do
  @moduledoc """
  Options for controlling processing behavior.
  Filter will reject the config if both read and write are SKIP mode.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.network.ext_proc.v3.ProcessingMode",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :process_read, 1,
    type: Envoy.Extensions.Filters.Network.ExtProc.V3.ProcessingMode.DataSendMode,
    json_name: "processRead",
    enum: true

  field :process_write, 2,
    type: Envoy.Extensions.Filters.Network.ExtProc.V3.ProcessingMode.DataSendMode,
    json_name: "processWrite",
    enum: true
end

defmodule Envoy.Extensions.Filters.Network.ExtProc.V3.MetadataOptions.MetadataNamespaces do
  use Protobuf,
    full_name: "envoy.extensions.filters.network.ext_proc.v3.MetadataOptions.MetadataNamespaces",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :untyped, 1, repeated: true, type: :string
  field :typed, 2, repeated: true, type: :string
end

defmodule Envoy.Extensions.Filters.Network.ExtProc.V3.MetadataOptions do
  @moduledoc """
  The MetadataOptions structure defines options for sending dynamic metadata. Specifically,
  which namespaces to send to the server.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.network.ext_proc.v3.MetadataOptions",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :forwarding_namespaces, 1,
    type: Envoy.Extensions.Filters.Network.ExtProc.V3.MetadataOptions.MetadataNamespaces,
    json_name: "forwardingNamespaces"

  field :receiving_namespaces, 2,
    type: Envoy.Extensions.Filters.Network.ExtProc.V3.MetadataOptions.MetadataNamespaces,
    json_name: "receivingNamespaces"
end
