defmodule Envoy.Extensions.Filters.Http.FilterChain.V3.FilterChainConfig do
  @moduledoc """
  Filter-level configuration for the filter chain filter. This filter acts as a wrapper
  that applies a configurable chain of HTTP filters to incoming requests.

  When a request arrives the filter collects all active filter chains in order from least
  to most specific: ``default_filter_chain`` first, then any per-route chains ordered from
  the outermost scope (e.g. route configuration level) to the innermost scope (route level).
  Each filter in a less-specific chain is applied **unless** a more-specific chain contains
  a filter with the same ``name``.

  The final set of filters is applied in order from least to most specific, so that the
  least-specific filter runs first and the most-specific filter runs last. This allows
  more specific filters to override the behavior of less specific ones.

  If no chains are found at all the filter passes through without modifying the request.
  [#protodoc-title: Filter Chain]
  Filter Chain :ref:`configuration overview <config_http_filters_filter_chain>`.

  .. attention::
    This filter is specific to Envoy and is not supported in other xDS implementations.

  [#extension: envoy.filters.http.filter_chain]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.filter_chain.v3.FilterChainConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :default_filter_chain, 1,
    type: Envoy.Extensions.Filters.Http.FilterChain.V3.FilterChain,
    json_name: "defaultFilterChain"
end

defmodule Envoy.Extensions.Filters.Http.FilterChain.V3.FilterChainConfigPerRoute do
  @moduledoc """
  Per-route configuration for the filter chain filter. This allows different filter chains
  to be applied on different routes.

  .. note::
    Only the initial route match is considered for filter chain selection. Subsequent
    internal route refreshes do not affect the filter chain applied to the request.

  When multiple per-route configs exist along the route hierarchy (e.g. one at virtual-host
  level and one at route level) the same merge rules apply iteratively from least specific
  to most specific, so the most specific definition of any named filter always wins.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.filter_chain.v3.FilterChainConfigPerRoute",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :filter_chain, 1,
    type: Envoy.Extensions.Filters.Http.FilterChain.V3.FilterChain,
    json_name: "filterChain",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.FilterChain.V3.FilterChain do
  @moduledoc """
  A filter chain is a list of HTTP filters that are applied in order.
  This message is used to define a reusable chain of filters.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.filter_chain.v3.FilterChain",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :filters, 1,
    repeated: true,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    deprecated: false
end
