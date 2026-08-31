defmodule Envoy.Extensions.Quic.ConnectionIdGenerator.QuicLb.V3.Config do
  @moduledoc """
  Configuration for a connection ID generator implementation for the QUIC-LB draft RFC for
  routable connection IDs.

  Connection IDs always have the length self encoded, as described in
  https://datatracker.ietf.org/doc/html/draft-ietf-quic-load-balancers#name-length-self-description.

  See https://datatracker.ietf.org/doc/html/draft-ietf-quic-load-balancers for details.

  [#next-free-field: 7]
  [#protodoc-title: QUIC-LB connection ID generator config]
  [#extension: envoy.quic.connection_id_generator.quic_lb]
  """

  use Protobuf,
    full_name: "envoy.extensions.quic.connection_id_generator.quic_lb.v3.Config",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :server_id, 2,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "serverId",
    deprecated: false

  field :server_id_base64_encoded, 6, type: :bool, json_name: "serverIdBase64Encoded"

  field :expected_server_id_length, 3,
    type: :uint32,
    json_name: "expectedServerIdLength",
    deprecated: false

  field :nonce_length_bytes, 4, type: :uint32, json_name: "nonceLengthBytes", deprecated: false

  field :encryption_parameters, 5,
    type: Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig,
    json_name: "encryptionParameters",
    deprecated: false

  field :unencrypted_mode, 1, type: :bool, json_name: "unencryptedMode"
end
