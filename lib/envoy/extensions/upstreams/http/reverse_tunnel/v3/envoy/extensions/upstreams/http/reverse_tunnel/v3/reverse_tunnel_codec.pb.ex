defmodule Envoy.Extensions.Upstreams.Http.ReverseTunnel.V3.ReverseTunnelUpstreamCodecOptions do
  @moduledoc """
  Configuration for the drain-aware reverse-tunnel upstream codec.
  [#protodoc-title: Reverse Tunnel Upstream Codec]
  [#extension: envoy.upstreams.http.reverse_tunnel]
  Per-cluster upstream (client) HTTP/2 codec options for reverse-tunnel clusters. When attached to
  a cluster via :ref:`typed_extension_protocol_options
  <envoy_v3_api_field_config.cluster.v3.Cluster.typed_extension_protocol_options>`, the upstream
  HTTP/2 client codec becomes drain-aware: it can emit a GOAWAY when the reverse tunnel is
  draining, mirroring the server-side drain-aware HTTP Connection Manager.
  """

  use Protobuf,
    full_name:
      "envoy.extensions.upstreams.http.reverse_tunnel.v3.ReverseTunnelUpstreamCodecOptions",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :enable_drain_with_goaway, 1, type: :bool, json_name: "enableDrainWithGoaway"
end
