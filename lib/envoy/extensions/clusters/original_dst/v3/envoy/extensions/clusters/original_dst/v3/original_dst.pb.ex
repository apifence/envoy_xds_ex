defmodule Envoy.Extensions.Clusters.OriginalDst.V3.OriginalDstCluster do
  @moduledoc """
  Configuration for the Original Destination cluster.
  [#protodoc-title: Original Destination Cluster Configuration]
  [#extension: envoy.clusters.original_dst]
  """

  use Protobuf,
    full_name: "envoy.extensions.clusters.original_dst.v3.OriginalDstCluster",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :use_http_header, 1, type: :bool, json_name: "useHttpHeader"
  field :http_header_name, 2, type: :string, json_name: "httpHeaderName"

  field :upstream_port_override, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "upstreamPortOverride",
    deprecated: false

  field :metadata_key, 4, type: Envoy.Type.Metadata.V3.MetadataKey, json_name: "metadataKey"
end
