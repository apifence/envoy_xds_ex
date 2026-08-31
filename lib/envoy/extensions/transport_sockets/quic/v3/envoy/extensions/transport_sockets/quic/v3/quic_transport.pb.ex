defmodule Envoy.Extensions.TransportSockets.Quic.V3.QuicDownstreamTransport do
  @moduledoc """
  Configuration for Downstream QUIC transport socket. This provides Google's implementation of Google QUIC and IETF QUIC to Envoy.
  [#protodoc-title: quic transport]
  [#extension: envoy.transport_sockets.quic]
  The QUIC configurations below provide the transport socket configuration for downstream/upstream QUIC.
  """

  use Protobuf,
    full_name: "envoy.extensions.transport_sockets.quic.v3.QuicDownstreamTransport",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :downstream_tls_context, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V3.DownstreamTlsContext,
    json_name: "downstreamTlsContext",
    deprecated: false

  field :enable_early_data, 2, type: Google.Protobuf.BoolValue, json_name: "enableEarlyData"
  field :enable_resumption, 3, type: Google.Protobuf.BoolValue, json_name: "enableResumption"
end

defmodule Envoy.Extensions.TransportSockets.Quic.V3.QuicUpstreamTransport do
  @moduledoc """
  Configuration for Upstream QUIC transport socket. This provides Google's implementation of Google QUIC and IETF QUIC to Envoy.
  """

  use Protobuf,
    full_name: "envoy.extensions.transport_sockets.quic.v3.QuicUpstreamTransport",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :upstream_tls_context, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V3.UpstreamTlsContext,
    json_name: "upstreamTlsContext",
    deprecated: false
end
