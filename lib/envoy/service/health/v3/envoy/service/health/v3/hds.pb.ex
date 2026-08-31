defmodule Envoy.Service.Health.V3.Capability.Protocol do
  @moduledoc """
  Different Envoy instances may have different capabilities (e.g. Redis)
  and/or have ports enabled for different protocols.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.service.health.v3.Capability.Protocol",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :HTTP, 0
  field :TCP, 1
  field :REDIS, 2
end

defmodule Envoy.Service.Health.V3.Capability do
  @moduledoc """
  Defines supported protocols etc, so the management server can assign proper
  endpoints to healthcheck.
  """

  use Protobuf,
    full_name: "envoy.service.health.v3.Capability",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :health_check_protocols, 1,
    repeated: true,
    type: Envoy.Service.Health.V3.Capability.Protocol,
    json_name: "healthCheckProtocols",
    enum: true
end

defmodule Envoy.Service.Health.V3.HealthCheckRequest do
  use Protobuf,
    full_name: "envoy.service.health.v3.HealthCheckRequest",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :node, 1, type: Envoy.Config.Core.V3.Node
  field :capability, 2, type: Envoy.Service.Health.V3.Capability
end

defmodule Envoy.Service.Health.V3.EndpointHealth do
  use Protobuf,
    full_name: "envoy.service.health.v3.EndpointHealth",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :endpoint, 1, type: Envoy.Config.Endpoint.V3.Endpoint

  field :health_status, 2,
    type: Envoy.Config.Core.V3.HealthStatus,
    json_name: "healthStatus",
    enum: true

  field :health_metadata, 3, type: Google.Protobuf.Struct, json_name: "healthMetadata"
end

defmodule Envoy.Service.Health.V3.LocalityEndpointsHealth do
  @moduledoc """
  Group endpoint health by locality under each cluster.
  """

  use Protobuf,
    full_name: "envoy.service.health.v3.LocalityEndpointsHealth",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :locality, 1, type: Envoy.Config.Core.V3.Locality

  field :endpoints_health, 2,
    repeated: true,
    type: Envoy.Service.Health.V3.EndpointHealth,
    json_name: "endpointsHealth"
end

defmodule Envoy.Service.Health.V3.ClusterEndpointsHealth do
  @moduledoc """
  The health status of endpoints in a cluster. The cluster name and locality
  should match the corresponding fields in ClusterHealthCheck message.
  """

  use Protobuf,
    full_name: "envoy.service.health.v3.ClusterEndpointsHealth",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :cluster_name, 1, type: :string, json_name: "clusterName"

  field :locality_endpoints_health, 2,
    repeated: true,
    type: Envoy.Service.Health.V3.LocalityEndpointsHealth,
    json_name: "localityEndpointsHealth"
end

defmodule Envoy.Service.Health.V3.EndpointHealthResponse do
  use Protobuf,
    full_name: "envoy.service.health.v3.EndpointHealthResponse",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :endpoints_health, 1,
    repeated: true,
    type: Envoy.Service.Health.V3.EndpointHealth,
    json_name: "endpointsHealth",
    deprecated: true

  field :cluster_endpoints_health, 2,
    repeated: true,
    type: Envoy.Service.Health.V3.ClusterEndpointsHealth,
    json_name: "clusterEndpointsHealth"
end

defmodule Envoy.Service.Health.V3.HealthCheckRequestOrEndpointHealthResponse do
  use Protobuf,
    full_name: "envoy.service.health.v3.HealthCheckRequestOrEndpointHealthResponse",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :request_type, 0

  field :health_check_request, 1,
    type: Envoy.Service.Health.V3.HealthCheckRequest,
    json_name: "healthCheckRequest",
    oneof: 0

  field :endpoint_health_response, 2,
    type: Envoy.Service.Health.V3.EndpointHealthResponse,
    json_name: "endpointHealthResponse",
    oneof: 0
end

defmodule Envoy.Service.Health.V3.LocalityEndpoints do
  use Protobuf,
    full_name: "envoy.service.health.v3.LocalityEndpoints",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :locality, 1, type: Envoy.Config.Core.V3.Locality
  field :endpoints, 2, repeated: true, type: Envoy.Config.Endpoint.V3.Endpoint
end

defmodule Envoy.Service.Health.V3.ClusterHealthCheck do
  @moduledoc """
  The cluster name and locality is provided to Envoy for the endpoints that it
  health checks to support statistics reporting, logging and debugging by the
  Envoy instance (outside of HDS). For maximum usefulness, it should match the
  same cluster structure as that provided by EDS.
  [#next-free-field: 6]
  """

  use Protobuf,
    full_name: "envoy.service.health.v3.ClusterHealthCheck",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :cluster_name, 1, type: :string, json_name: "clusterName"

  field :health_checks, 2,
    repeated: true,
    type: Envoy.Config.Core.V3.HealthCheck,
    json_name: "healthChecks"

  field :locality_endpoints, 3,
    repeated: true,
    type: Envoy.Service.Health.V3.LocalityEndpoints,
    json_name: "localityEndpoints"

  field :transport_socket_matches, 4,
    repeated: true,
    type: Envoy.Config.Cluster.V3.Cluster.TransportSocketMatch,
    json_name: "transportSocketMatches"

  field :upstream_bind_config, 5,
    type: Envoy.Config.Core.V3.BindConfig,
    json_name: "upstreamBindConfig"
end

defmodule Envoy.Service.Health.V3.HealthCheckSpecifier do
  use Protobuf,
    full_name: "envoy.service.health.v3.HealthCheckSpecifier",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :cluster_health_checks, 1,
    repeated: true,
    type: Envoy.Service.Health.V3.ClusterHealthCheck,
    json_name: "clusterHealthChecks"

  field :interval, 2, type: Google.Protobuf.Duration
end

defmodule Envoy.Service.Health.V3.HdsDummy do
  @moduledoc """
  [#not-implemented-hide:] Not configuration. Workaround c++ protobuf issue with importing
  services: https://github.com/google/protobuf/issues/4221 and protoxform to upgrade the file.
  """

  use Protobuf,
    full_name: "envoy.service.health.v3.HdsDummy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Service.Health.V3.HealthDiscoveryService.Service do
  @moduledoc """
  HDS is Health Discovery Service. It compliments Envoy’s health checking
  service by designating this Envoy to be a healthchecker for a subset of hosts
  in the cluster. The status of these health checks will be reported to the
  management server, where it can be aggregated etc and redistributed back to
  Envoy through EDS.
  [#protodoc-title: Health discovery service (HDS)]
  """

  use GRPC.Service,
    name: "envoy.service.health.v3.HealthDiscoveryService",
    protoc_gen_elixir_version: "0.17.0"

  rpc :StreamHealthCheck,
      stream(Envoy.Service.Health.V3.HealthCheckRequestOrEndpointHealthResponse),
      stream(Envoy.Service.Health.V3.HealthCheckSpecifier)

  rpc :FetchHealthCheck,
      Envoy.Service.Health.V3.HealthCheckRequestOrEndpointHealthResponse,
      Envoy.Service.Health.V3.HealthCheckSpecifier
end

defmodule Envoy.Service.Health.V3.HealthDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Health.V3.HealthDiscoveryService.Service
end
