defmodule Envoy.Extensions.Clusters.ReverseConnection.V3.ReverseConnectionClusterConfig do
  @moduledoc """
  Configuration for a cluster of type REVERSE_CONNECTION.
  [#protodoc-title: Reverse connection cluster]
  [#extension: envoy.clusters.reverse_connection]
  """

  use Protobuf,
    full_name: "envoy.extensions.clusters.reverse_connection.v3.ReverseConnectionClusterConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :cleanup_interval, 1,
    type: Google.Protobuf.Duration,
    json_name: "cleanupInterval",
    deprecated: false

  field :host_id_format, 2, type: :string, json_name: "hostIdFormat", deprecated: false
  field :tenant_id_format, 3, type: :string, json_name: "tenantIdFormat", deprecated: false
end
