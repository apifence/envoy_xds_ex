defmodule Envoy.Config.Route.V3.VirtualHost.TlsRequirementType do
  use Protobuf,
    enum: true,
    full_name: "envoy.config.route.v3.VirtualHost.TlsRequirementType",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :NONE, 0
  field :EXTERNAL_ONLY, 1
  field :ALL, 2
end

defmodule Envoy.Config.Route.V3.RouteAction.ClusterNotFoundResponseCode do
  use Protobuf,
    enum: true,
    full_name: "envoy.config.route.v3.RouteAction.ClusterNotFoundResponseCode",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :SERVICE_UNAVAILABLE, 0
  field :NOT_FOUND, 1
  field :INTERNAL_SERVER_ERROR, 2
end

defmodule Envoy.Config.Route.V3.RouteAction.InternalRedirectAction do
  @moduledoc """
  Configures :ref:`internal redirect <arch_overview_internal_redirects>` behavior.
  [#next-major-version: remove this definition - it's defined in the InternalRedirectPolicy message.]
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.config.route.v3.RouteAction.InternalRedirectAction",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :PASS_THROUGH_INTERNAL_REDIRECT, 0
  field :HANDLE_INTERNAL_REDIRECT, 1
end

defmodule Envoy.Config.Route.V3.RetryPolicy.ResetHeaderFormat do
  use Protobuf,
    enum: true,
    full_name: "envoy.config.route.v3.RetryPolicy.ResetHeaderFormat",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :SECONDS, 0
  field :UNIX_TIMESTAMP, 1
end

defmodule Envoy.Config.Route.V3.RedirectAction.RedirectResponseCode do
  use Protobuf,
    enum: true,
    full_name: "envoy.config.route.v3.RedirectAction.RedirectResponseCode",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :MOVED_PERMANENTLY, 0
  field :FOUND, 1
  field :SEE_OTHER, 2
  field :TEMPORARY_REDIRECT, 3
  field :PERMANENT_REDIRECT, 4
end

defmodule Envoy.Config.Route.V3.RateLimit.XRateLimitOption do
  use Protobuf,
    enum: true,
    full_name: "envoy.config.route.v3.RateLimit.XRateLimitOption",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :UNSPECIFIED, 0
  field :OFF, 1
  field :DRAFT_VERSION_03, 2
end

defmodule Envoy.Config.Route.V3.RateLimit.Action.MetaData.Source do
  use Protobuf,
    enum: true,
    full_name: "envoy.config.route.v3.RateLimit.Action.MetaData.Source",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :DYNAMIC, 0
  field :ROUTE_ENTRY, 1
  field :CLUSTER_ENTRY, 2
  field :CLUSTER_LOCALITY_ENTRY, 3
end

defmodule Envoy.Config.Route.V3.VirtualHost.TypedPerFilterConfigEntry do
  use Protobuf,
    full_name: "envoy.config.route.v3.VirtualHost.TypedPerFilterConfigEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Any
end

defmodule Envoy.Config.Route.V3.VirtualHost do
  @moduledoc """
  The top level element in the routing configuration is a virtual host. Each virtual host has
  a logical name as well as a set of domains that get routed to it based on the incoming request's
  host header. This allows a single listener to service multiple top level domain path trees. Once
  a virtual host is selected based on the domain, the routes are processed in order to see which
  upstream cluster to route to or whether to perform a redirect.
  [#next-free-field: 26]
  [#protodoc-title: HTTP route components]
  * Routing :ref:`architecture overview <arch_overview_http_routing>`
  * HTTP :ref:`router filter <config_http_filters_router>`
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.VirtualHost",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :domains, 2, repeated: true, type: :string, deprecated: false
  field :routes, 3, repeated: true, type: Envoy.Config.Route.V3.Route, deprecated: false
  field :matcher, 21, type: Xds.Type.Matcher.V3.Matcher, deprecated: false

  field :require_tls, 4,
    type: Envoy.Config.Route.V3.VirtualHost.TlsRequirementType,
    json_name: "requireTls",
    enum: true,
    deprecated: false

  field :virtual_clusters, 5,
    repeated: true,
    type: Envoy.Config.Route.V3.VirtualCluster,
    json_name: "virtualClusters"

  field :rate_limits, 6,
    repeated: true,
    type: Envoy.Config.Route.V3.RateLimit,
    json_name: "rateLimits"

  field :request_headers_to_add, 7,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "requestHeadersToAdd",
    deprecated: false

  field :request_headers_to_remove, 13,
    repeated: true,
    type: :string,
    json_name: "requestHeadersToRemove",
    deprecated: false

  field :response_headers_to_add, 10,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "responseHeadersToAdd",
    deprecated: false

  field :response_headers_to_remove, 11,
    repeated: true,
    type: :string,
    json_name: "responseHeadersToRemove",
    deprecated: false

  field :cors, 8, type: Envoy.Config.Route.V3.CorsPolicy, deprecated: true

  field :typed_per_filter_config, 15,
    repeated: true,
    type: Envoy.Config.Route.V3.VirtualHost.TypedPerFilterConfigEntry,
    json_name: "typedPerFilterConfig",
    map: true

  field :include_request_attempt_count, 14, type: :bool, json_name: "includeRequestAttemptCount"

  field :include_attempt_count_in_response, 19,
    type: :bool,
    json_name: "includeAttemptCountInResponse"

  field :retry_policy, 16, type: Envoy.Config.Route.V3.RetryPolicy, json_name: "retryPolicy"

  field :retry_policy_typed_config, 20,
    type: Google.Protobuf.Any,
    json_name: "retryPolicyTypedConfig"

  field :hedge_policy, 17, type: Envoy.Config.Route.V3.HedgePolicy, json_name: "hedgePolicy"

  field :include_is_timeout_retry_header, 23,
    type: :bool,
    json_name: "includeIsTimeoutRetryHeader"

  field :per_request_buffer_limit_bytes, 18,
    type: Google.Protobuf.UInt32Value,
    json_name: "perRequestBufferLimitBytes",
    deprecated: true

  field :request_body_buffer_limit, 25,
    type: Google.Protobuf.UInt64Value,
    json_name: "requestBodyBufferLimit",
    deprecated: false

  field :request_mirror_policies, 22,
    repeated: true,
    type: Envoy.Config.Route.V3.RouteAction.RequestMirrorPolicy,
    json_name: "requestMirrorPolicies"

  field :metadata, 24, type: Envoy.Config.Core.V3.Metadata
end

defmodule Envoy.Config.Route.V3.FilterAction do
  @moduledoc """
  A filter-defined action type.
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.FilterAction",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :action, 1, type: Google.Protobuf.Any
end

defmodule Envoy.Config.Route.V3.RouteList do
  @moduledoc """
  This can be used in route matcher :ref:`VirtualHost.matcher <envoy_v3_api_field_config.route.v3.VirtualHost.matcher>`.
  When the matcher matches, routes will be matched and run.
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RouteList",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :routes, 1, repeated: true, type: Envoy.Config.Route.V3.Route
end

defmodule Envoy.Config.Route.V3.Route.TypedPerFilterConfigEntry do
  use Protobuf,
    full_name: "envoy.config.route.v3.Route.TypedPerFilterConfigEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Any
end

defmodule Envoy.Config.Route.V3.Route do
  @moduledoc """
  A route is both a specification of how to match a request as well as an indication of what to do
  next (e.g., redirect, forward, rewrite, etc.).

  .. attention::

    Envoy supports routing on HTTP method via :ref:`header matching
    <envoy_v3_api_msg_config.route.v3.HeaderMatcher>`.
  [#next-free-field: 21]
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.Route",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :action, 0

  field :name, 14, type: :string
  field :match, 1, type: Envoy.Config.Route.V3.RouteMatch, deprecated: false
  field :route, 2, type: Envoy.Config.Route.V3.RouteAction, oneof: 0
  field :redirect, 3, type: Envoy.Config.Route.V3.RedirectAction, oneof: 0

  field :direct_response, 7,
    type: Envoy.Config.Route.V3.DirectResponseAction,
    json_name: "directResponse",
    oneof: 0

  field :filter_action, 17,
    type: Envoy.Config.Route.V3.FilterAction,
    json_name: "filterAction",
    oneof: 0

  field :non_forwarding_action, 18,
    type: Envoy.Config.Route.V3.NonForwardingAction,
    json_name: "nonForwardingAction",
    oneof: 0

  field :metadata, 4, type: Envoy.Config.Core.V3.Metadata
  field :decorator, 5, type: Envoy.Config.Route.V3.Decorator

  field :typed_per_filter_config, 13,
    repeated: true,
    type: Envoy.Config.Route.V3.Route.TypedPerFilterConfigEntry,
    json_name: "typedPerFilterConfig",
    map: true

  field :request_headers_to_add, 9,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "requestHeadersToAdd",
    deprecated: false

  field :request_headers_to_remove, 12,
    repeated: true,
    type: :string,
    json_name: "requestHeadersToRemove",
    deprecated: false

  field :response_headers_to_add, 10,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "responseHeadersToAdd",
    deprecated: false

  field :response_headers_to_remove, 11,
    repeated: true,
    type: :string,
    json_name: "responseHeadersToRemove",
    deprecated: false

  field :tracing, 15, type: Envoy.Config.Route.V3.Tracing

  field :per_request_buffer_limit_bytes, 16,
    type: Google.Protobuf.UInt32Value,
    json_name: "perRequestBufferLimitBytes",
    deprecated: true

  field :stat_prefix, 19, type: :string, json_name: "statPrefix"

  field :request_body_buffer_limit, 20,
    type: Google.Protobuf.UInt64Value,
    json_name: "requestBodyBufferLimit"
end

defmodule Envoy.Config.Route.V3.WeightedCluster.ClusterWeight.TypedPerFilterConfigEntry do
  use Protobuf,
    full_name: "envoy.config.route.v3.WeightedCluster.ClusterWeight.TypedPerFilterConfigEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Any
end

defmodule Envoy.Config.Route.V3.WeightedCluster.ClusterWeight do
  @moduledoc """
  [#next-free-field: 13]
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.WeightedCluster.ClusterWeight",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :host_rewrite_specifier, 0

  field :name, 1, type: :string, deprecated: false
  field :cluster_header, 12, type: :string, json_name: "clusterHeader", deprecated: false
  field :weight, 2, type: Google.Protobuf.UInt32Value
  field :metadata_match, 3, type: Envoy.Config.Core.V3.Metadata, json_name: "metadataMatch"

  field :request_headers_to_add, 4,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "requestHeadersToAdd",
    deprecated: false

  field :request_headers_to_remove, 9,
    repeated: true,
    type: :string,
    json_name: "requestHeadersToRemove",
    deprecated: false

  field :response_headers_to_add, 5,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "responseHeadersToAdd",
    deprecated: false

  field :response_headers_to_remove, 6,
    repeated: true,
    type: :string,
    json_name: "responseHeadersToRemove",
    deprecated: false

  field :typed_per_filter_config, 10,
    repeated: true,
    type: Envoy.Config.Route.V3.WeightedCluster.ClusterWeight.TypedPerFilterConfigEntry,
    json_name: "typedPerFilterConfig",
    map: true

  field :host_rewrite_literal, 11,
    type: :string,
    json_name: "hostRewriteLiteral",
    oneof: 0,
    deprecated: false
end

defmodule Envoy.Config.Route.V3.WeightedCluster do
  @moduledoc """
  Compared to the :ref:`cluster <envoy_v3_api_field_config.route.v3.RouteAction.cluster>` field that specifies a
  single upstream cluster as the target of a request, the :ref:`weighted_clusters
  <envoy_v3_api_field_config.route.v3.RouteAction.weighted_clusters>` option allows for specification of
  multiple upstream clusters along with weights that indicate the percentage of
  traffic to be forwarded to each cluster. The router selects an upstream cluster based on the
  weights.
  [#next-free-field: 6]
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.WeightedCluster",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :random_value_specifier, 0

  field :clusters, 1,
    repeated: true,
    type: Envoy.Config.Route.V3.WeightedCluster.ClusterWeight,
    deprecated: false

  field :total_weight, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "totalWeight",
    deprecated: true

  field :runtime_key_prefix, 2, type: :string, json_name: "runtimeKeyPrefix"
  field :header_name, 4, type: :string, json_name: "headerName", oneof: 0, deprecated: false
  field :use_hash_policy, 5, type: Google.Protobuf.BoolValue, json_name: "useHashPolicy", oneof: 0
end

defmodule Envoy.Config.Route.V3.ClusterSpecifierPlugin do
  @moduledoc """
  Configuration for a cluster specifier plugin.
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.ClusterSpecifierPlugin",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :extension, 1, type: Envoy.Config.Core.V3.TypedExtensionConfig, deprecated: false
  field :is_optional, 2, type: :bool, json_name: "isOptional"
end

defmodule Envoy.Config.Route.V3.RouteMatch.GrpcRouteMatchOptions do
  use Protobuf,
    full_name: "envoy.config.route.v3.RouteMatch.GrpcRouteMatchOptions",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Config.Route.V3.RouteMatch.TlsContextMatchOptions do
  use Protobuf,
    full_name: "envoy.config.route.v3.RouteMatch.TlsContextMatchOptions",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :presented, 1, type: Google.Protobuf.BoolValue
  field :validated, 2, type: Google.Protobuf.BoolValue
end

defmodule Envoy.Config.Route.V3.RouteMatch.ConnectMatcher do
  @moduledoc """
  An extensible message for matching CONNECT or CONNECT-UDP requests.
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RouteMatch.ConnectMatcher",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Config.Route.V3.RouteMatch do
  @moduledoc """
  [#next-free-field: 18]
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RouteMatch",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :path_specifier, 0

  field :prefix, 1, type: :string, oneof: 0
  field :path, 2, type: :string, oneof: 0

  field :safe_regex, 10,
    type: Envoy.Type.Matcher.V3.RegexMatcher,
    json_name: "safeRegex",
    oneof: 0,
    deprecated: false

  field :connect_matcher, 12,
    type: Envoy.Config.Route.V3.RouteMatch.ConnectMatcher,
    json_name: "connectMatcher",
    oneof: 0

  field :path_separated_prefix, 14,
    type: :string,
    json_name: "pathSeparatedPrefix",
    oneof: 0,
    deprecated: false

  field :path_match_policy, 15,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "pathMatchPolicy",
    oneof: 0

  field :case_sensitive, 4, type: Google.Protobuf.BoolValue, json_name: "caseSensitive"

  field :runtime_fraction, 9,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "runtimeFraction"

  field :headers, 6, repeated: true, type: Envoy.Config.Route.V3.HeaderMatcher

  field :query_parameters, 7,
    repeated: true,
    type: Envoy.Config.Route.V3.QueryParameterMatcher,
    json_name: "queryParameters"

  field :cookies, 17, repeated: true, type: Envoy.Config.Route.V3.CookieMatcher
  field :grpc, 8, type: Envoy.Config.Route.V3.RouteMatch.GrpcRouteMatchOptions

  field :tls_context, 11,
    type: Envoy.Config.Route.V3.RouteMatch.TlsContextMatchOptions,
    json_name: "tlsContext"

  field :dynamic_metadata, 13,
    repeated: true,
    type: Envoy.Type.Matcher.V3.MetadataMatcher,
    json_name: "dynamicMetadata"

  field :filter_state, 16,
    repeated: true,
    type: Envoy.Type.Matcher.V3.FilterStateMatcher,
    json_name: "filterState"
end

defmodule Envoy.Config.Route.V3.CorsPolicy do
  @moduledoc """
  Cors policy configuration.

  .. attention::

    This message has been deprecated. Please use
    :ref:`CorsPolicy in filter extension <envoy_v3_api_msg_extensions.filters.http.cors.v3.CorsPolicy>`
    as as alternative.

  [#next-free-field: 14]
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.CorsPolicy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :enabled_specifier, 0

  field :allow_origin_string_match, 11,
    repeated: true,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "allowOriginStringMatch"

  field :allow_methods, 2, type: :string, json_name: "allowMethods"
  field :allow_headers, 3, type: :string, json_name: "allowHeaders"
  field :expose_headers, 4, type: :string, json_name: "exposeHeaders"
  field :max_age, 5, type: :string, json_name: "maxAge"
  field :allow_credentials, 6, type: Google.Protobuf.BoolValue, json_name: "allowCredentials"

  field :filter_enabled, 9,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "filterEnabled",
    oneof: 0

  field :shadow_enabled, 10,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "shadowEnabled"

  field :allow_private_network_access, 12,
    type: Google.Protobuf.BoolValue,
    json_name: "allowPrivateNetworkAccess"

  field :forward_not_matching_preflights, 13,
    type: Google.Protobuf.BoolValue,
    json_name: "forwardNotMatchingPreflights"
end

defmodule Envoy.Config.Route.V3.RouteAction.RequestMirrorPolicy do
  @moduledoc """
  The router is capable of shadowing traffic from one cluster to another. The current
  implementation is "fire and forget," meaning Envoy will not wait for the shadow cluster to
  respond before returning the response from the primary cluster. All normal statistics are
  collected for the shadow cluster making this feature useful for testing.

  During shadowing, the host/authority header is altered such that ``-shadow`` is appended. This is
  useful for logging. For example, ``cluster1`` becomes ``cluster1-shadow``. This behavior can be
  disabled by setting ``disable_shadow_host_suffix_append`` to ``true``.

  .. note::

    Shadowing will not be triggered if the primary cluster does not exist.

  .. note::

    Shadowing doesn't support HTTP CONNECT and upgrades.
  [#next-free-field: 9]
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RouteAction.RequestMirrorPolicy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :cluster, 1, type: :string, deprecated: false
  field :cluster_header, 5, type: :string, json_name: "clusterHeader", deprecated: false

  field :runtime_fraction, 3,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "runtimeFraction"

  field :trace_sampled, 4, type: Google.Protobuf.BoolValue, json_name: "traceSampled"

  field :disable_shadow_host_suffix_append, 6,
    type: :bool,
    json_name: "disableShadowHostSuffixAppend"

  field :request_headers_mutations, 7,
    repeated: true,
    type: Envoy.Config.Common.MutationRules.V3.HeaderMutation,
    json_name: "requestHeadersMutations",
    deprecated: false

  field :host_rewrite_literal, 8,
    type: :string,
    json_name: "hostRewriteLiteral",
    deprecated: false
end

defmodule Envoy.Config.Route.V3.RouteAction.HashPolicy.Header do
  use Protobuf,
    full_name: "envoy.config.route.v3.RouteAction.HashPolicy.Header",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :header_name, 1, type: :string, json_name: "headerName", deprecated: false

  field :regex_rewrite, 2,
    type: Envoy.Type.Matcher.V3.RegexMatchAndSubstitute,
    json_name: "regexRewrite"
end

defmodule Envoy.Config.Route.V3.RouteAction.HashPolicy.CookieAttribute do
  @moduledoc """
  CookieAttribute defines an API for adding additional attributes for a HTTP cookie.
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RouteAction.HashPolicy.CookieAttribute",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :value, 2, type: :string, deprecated: false
end

defmodule Envoy.Config.Route.V3.RouteAction.HashPolicy.Cookie do
  @moduledoc """
  Envoy supports two types of cookie affinity:

  1. Passive. Envoy takes a cookie that's present in the cookies header and
     hashes on its value.

  2. Generated. Envoy generates and sets a cookie with an expiration (TTL)
     on the first request from the client in its response to the client,
     based on the endpoint the request gets sent to. The client then
     presents this on the next and all subsequent requests. The hash of
     this is sufficient to ensure these requests get sent to the same
     endpoint. The cookie is generated by hashing the source and
     destination ports and addresses so that multiple independent HTTP2
     streams on the same connection will independently receive the same
     cookie, even if they arrive at the Envoy simultaneously.
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RouteAction.HashPolicy.Cookie",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :ttl, 2, type: Google.Protobuf.Duration
  field :path, 3, type: :string

  field :attributes, 4,
    repeated: true,
    type: Envoy.Config.Route.V3.RouteAction.HashPolicy.CookieAttribute
end

defmodule Envoy.Config.Route.V3.RouteAction.HashPolicy.ConnectionProperties do
  use Protobuf,
    full_name: "envoy.config.route.v3.RouteAction.HashPolicy.ConnectionProperties",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :source_ip, 1, type: :bool, json_name: "sourceIp"
end

defmodule Envoy.Config.Route.V3.RouteAction.HashPolicy.QueryParameter do
  use Protobuf,
    full_name: "envoy.config.route.v3.RouteAction.HashPolicy.QueryParameter",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
end

defmodule Envoy.Config.Route.V3.RouteAction.HashPolicy.FilterState do
  use Protobuf,
    full_name: "envoy.config.route.v3.RouteAction.HashPolicy.FilterState",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string, deprecated: false
end

defmodule Envoy.Config.Route.V3.RouteAction.HashPolicy do
  @moduledoc """
  Specifies the route's hashing policy if the upstream cluster uses a hashing :ref:`load balancer
  <arch_overview_load_balancing_types>`.
  [#next-free-field: 7]
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RouteAction.HashPolicy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :policy_specifier, 0

  field :header, 1, type: Envoy.Config.Route.V3.RouteAction.HashPolicy.Header, oneof: 0
  field :cookie, 2, type: Envoy.Config.Route.V3.RouteAction.HashPolicy.Cookie, oneof: 0

  field :connection_properties, 3,
    type: Envoy.Config.Route.V3.RouteAction.HashPolicy.ConnectionProperties,
    json_name: "connectionProperties",
    oneof: 0

  field :query_parameter, 5,
    type: Envoy.Config.Route.V3.RouteAction.HashPolicy.QueryParameter,
    json_name: "queryParameter",
    oneof: 0

  field :filter_state, 6,
    type: Envoy.Config.Route.V3.RouteAction.HashPolicy.FilterState,
    json_name: "filterState",
    oneof: 0

  field :terminal, 4, type: :bool
end

defmodule Envoy.Config.Route.V3.RouteAction.UpgradeConfig.ConnectConfig do
  @moduledoc """
  Configuration for sending data upstream as a raw data payload. This is used for
  CONNECT or POST requests, when forwarding request payload as raw TCP.
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RouteAction.UpgradeConfig.ConnectConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :proxy_protocol_config, 1,
    type: Envoy.Config.Core.V3.ProxyProtocolConfig,
    json_name: "proxyProtocolConfig"

  field :allow_post, 2, type: :bool, json_name: "allowPost"
end

defmodule Envoy.Config.Route.V3.RouteAction.UpgradeConfig do
  @moduledoc """
  Allows enabling and disabling upgrades on a per-route basis.
  This overrides any enabled/disabled upgrade filter chain specified in the
  HttpConnectionManager
  :ref:`upgrade_configs
  <envoy_v3_api_field_extensions.filters.network.http_connection_manager.v3.HttpConnectionManager.upgrade_configs>`
  but does not affect any custom filter chain specified there.
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RouteAction.UpgradeConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :upgrade_type, 1, type: :string, json_name: "upgradeType", deprecated: false
  field :enabled, 2, type: Google.Protobuf.BoolValue

  field :connect_config, 3,
    type: Envoy.Config.Route.V3.RouteAction.UpgradeConfig.ConnectConfig,
    json_name: "connectConfig"
end

defmodule Envoy.Config.Route.V3.RouteAction.MaxStreamDuration do
  use Protobuf,
    full_name: "envoy.config.route.v3.RouteAction.MaxStreamDuration",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :max_stream_duration, 1, type: Google.Protobuf.Duration, json_name: "maxStreamDuration"

  field :grpc_timeout_header_max, 2,
    type: Google.Protobuf.Duration,
    json_name: "grpcTimeoutHeaderMax"

  field :grpc_timeout_header_offset, 3,
    type: Google.Protobuf.Duration,
    json_name: "grpcTimeoutHeaderOffset"
end

defmodule Envoy.Config.Route.V3.RouteAction do
  @moduledoc """
  [#next-free-field: 46]
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RouteAction",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :cluster_specifier, 0

  oneof :host_rewrite_specifier, 1

  field :cluster, 1, type: :string, oneof: 0, deprecated: false
  field :cluster_header, 2, type: :string, json_name: "clusterHeader", oneof: 0, deprecated: false

  field :weighted_clusters, 3,
    type: Envoy.Config.Route.V3.WeightedCluster,
    json_name: "weightedClusters",
    oneof: 0

  field :cluster_specifier_plugin, 37,
    type: :string,
    json_name: "clusterSpecifierPlugin",
    oneof: 0

  field :inline_cluster_specifier_plugin, 39,
    type: Envoy.Config.Route.V3.ClusterSpecifierPlugin,
    json_name: "inlineClusterSpecifierPlugin",
    oneof: 0

  field :cluster_not_found_response_code, 20,
    type: Envoy.Config.Route.V3.RouteAction.ClusterNotFoundResponseCode,
    json_name: "clusterNotFoundResponseCode",
    enum: true,
    deprecated: false

  field :metadata_match, 4, type: Envoy.Config.Core.V3.Metadata, json_name: "metadataMatch"
  field :prefix_rewrite, 5, type: :string, json_name: "prefixRewrite", deprecated: false

  field :regex_rewrite, 32,
    type: Envoy.Type.Matcher.V3.RegexMatchAndSubstitute,
    json_name: "regexRewrite"

  field :path_rewrite_policy, 41,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "pathRewritePolicy"

  field :path_rewrite, 45, type: :string, json_name: "pathRewrite"

  field :host_rewrite_literal, 6,
    type: :string,
    json_name: "hostRewriteLiteral",
    oneof: 1,
    deprecated: false

  field :auto_host_rewrite, 7,
    type: Google.Protobuf.BoolValue,
    json_name: "autoHostRewrite",
    oneof: 1

  field :host_rewrite_header, 29,
    type: :string,
    json_name: "hostRewriteHeader",
    oneof: 1,
    deprecated: false

  field :host_rewrite_path_regex, 35,
    type: Envoy.Type.Matcher.V3.RegexMatchAndSubstitute,
    json_name: "hostRewritePathRegex",
    oneof: 1

  field :host_rewrite, 44, type: :string, json_name: "hostRewrite", oneof: 1
  field :append_x_forwarded_host, 38, type: :bool, json_name: "appendXForwardedHost"
  field :timeout, 8, type: Google.Protobuf.Duration
  field :idle_timeout, 24, type: Google.Protobuf.Duration, json_name: "idleTimeout"
  field :flush_timeout, 42, type: Google.Protobuf.Duration, json_name: "flushTimeout"

  field :early_data_policy, 40,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "earlyDataPolicy"

  field :retry_policy, 9, type: Envoy.Config.Route.V3.RetryPolicy, json_name: "retryPolicy"

  field :retry_policy_typed_config, 33,
    type: Google.Protobuf.Any,
    json_name: "retryPolicyTypedConfig"

  field :request_mirror_policies, 30,
    repeated: true,
    type: Envoy.Config.Route.V3.RouteAction.RequestMirrorPolicy,
    json_name: "requestMirrorPolicies"

  field :priority, 11, type: Envoy.Config.Core.V3.RoutingPriority, enum: true, deprecated: false

  field :rate_limits, 13,
    repeated: true,
    type: Envoy.Config.Route.V3.RateLimit,
    json_name: "rateLimits"

  field :include_vh_rate_limits, 14,
    type: Google.Protobuf.BoolValue,
    json_name: "includeVhRateLimits",
    deprecated: true

  field :hash_policy, 15,
    repeated: true,
    type: Envoy.Config.Route.V3.RouteAction.HashPolicy,
    json_name: "hashPolicy"

  field :cors, 17, type: Envoy.Config.Route.V3.CorsPolicy, deprecated: true

  field :max_grpc_timeout, 23,
    type: Google.Protobuf.Duration,
    json_name: "maxGrpcTimeout",
    deprecated: true

  field :grpc_timeout_offset, 28,
    type: Google.Protobuf.Duration,
    json_name: "grpcTimeoutOffset",
    deprecated: true

  field :upgrade_configs, 25,
    repeated: true,
    type: Envoy.Config.Route.V3.RouteAction.UpgradeConfig,
    json_name: "upgradeConfigs"

  field :internal_redirect_policy, 34,
    type: Envoy.Config.Route.V3.InternalRedirectPolicy,
    json_name: "internalRedirectPolicy"

  field :internal_redirect_action, 26,
    type: Envoy.Config.Route.V3.RouteAction.InternalRedirectAction,
    json_name: "internalRedirectAction",
    enum: true,
    deprecated: true

  field :max_internal_redirects, 31,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxInternalRedirects",
    deprecated: true

  field :hedge_policy, 27, type: Envoy.Config.Route.V3.HedgePolicy, json_name: "hedgePolicy"

  field :max_stream_duration, 36,
    type: Envoy.Config.Route.V3.RouteAction.MaxStreamDuration,
    json_name: "maxStreamDuration"
end

defmodule Envoy.Config.Route.V3.RetryPolicy.RetryPriority do
  use Protobuf,
    full_name: "envoy.config.route.v3.RetryPolicy.RetryPriority",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Config.Route.V3.RetryPolicy.RetryHostPredicate do
  use Protobuf,
    full_name: "envoy.config.route.v3.RetryPolicy.RetryHostPredicate",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Config.Route.V3.RetryPolicy.RetryBackOff do
  use Protobuf,
    full_name: "envoy.config.route.v3.RetryPolicy.RetryBackOff",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :base_interval, 1,
    type: Google.Protobuf.Duration,
    json_name: "baseInterval",
    deprecated: false

  field :max_interval, 2,
    type: Google.Protobuf.Duration,
    json_name: "maxInterval",
    deprecated: false
end

defmodule Envoy.Config.Route.V3.RetryPolicy.ResetHeader do
  use Protobuf,
    full_name: "envoy.config.route.v3.RetryPolicy.ResetHeader",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false

  field :format, 2,
    type: Envoy.Config.Route.V3.RetryPolicy.ResetHeaderFormat,
    enum: true,
    deprecated: false
end

defmodule Envoy.Config.Route.V3.RetryPolicy.RateLimitedRetryBackOff do
  @moduledoc """
  A retry back-off strategy that applies when the upstream server rate limits
  the request.

  Given this configuration:

  .. code-block:: yaml

    rate_limited_retry_back_off:
      reset_headers:
      - name: Retry-After
        format: SECONDS
      - name: X-RateLimit-Reset
        format: UNIX_TIMESTAMP
      max_interval: "300s"

  The following algorithm will apply:

   1. If the response contains the header ``Retry-After`` its value must be on
      the form ``120`` (an integer that represents the number of seconds to
      wait before retrying). If so, this value is used as the back-off interval.
   2. Otherwise, if the response contains the header ``X-RateLimit-Reset`` its
      value must be on the form ``1595320702`` (an integer that represents the
      point in time at which to retry, as a Unix timestamp in seconds). If so,
      the current time is subtracted from this value and the result is used as
      the back-off interval.
   3. Otherwise, Envoy will use the default
      :ref:`exponential back-off <envoy_v3_api_field_config.route.v3.RetryPolicy.retry_back_off>`
      strategy.

  No matter which format is used, if the resulting back-off interval exceeds
  ``max_interval`` it is discarded and the next header in ``reset_headers``
  is tried. If a request timeout is configured for the route it will further
  limit how long the request will be allowed to run.

  To prevent many clients retrying at the same point in time jitter is added
  to the back-off interval, so the resulting interval is decided by taking:
  ``random(interval, interval * 1.5)``.

  .. attention::

    Configuring ``rate_limited_retry_back_off`` will not by itself cause a request
    to be retried. You will still need to configure the right retry policy to match
    the responses from the upstream server.
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RetryPolicy.RateLimitedRetryBackOff",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :reset_headers, 1,
    repeated: true,
    type: Envoy.Config.Route.V3.RetryPolicy.ResetHeader,
    json_name: "resetHeaders",
    deprecated: false

  field :max_interval, 2,
    type: Google.Protobuf.Duration,
    json_name: "maxInterval",
    deprecated: false
end

defmodule Envoy.Config.Route.V3.RetryPolicy do
  @moduledoc """
  HTTP retry :ref:`architecture overview <arch_overview_http_routing_retry>`.
  [#next-free-field: 15]
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RetryPolicy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :retry_on, 1, type: :string, json_name: "retryOn"

  field :num_retries, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "numRetries",
    deprecated: false

  field :per_try_timeout, 3, type: Google.Protobuf.Duration, json_name: "perTryTimeout"
  field :per_try_idle_timeout, 13, type: Google.Protobuf.Duration, json_name: "perTryIdleTimeout"

  field :retry_priority, 4,
    type: Envoy.Config.Route.V3.RetryPolicy.RetryPriority,
    json_name: "retryPriority"

  field :retry_host_predicate, 5,
    repeated: true,
    type: Envoy.Config.Route.V3.RetryPolicy.RetryHostPredicate,
    json_name: "retryHostPredicate"

  field :retry_options_predicates, 12,
    repeated: true,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "retryOptionsPredicates"

  field :host_selection_retry_max_attempts, 6,
    type: :int64,
    json_name: "hostSelectionRetryMaxAttempts"

  field :retriable_status_codes, 7,
    repeated: true,
    type: :uint32,
    json_name: "retriableStatusCodes"

  field :retry_back_off, 8,
    type: Envoy.Config.Route.V3.RetryPolicy.RetryBackOff,
    json_name: "retryBackOff"

  field :rate_limited_retry_back_off, 11,
    type: Envoy.Config.Route.V3.RetryPolicy.RateLimitedRetryBackOff,
    json_name: "rateLimitedRetryBackOff"

  field :retriable_headers, 9,
    repeated: true,
    type: Envoy.Config.Route.V3.HeaderMatcher,
    json_name: "retriableHeaders"

  field :retriable_request_headers, 10,
    repeated: true,
    type: Envoy.Config.Route.V3.HeaderMatcher,
    json_name: "retriableRequestHeaders"

  field :refresh_cluster_on_retry, 14, type: :bool, json_name: "refreshClusterOnRetry"
end

defmodule Envoy.Config.Route.V3.HedgePolicy do
  @moduledoc """
  HTTP request hedging :ref:`architecture overview <arch_overview_http_routing_hedging>`.
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.HedgePolicy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :initial_requests, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "initialRequests",
    deprecated: false

  field :additional_request_chance, 2,
    type: Envoy.Type.V3.FractionalPercent,
    json_name: "additionalRequestChance"

  field :hedge_on_per_try_timeout, 3, type: :bool, json_name: "hedgeOnPerTryTimeout"
end

defmodule Envoy.Config.Route.V3.RedirectAction do
  @moduledoc """
  [#next-free-field: 11]
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RedirectAction",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :scheme_rewrite_specifier, 0

  oneof :path_rewrite_specifier, 1

  field :https_redirect, 4, type: :bool, json_name: "httpsRedirect", oneof: 0
  field :scheme_redirect, 7, type: :string, json_name: "schemeRedirect", oneof: 0
  field :host_redirect, 1, type: :string, json_name: "hostRedirect", deprecated: false
  field :port_redirect, 8, type: :uint32, json_name: "portRedirect"
  field :path_redirect, 2, type: :string, json_name: "pathRedirect", oneof: 1, deprecated: false
  field :prefix_rewrite, 5, type: :string, json_name: "prefixRewrite", oneof: 1, deprecated: false

  field :regex_rewrite, 9,
    type: Envoy.Type.Matcher.V3.RegexMatchAndSubstitute,
    json_name: "regexRewrite",
    oneof: 1

  field :path_rewrite, 10, type: :string, json_name: "pathRewrite", oneof: 1

  field :response_code, 3,
    type: Envoy.Config.Route.V3.RedirectAction.RedirectResponseCode,
    json_name: "responseCode",
    enum: true,
    deprecated: false

  field :strip_query, 6, type: :bool, json_name: "stripQuery"
end

defmodule Envoy.Config.Route.V3.DirectResponseAction do
  use Protobuf,
    full_name: "envoy.config.route.v3.DirectResponseAction",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :status, 1, type: :uint32, deprecated: false
  field :body, 2, type: Envoy.Config.Core.V3.DataSource

  field :body_format, 3,
    type: Envoy.Config.Core.V3.SubstitutionFormatString,
    json_name: "bodyFormat"
end

defmodule Envoy.Config.Route.V3.NonForwardingAction do
  @moduledoc """
  [#not-implemented-hide:]
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.NonForwardingAction",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Config.Route.V3.Decorator do
  use Protobuf,
    full_name: "envoy.config.route.v3.Decorator",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :operation, 1, type: :string, deprecated: false
  field :propagate, 2, type: Google.Protobuf.BoolValue
end

defmodule Envoy.Config.Route.V3.Tracing do
  @moduledoc """
  [#next-free-field: 7]
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.Tracing",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :client_sampling, 1, type: Envoy.Type.V3.FractionalPercent, json_name: "clientSampling"
  field :random_sampling, 2, type: Envoy.Type.V3.FractionalPercent, json_name: "randomSampling"
  field :overall_sampling, 3, type: Envoy.Type.V3.FractionalPercent, json_name: "overallSampling"

  field :custom_tags, 4,
    repeated: true,
    type: Envoy.Type.Tracing.V3.CustomTag,
    json_name: "customTags"

  field :operation, 5, type: :string
  field :upstream_operation, 6, type: :string, json_name: "upstreamOperation"
end

defmodule Envoy.Config.Route.V3.VirtualCluster do
  @moduledoc """
  A virtual cluster is a way of specifying a regex matching rule against
  certain important endpoints such that statistics are generated explicitly for
  the matched requests. The reason this is useful is that when doing
  prefix/path matching Envoy does not always know what the application
  considers to be an endpoint. Thus, it’s impossible for Envoy to generically
  emit per endpoint statistics. However, often systems have highly critical
  endpoints that they wish to get “perfect” statistics on. Virtual cluster
  statistics are perfect in the sense that they are emitted on the downstream
  side such that they include network level failures.

  Documentation for :ref:`virtual cluster statistics <config_http_filters_router_vcluster_stats>`.

  .. note::

     Virtual clusters are a useful tool, but we do not recommend setting up a virtual cluster for
     every application endpoint. This is both not easily maintainable and as well the matching and
     statistics output are not free.
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.VirtualCluster",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :headers, 4, repeated: true, type: Envoy.Config.Route.V3.HeaderMatcher
  field :name, 2, type: :string, deprecated: false
end

defmodule Envoy.Config.Route.V3.RateLimit.Action.SourceCluster do
  @moduledoc """
  The following descriptor entry is appended to the descriptor:

  .. code-block:: cpp

    ("source_cluster", "<local service cluster>")

  <local service cluster> is derived from the :option:`--service-cluster` option.
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RateLimit.Action.SourceCluster",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Config.Route.V3.RateLimit.Action.DestinationCluster do
  @moduledoc """
  The following descriptor entry is appended to the descriptor:

  .. code-block:: cpp

    ("destination_cluster", "<routed target cluster>")

  Once a request matches against a route table rule, a routed cluster is determined by one of
  the following :ref:`route table configuration <envoy_v3_api_msg_config.route.v3.RouteConfiguration>`
  settings:

  * :ref:`cluster <envoy_v3_api_field_config.route.v3.RouteAction.cluster>` indicates the upstream cluster
    to route to.
  * :ref:`weighted_clusters <envoy_v3_api_field_config.route.v3.RouteAction.weighted_clusters>`
    chooses a cluster randomly from a set of clusters with attributed weight.
  * :ref:`cluster_header <envoy_v3_api_field_config.route.v3.RouteAction.cluster_header>` indicates which
    header in the request contains the target cluster.
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RateLimit.Action.DestinationCluster",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Config.Route.V3.RateLimit.Action.RequestHeaders do
  @moduledoc """
  The following descriptor entry is appended when a header contains a key that matches the
  ``header_name``:

  .. code-block:: cpp

    ("<descriptor_key>", "<header_value_queried_from_header>")
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RateLimit.Action.RequestHeaders",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :header_name, 1, type: :string, json_name: "headerName", deprecated: false
  field :descriptor_key, 2, type: :string, json_name: "descriptorKey", deprecated: false
  field :skip_if_absent, 3, type: :bool, json_name: "skipIfAbsent"
end

defmodule Envoy.Config.Route.V3.RateLimit.Action.QueryParameters do
  @moduledoc """
  The following descriptor entry is appended when a query parameter contains a key that matches the
  ``query_parameter_name``:

  .. code-block:: cpp

    ("<descriptor_key>", "<query_parameter_value_queried_from_query_parameter>")
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RateLimit.Action.QueryParameters",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :query_parameter_name, 1,
    type: :string,
    json_name: "queryParameterName",
    deprecated: false

  field :descriptor_key, 2, type: :string, json_name: "descriptorKey", deprecated: false
  field :skip_if_absent, 3, type: :bool, json_name: "skipIfAbsent"
end

defmodule Envoy.Config.Route.V3.RateLimit.Action.RemoteAddress do
  @moduledoc """
  The following descriptor entry is appended to the descriptor and is populated using the
  trusted address from :ref:`x-forwarded-for <config_http_conn_man_headers_x-forwarded-for>`:

  .. code-block:: cpp

    ("remote_address", "<trusted address from x-forwarded-for>")
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RateLimit.Action.RemoteAddress",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Config.Route.V3.RateLimit.Action.MaskedRemoteAddress do
  @moduledoc """
  The following descriptor entry is appended to the descriptor and is populated using the
  masked address from :ref:`x-forwarded-for <config_http_conn_man_headers_x-forwarded-for>`:

  .. code-block:: cpp

    ("masked_remote_address", "<masked address from x-forwarded-for>")
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RateLimit.Action.MaskedRemoteAddress",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :v4_prefix_mask_len, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "v4PrefixMaskLen",
    deprecated: false

  field :v6_prefix_mask_len, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "v6PrefixMaskLen",
    deprecated: false
end

defmodule Envoy.Config.Route.V3.RateLimit.Action.GenericKey do
  @moduledoc """
  The following descriptor entry is appended to the descriptor:

  .. code-block:: cpp

    ("generic_key", "<descriptor_value>")
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RateLimit.Action.GenericKey",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :descriptor_value, 1, type: :string, json_name: "descriptorValue", deprecated: false
  field :default_value, 3, type: :string, json_name: "defaultValue"
  field :descriptor_key, 2, type: :string, json_name: "descriptorKey"
end

defmodule Envoy.Config.Route.V3.RateLimit.Action.HeaderValueMatch do
  @moduledoc """
  The following descriptor entry is appended to the descriptor:

  .. code-block:: cpp

    ("header_match", "<descriptor_value>")
  [#next-free-field: 6]
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RateLimit.Action.HeaderValueMatch",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :descriptor_value, 1, type: :string, json_name: "descriptorValue", deprecated: false
  field :default_value, 5, type: :string, json_name: "defaultValue"
  field :descriptor_key, 4, type: :string, json_name: "descriptorKey"
  field :expect_match, 2, type: Google.Protobuf.BoolValue, json_name: "expectMatch"
  field :headers, 3, repeated: true, type: Envoy.Config.Route.V3.HeaderMatcher, deprecated: false
end

defmodule Envoy.Config.Route.V3.RateLimit.Action.DynamicMetaData do
  @moduledoc """
  The following descriptor entry is appended when the
  :ref:`dynamic metadata <well_known_dynamic_metadata>` contains a key value:

  .. code-block:: cpp

    ("<descriptor_key>", "<value_queried_from_dynamic_metadata>")

  .. attention::
    This action has been deprecated in favor of the :ref:`metadata <envoy_v3_api_msg_config.route.v3.RateLimit.Action.MetaData>` action
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RateLimit.Action.DynamicMetaData",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :descriptor_key, 1, type: :string, json_name: "descriptorKey", deprecated: false

  field :metadata_key, 2,
    type: Envoy.Type.Metadata.V3.MetadataKey,
    json_name: "metadataKey",
    deprecated: false

  field :default_value, 3, type: :string, json_name: "defaultValue"
end

defmodule Envoy.Config.Route.V3.RateLimit.Action.MetaData do
  @moduledoc """
  The following descriptor entry is appended when the metadata contains a key value:

  .. code-block:: cpp

    ("<descriptor_key>", "<value_queried_from_metadata>")
  [#next-free-field: 6]
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RateLimit.Action.MetaData",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :descriptor_key, 1, type: :string, json_name: "descriptorKey", deprecated: false

  field :metadata_key, 2,
    type: Envoy.Type.Metadata.V3.MetadataKey,
    json_name: "metadataKey",
    deprecated: false

  field :default_value, 3, type: :string, json_name: "defaultValue"

  field :source, 4,
    type: Envoy.Config.Route.V3.RateLimit.Action.MetaData.Source,
    enum: true,
    deprecated: false

  field :skip_if_absent, 5, type: :bool, json_name: "skipIfAbsent"
end

defmodule Envoy.Config.Route.V3.RateLimit.Action.QueryParameterValueMatch do
  @moduledoc """
  The following descriptor entry is appended to the descriptor:

  .. code-block:: cpp

    ("query_match", "<descriptor_value>")
  [#next-free-field: 6]
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RateLimit.Action.QueryParameterValueMatch",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :descriptor_value, 1, type: :string, json_name: "descriptorValue", deprecated: false
  field :default_value, 5, type: :string, json_name: "defaultValue"
  field :descriptor_key, 4, type: :string, json_name: "descriptorKey"
  field :expect_match, 2, type: Google.Protobuf.BoolValue, json_name: "expectMatch"

  field :query_parameters, 3,
    repeated: true,
    type: Envoy.Config.Route.V3.QueryParameterMatcher,
    json_name: "queryParameters",
    deprecated: false
end

defmodule Envoy.Config.Route.V3.RateLimit.Action.RemoteAddressMatch do
  @moduledoc """
  The following descriptor entry is appended to the descriptor:

  .. code-block:: cpp

    ("remote_address_match", "<descriptor_value>")
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RateLimit.Action.RemoteAddressMatch",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :descriptor_value, 1, type: :string, json_name: "descriptorValue", deprecated: false
  field :descriptor_key, 2, type: :string, json_name: "descriptorKey"
  field :default_value, 3, type: :string, json_name: "defaultValue"

  field :address_matcher, 4,
    type: Envoy.Type.Matcher.V3.AddressMatcher,
    json_name: "addressMatcher",
    deprecated: false
end

defmodule Envoy.Config.Route.V3.RateLimit.Action do
  @moduledoc """
  [#next-free-field: 14]
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RateLimit.Action",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :action_specifier, 0

  field :source_cluster, 1,
    type: Envoy.Config.Route.V3.RateLimit.Action.SourceCluster,
    json_name: "sourceCluster",
    oneof: 0

  field :destination_cluster, 2,
    type: Envoy.Config.Route.V3.RateLimit.Action.DestinationCluster,
    json_name: "destinationCluster",
    oneof: 0

  field :request_headers, 3,
    type: Envoy.Config.Route.V3.RateLimit.Action.RequestHeaders,
    json_name: "requestHeaders",
    oneof: 0

  field :query_parameters, 12,
    type: Envoy.Config.Route.V3.RateLimit.Action.QueryParameters,
    json_name: "queryParameters",
    oneof: 0

  field :remote_address, 4,
    type: Envoy.Config.Route.V3.RateLimit.Action.RemoteAddress,
    json_name: "remoteAddress",
    oneof: 0

  field :generic_key, 5,
    type: Envoy.Config.Route.V3.RateLimit.Action.GenericKey,
    json_name: "genericKey",
    oneof: 0

  field :header_value_match, 6,
    type: Envoy.Config.Route.V3.RateLimit.Action.HeaderValueMatch,
    json_name: "headerValueMatch",
    oneof: 0

  field :dynamic_metadata, 7,
    type: Envoy.Config.Route.V3.RateLimit.Action.DynamicMetaData,
    json_name: "dynamicMetadata",
    oneof: 0,
    deprecated: true

  field :metadata, 8, type: Envoy.Config.Route.V3.RateLimit.Action.MetaData, oneof: 0
  field :extension, 9, type: Envoy.Config.Core.V3.TypedExtensionConfig, oneof: 0

  field :masked_remote_address, 10,
    type: Envoy.Config.Route.V3.RateLimit.Action.MaskedRemoteAddress,
    json_name: "maskedRemoteAddress",
    oneof: 0

  field :query_parameter_value_match, 11,
    type: Envoy.Config.Route.V3.RateLimit.Action.QueryParameterValueMatch,
    json_name: "queryParameterValueMatch",
    oneof: 0

  field :remote_address_match, 13,
    type: Envoy.Config.Route.V3.RateLimit.Action.RemoteAddressMatch,
    json_name: "remoteAddressMatch",
    oneof: 0
end

defmodule Envoy.Config.Route.V3.RateLimit.Override.DynamicMetadata do
  @moduledoc """
  Fetches the override from the dynamic metadata.
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RateLimit.Override.DynamicMetadata",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :metadata_key, 1,
    type: Envoy.Type.Metadata.V3.MetadataKey,
    json_name: "metadataKey",
    deprecated: false
end

defmodule Envoy.Config.Route.V3.RateLimit.Override.RateLimitOverride do
  @moduledoc """
  Rate limit to apply to this descriptor.
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RateLimit.Override.RateLimitOverride",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :requests_per_unit, 1, type: :uint32, json_name: "requestsPerUnit"
  field :unit, 2, type: Envoy.Type.V3.RateLimitUnit, enum: true
end

defmodule Envoy.Config.Route.V3.RateLimit.Override do
  use Protobuf,
    full_name: "envoy.config.route.v3.RateLimit.Override",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :override_specifier, 0

  field :dynamic_metadata, 1,
    type: Envoy.Config.Route.V3.RateLimit.Override.DynamicMetadata,
    json_name: "dynamicMetadata",
    oneof: 0

  field :rate_limit, 2,
    type: Envoy.Config.Route.V3.RateLimit.Override.RateLimitOverride,
    json_name: "rateLimit",
    oneof: 0
end

defmodule Envoy.Config.Route.V3.RateLimit.HitsAddend do
  use Protobuf,
    full_name: "envoy.config.route.v3.RateLimit.HitsAddend",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :number, 1, type: Google.Protobuf.UInt64Value, deprecated: false
  field :format, 2, type: :string, deprecated: false
  field :is_negative_hits, 3, type: :bool, json_name: "isNegativeHits"
end

defmodule Envoy.Config.Route.V3.RateLimit do
  @moduledoc """
  Global rate limiting :ref:`architecture overview <arch_overview_global_rate_limit>`.
  Also applies to Local rate limiting :ref:`using descriptors <config_http_filters_local_rate_limit_descriptors>`.
  [#next-free-field: 8]
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.RateLimit",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :stage, 1, type: Google.Protobuf.UInt32Value, deprecated: false
  field :disable_key, 2, type: :string, json_name: "disableKey"

  field :actions, 3,
    repeated: true,
    type: Envoy.Config.Route.V3.RateLimit.Action,
    deprecated: false

  field :limit, 4, type: Envoy.Config.Route.V3.RateLimit.Override
  field :hits_addend, 5, type: Envoy.Config.Route.V3.RateLimit.HitsAddend, json_name: "hitsAddend"
  field :apply_on_stream_done, 6, type: :bool, json_name: "applyOnStreamDone"

  field :x_ratelimit_option, 7,
    type: Envoy.Config.Route.V3.RateLimit.XRateLimitOption,
    json_name: "xRatelimitOption",
    enum: true
end

defmodule Envoy.Config.Route.V3.HeaderMatcher do
  @moduledoc """
  .. attention::

    Internally, Envoy always uses the HTTP/2 ``:authority`` header to represent the HTTP/1 ``Host``
    header. Thus, if attempting to match on ``Host``, match on ``:authority`` instead.

  .. attention::

    To route on HTTP method, use the special HTTP/2 ``:method`` header. This works for both
    HTTP/1 and HTTP/2 as Envoy normalizes headers. E.g.,

    .. code-block:: json

      {
        "name": ":method",
        "string_match": {
          "exact": "POST"
        }
      }

  .. attention::
    In the absence of any header match specifier, match will default to :ref:`present_match
    <envoy_v3_api_field_config.route.v3.HeaderMatcher.present_match>`. i.e, a request that has the :ref:`name
    <envoy_v3_api_field_config.route.v3.HeaderMatcher.name>` header will match, regardless of the header's
    value.

   [#next-major-version: HeaderMatcher should be refactored to use StringMatcher.]
  [#next-free-field: 15]
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.HeaderMatcher",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :header_match_specifier, 0

  field :name, 1, type: :string, deprecated: false
  field :exact_match, 4, type: :string, json_name: "exactMatch", oneof: 0, deprecated: true

  field :safe_regex_match, 11,
    type: Envoy.Type.Matcher.V3.RegexMatcher,
    json_name: "safeRegexMatch",
    oneof: 0,
    deprecated: true

  field :range_match, 6, type: Envoy.Type.V3.Int64Range, json_name: "rangeMatch", oneof: 0
  field :present_match, 7, type: :bool, json_name: "presentMatch", oneof: 0
  field :prefix_match, 9, type: :string, json_name: "prefixMatch", oneof: 0, deprecated: true
  field :suffix_match, 10, type: :string, json_name: "suffixMatch", oneof: 0, deprecated: true
  field :contains_match, 12, type: :string, json_name: "containsMatch", oneof: 0, deprecated: true

  field :string_match, 13,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "stringMatch",
    oneof: 0

  field :invert_match, 8, type: :bool, json_name: "invertMatch"
  field :treat_missing_header_as_empty, 14, type: :bool, json_name: "treatMissingHeaderAsEmpty"
end

defmodule Envoy.Config.Route.V3.QueryParameterMatcher do
  @moduledoc """
  Query parameter matching treats the query string of a request's :path header
  as an ampersand-separated list of keys and/or key=value elements.
  [#next-free-field: 7]
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.QueryParameterMatcher",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :query_parameter_match_specifier, 0

  field :name, 1, type: :string, deprecated: false

  field :string_match, 5,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "stringMatch",
    oneof: 0,
    deprecated: false

  field :present_match, 6, type: :bool, json_name: "presentMatch", oneof: 0
end

defmodule Envoy.Config.Route.V3.CookieMatcher do
  @moduledoc """
  Cookie matching inspects individual name/value pairs parsed from the ``Cookie`` header.
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.CookieMatcher",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false

  field :string_match, 2,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "stringMatch",
    deprecated: false

  field :invert_match, 3, type: :bool, json_name: "invertMatch"
end

defmodule Envoy.Config.Route.V3.InternalRedirectPolicy do
  @moduledoc """
  HTTP Internal Redirect :ref:`architecture overview <arch_overview_internal_redirects>`.
  [#next-free-field: 6]
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.InternalRedirectPolicy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :max_internal_redirects, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxInternalRedirects"

  field :redirect_response_codes, 2,
    repeated: true,
    type: :uint32,
    json_name: "redirectResponseCodes",
    deprecated: false

  field :predicates, 3, repeated: true, type: Envoy.Config.Core.V3.TypedExtensionConfig
  field :allow_cross_scheme_redirect, 4, type: :bool, json_name: "allowCrossSchemeRedirect"

  field :response_headers_to_copy, 5,
    repeated: true,
    type: :string,
    json_name: "responseHeadersToCopy",
    deprecated: false
end

defmodule Envoy.Config.Route.V3.FilterConfig do
  @moduledoc """
  A simple wrapper for an HTTP filter config. This is intended to be used as a wrapper for the
  map value in
  :ref:`VirtualHost.typed_per_filter_config<envoy_v3_api_field_config.route.v3.VirtualHost.typed_per_filter_config>`,
  :ref:`Route.typed_per_filter_config<envoy_v3_api_field_config.route.v3.Route.typed_per_filter_config>`,
  or :ref:`WeightedCluster.ClusterWeight.typed_per_filter_config<envoy_v3_api_field_config.route.v3.WeightedCluster.ClusterWeight.typed_per_filter_config>`
  to add additional flags to the filter.
  """

  use Protobuf,
    full_name: "envoy.config.route.v3.FilterConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :config, 1, type: Google.Protobuf.Any
  field :is_optional, 2, type: :bool, json_name: "isOptional"
  field :disabled, 3, type: :bool
end
