defmodule Envoy.Extensions.Clusters.McpMulticluster.V3.ClusterConfig.McpCluster do
  @moduledoc """
  Cluster-based backend configuration.
  """

  use Protobuf,
    full_name: "envoy.extensions.clusters.mcp_multicluster.v3.ClusterConfig.McpCluster",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :cluster, 1, type: :string, deprecated: false
  field :path, 2, type: :string
  field :timeout, 3, type: Google.Protobuf.Duration
  field :host_rewrite_literal, 4, type: :string, json_name: "hostRewriteLiteral"
end

defmodule Envoy.Extensions.Clusters.McpMulticluster.V3.ClusterConfig.McpBackend do
  @moduledoc """
  Specification of the MCP server.
  """

  use Protobuf,
    full_name: "envoy.extensions.clusters.mcp_multicluster.v3.ClusterConfig.McpBackend",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :name, 1, type: :string

  field :mcp_cluster, 2,
    type: Envoy.Extensions.Clusters.McpMulticluster.V3.ClusterConfig.McpCluster,
    json_name: "mcpCluster"
end

defmodule Envoy.Extensions.Clusters.McpMulticluster.V3.ClusterConfig do
  @moduledoc """
  Configuration for the MCP multi cluster. See the :ref:`architecture overview
  <arch_overview_mcp_multicluster>` for more information. This cluster type allows aggregation of
  multiple clusters into one, providing metadata with the list of aggregated clusters.
  Use the ``attemptCount`` property of the request ``StreamInfo`` object to select host in a specific subcluster.
  If the ``attemptCount`` value is greater than the number of aggregated clusters, the host selection will fail.

  The primary purpose of this cluster extension is to provide the list of servers for the MCP router
  configured for tool and resource aggregation. For details of how tools and resource are aggregated see
  :ref:`MCP router documentation<config_http_filters_mcp_router>`.

  Example configuration:

  .. code-block:: yaml

      name: mcp_multicluster
      connect_timeout: 0.25s
      lb_policy: CLUSTER_PROVIDED
      cluster_type:
        name: envoy.clusters.mcp_multicluster
        typed_config:
          "@type": type.googleapis.com/envoy.extensions.clusters.mcp_multicluster.v3.ClusterConfig
          servers:
          - name: build_tools
            mcp_cluster:
              cluster: build_tools
          - name: review_tools
             mcp_cluster:
               cluster: review_tools
               host_rewrite_literal: "mcp.review_tools.acme.com"

  [#extension: envoy.clusters.mcp_multicluster]
  [#protodoc-title: MCP multi cluster configuration]
  """

  use Protobuf,
    full_name: "envoy.extensions.clusters.mcp_multicluster.v3.ClusterConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :servers, 1,
    repeated: true,
    type: Envoy.Extensions.Clusters.McpMulticluster.V3.ClusterConfig.McpBackend,
    deprecated: false
end
