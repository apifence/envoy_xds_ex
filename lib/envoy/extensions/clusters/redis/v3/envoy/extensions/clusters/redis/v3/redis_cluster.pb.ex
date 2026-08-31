defmodule Envoy.Extensions.Clusters.Redis.V3.RedisClusterConfig do
  @moduledoc """
  [#next-free-field: 8]
  [#protodoc-title: Redis Cluster Configuration]
  This cluster adds support for `Redis Cluster <https://redis.io/topics/cluster-spec>`_, as part
  of :ref:`Envoy's support for Redis Cluster <arch_overview_redis>`.

  Redis Cluster is an extension of Redis which supports sharding and high availability (where a
  shard that loses its primary fails over to a replica, and designates it as the new primary).
  However, as there is no unified frontend or proxy service in front of Redis Cluster, the client
  (in this case Envoy) must locally maintain the state of the Redis Cluster, specifically the
  topology. A random node in the cluster is queried for the topology using the `CLUSTER SLOTS
  command <https://redis.io/commands/cluster-slots>`_. This result is then stored locally, and
  updated at user-configured intervals.

  Additionally, if
  :ref:`enable_redirection<envoy_v3_api_field_extensions.filters.network.redis_proxy.v3.RedisProxy.ConnPoolSettings.enable_redirection>`
  is true, then moved and ask redirection errors from upstream servers will trigger a topology
  refresh when they exceed a user-configured error threshold.

  Example:

  .. code-block:: yaml

      name: name
      connect_timeout: 0.25s
      dns_lookup_family: V4_ONLY
      hosts:
      - socket_address:
        address: foo.bar.com
        port_value: 22120
      cluster_type:
        name: envoy.clusters.redis
        typed_config:
          "@type": type.googleapis.com/google.protobuf.Struct
          value:
            cluster_refresh_rate: 30s
            cluster_refresh_timeout: 0.5s
            redirect_refresh_interval: 10s
            redirect_refresh_threshold: 10
  [#extension: envoy.clusters.redis]
  """

  use Protobuf,
    full_name: "envoy.extensions.clusters.redis.v3.RedisClusterConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :cluster_refresh_rate, 1,
    type: Google.Protobuf.Duration,
    json_name: "clusterRefreshRate",
    deprecated: false

  field :cluster_refresh_timeout, 2,
    type: Google.Protobuf.Duration,
    json_name: "clusterRefreshTimeout",
    deprecated: false

  field :redirect_refresh_interval, 3,
    type: Google.Protobuf.Duration,
    json_name: "redirectRefreshInterval"

  field :redirect_refresh_threshold, 4,
    type: Google.Protobuf.UInt32Value,
    json_name: "redirectRefreshThreshold"

  field :failure_refresh_threshold, 5, type: :uint32, json_name: "failureRefreshThreshold"

  field :host_degraded_refresh_threshold, 6,
    type: :uint32,
    json_name: "hostDegradedRefreshThreshold"

  field :enable_zone_discovery, 7,
    type: Google.Protobuf.BoolValue,
    json_name: "enableZoneDiscovery"
end
