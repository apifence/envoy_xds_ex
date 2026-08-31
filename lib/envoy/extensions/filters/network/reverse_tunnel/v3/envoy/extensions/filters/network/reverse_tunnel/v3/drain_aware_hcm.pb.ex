defmodule Envoy.Extensions.Filters.Network.ReverseTunnel.V3.DrainAwareHttpConnectionManager do
  @moduledoc """
  Configuration for the drain-aware HTTP Connection Manager.
  All HCM fields are forwarded verbatim; the only difference is that this
  filter registers a listener-drain callback and emits a GOAWAY before the
  connection is closed.
  [#protodoc-title: Drain-Aware HTTP Connection Manager]
  A network filter that wraps the standard HCM and sends HTTP/2 GOAWAY frames
  on all active connections when the listener is drained (e.g. via admin
  /drain_listeners). Intended for use on reverse-tunnel listeners so that
  agents can detect drain and re-establish connections gracefully.
  [#extension: envoy.filters.network.reverse_tunnel_drain_aware_http_connection_manager]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.filters.network.reverse_tunnel.v3.DrainAwareHttpConnectionManager",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :hcm_config, 1,
    type: Envoy.Extensions.Filters.Network.HttpConnectionManager.V3.HttpConnectionManager,
    json_name: "hcmConfig"

  field :enable_drain_with_goaway, 2, type: :bool, json_name: "enableDrainWithGoaway"
end
