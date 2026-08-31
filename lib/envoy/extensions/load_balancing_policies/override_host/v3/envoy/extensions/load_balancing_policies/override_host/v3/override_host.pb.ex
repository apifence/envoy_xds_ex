defmodule Envoy.Extensions.LoadBalancingPolicies.OverrideHost.V3.OverrideHost.OverrideHostSource do
  use Protobuf,
    full_name:
      "envoy.extensions.load_balancing_policies.override_host.v3.OverrideHost.OverrideHostSource",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :header, 1, type: :string, deprecated: false
  field :metadata, 2, type: Envoy.Type.Metadata.V3.MetadataKey
end

defmodule Envoy.Extensions.LoadBalancingPolicies.OverrideHost.V3.OverrideHost do
  @moduledoc """
  Configuration for the Override Host Load Balancing policy.

  This policy allows endpoint picking to be implemented in downstream HTTP filters. For example an ext_proc RPC to a service
  that implements k8s proposal for AI gateway inferences extensions
  https://github.com/kubernetes-sigs/gateway-api-inference-extension/tree/main/docs/proposals/004-endpoint-picker-protocol
  can provide hosts for serving a request using Override Host load balancing policy.

  This policy extracts selected override hosts from a list of ``OverrideHostSource`` (request headers, metadata, etc.).

  The override host source must specify at least one host in ``IP:Port`` format or multiple hosts in ``IP:Port,IP:Port,...``
  format. For example ``10.0.0.5:8080`` or ``[2600:4040:5204::1574:24ae]:80``. The IPv6 address is enclosed in square brackets.

  For specific example, to support k8s gateway inference extensions, which uses the ``x-gateway-destination-endpoint``
  header or metadata value under the "envoy.lb" key for selected hosts, the Override Host load balancing policy should be
  configured in the following way:

  .. code-block:: yaml

     override_host_sources:
     - header: "x-gateway-destination-endpoint"
     - metadata:
         key: "envoy.lb"
         path:
         - key: "x-gateway-destination-endpoint"

  If no valid host in the override host list, then the specified fallback load balancing policy is used. This allows load
  balancing to degrade to a a built in policy (i.e. Round Robin) in case external endpoint picker fails.

  In addition to specifying ``override_host_sources``, the policy can be configured to inform downstream filters
  of the selected endpoint through dynamic metadata or response headers through ``selected_endpoint_key``:

  .. code-block:: yaml

     override_host_sources:
     - metadata:
         key: "envoy.lb"
         path:
         - key: "x-gateway-destination-endpoint"
     selected_host_key:
       key: "envoy.lb"
       path:
       - key: "x-gateway-destination-endpoint-served"

  See the :ref:`load balancing architecture
  overview<arch_overview_load_balancing_types>` for more information.
  [#protodoc-title: Override Host Load Balancing Policy]
  [#extension: envoy.load_balancing_policies.override_host]
  """

  use Protobuf,
    full_name: "envoy.extensions.load_balancing_policies.override_host.v3.OverrideHost",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :override_host_sources, 1,
    repeated: true,
    type: Envoy.Extensions.LoadBalancingPolicies.OverrideHost.V3.OverrideHost.OverrideHostSource,
    json_name: "overrideHostSources",
    deprecated: false

  field :selected_host_key, 2,
    type: Envoy.Type.Metadata.V3.MetadataKey,
    json_name: "selectedHostKey"

  field :fallback_policy, 3,
    type: Envoy.Config.Cluster.V3.LoadBalancingPolicy,
    json_name: "fallbackPolicy",
    deprecated: false
end
