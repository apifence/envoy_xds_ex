defmodule Envoy.Extensions.Router.ClusterSpecifiers.DynamicModules.V3.RouteActionOverride do
  @moduledoc """
  Route action properties that a dynamic module may select for a request in place of the properties
  of the matched route. These properties are themselves built from other extensions, such as retry
  host predicates and retry priorities, so they must be declared here in advance rather than chosen
  freely by the module on each request.

  Each entry is built and validated when the cluster specifier is configured, so an invalid entry
  is rejected at configuration load rather than on the request path. Every entry must replace at
  least one property, so an entry that builds to no replacement is rejected as well.
  [#protodoc-title: Dynamic Modules Cluster Specifier]

  Dynamic modules cluster specifier :ref:`configuration reference documentation
  <config_http_cluster_specifier_dynamic_modules>`.
  [#extension: envoy.router.cluster_specifier_plugin.dynamic_modules]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.router.cluster_specifiers.dynamic_modules.v3.RouteActionOverride",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :retry_policy, 1, type: Envoy.Config.Route.V3.RetryPolicy, json_name: "retryPolicy"
  field :metadata_match, 2, type: Envoy.Config.Core.V3.Metadata, json_name: "metadataMatch"

  field :request_mirror_policies, 3,
    repeated: true,
    type: Envoy.Config.Route.V3.RouteAction.RequestMirrorPolicy,
    json_name: "requestMirrorPolicies"

  field :hash_policy, 4,
    repeated: true,
    type: Envoy.Config.Route.V3.RouteAction.HashPolicy,
    json_name: "hashPolicy"
end

defmodule Envoy.Extensions.Router.ClusterSpecifiers.DynamicModules.V3.DynamicModuleClusterSpecifier.RouteActionOverridesEntry do
  use Protobuf,
    full_name:
      "envoy.extensions.router.cluster_specifiers.dynamic_modules.v3.DynamicModuleClusterSpecifier.RouteActionOverridesEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string

  field :value, 2,
    type: Envoy.Extensions.Router.ClusterSpecifiers.DynamicModules.V3.RouteActionOverride
end

defmodule Envoy.Extensions.Router.ClusterSpecifiers.DynamicModules.V3.DynamicModuleClusterSpecifier do
  @moduledoc """
  Configuration for the Dynamic Modules Cluster Specifier. This cluster specifier allows loading
  shared object files via ``dlopen`` to select the upstream cluster for a request, and to replace
  the timeout, idle timeout, priority, request body buffer limit, cluster not found response code,
  hash policy, retry policy, metadata match criteria and request mirroring policies of the matched
  route.

  A module can be loaded by multiple cluster specifiers. It is loaded only once and shared across
  multiple cluster specifier instances. The module is invoked while the route is being
  resolved, so the selection is visible to the router without clearing the route cache. It is
  invoked again whenever a filter refreshes the route cluster, or a retry re-selects it when
  :ref:`refresh_cluster_on_retry
  <envoy_v3_api_field_config.route.v3.RetryPolicy.refresh_cluster_on_retry>` is set, so the module
  must be able to produce a decision from the request headers and the stream info alone.
  """

  use Protobuf,
    full_name:
      "envoy.extensions.router.cluster_specifiers.dynamic_modules.v3.DynamicModuleClusterSpecifier",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :dynamic_module_config, 1,
    type: Envoy.Extensions.DynamicModules.V3.DynamicModuleConfig,
    json_name: "dynamicModuleConfig",
    deprecated: false

  field :specifier_name, 2, type: :string, json_name: "specifierName"
  field :specifier_config, 3, type: Google.Protobuf.Any, json_name: "specifierConfig"

  field :route_action_overrides, 4,
    repeated: true,
    type:
      Envoy.Extensions.Router.ClusterSpecifiers.DynamicModules.V3.DynamicModuleClusterSpecifier.RouteActionOverridesEntry,
    json_name: "routeActionOverrides",
    map: true,
    deprecated: false
end
