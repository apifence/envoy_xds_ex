defmodule Envoy.Extensions.Filters.Http.Composite.V3.Composite.NamedFilterChainsEntry do
  use Protobuf,
    full_name: "envoy.extensions.filters.http.composite.v3.Composite.NamedFilterChainsEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Extensions.Filters.Http.Composite.V3.FilterChainConfiguration
end

defmodule Envoy.Extensions.Filters.Http.Composite.V3.Composite do
  @moduledoc """
  :ref:`Composite filter <config_http_filters_composite>` config. The composite filter config
  allows delegating filter handling to another filter as determined by matching on the request
  headers. This makes it possible to use different filters or filter configurations based on the
  incoming request.

  This is intended to be used with
  :ref:`ExtensionWithMatcher <envoy_v3_api_msg_extensions.common.matching.v3.ExtensionWithMatcher>`
  where a match tree is specified that indicates (via
  :ref:`ExecuteFilterAction <envoy_v3_api_msg_extensions.filters.http.composite.v3.ExecuteFilterAction>`)
  which filter configuration to create and delegate to.
  [#protodoc-title: Composite]
  Composite Filter :ref:`configuration overview <config_http_filters_composite>`.
  [#extension: envoy.filters.http.composite]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.composite.v3.Composite",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :named_filter_chains, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.Composite.V3.Composite.NamedFilterChainsEntry,
    json_name: "namedFilterChains",
    map: true

  field :matcher, 2, type: Xds.Type.Matcher.V3.Matcher
end

defmodule Envoy.Extensions.Filters.Http.Composite.V3.CompositePerRoute do
  @moduledoc """
  Per-route configuration for the Composite filter.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.composite.v3.CompositePerRoute",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :matcher, 1, type: Xds.Type.Matcher.V3.Matcher, deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.Composite.V3.FilterChainConfiguration do
  @moduledoc """
  A list of filter configurations to be called in order. Note that this can be used as the type
  inside of an ECDS :ref:`TypedExtensionConfig
  <envoy_v3_api_msg_config.core.v3.TypedExtensionConfig>` extension, which allows a chain of
  filters to be configured dynamically. In that case, the types of all filters in the chain must
  be present in the :ref:`ExtensionConfigSource.type_urls
  <envoy_v3_api_field_config.core.v3.ExtensionConfigSource.type_urls>` field.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.composite.v3.FilterChainConfiguration",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :typed_config, 1,
    repeated: true,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "typedConfig"
end

defmodule Envoy.Extensions.Filters.Http.Composite.V3.DynamicConfig do
  @moduledoc """
  Configuration for an extension configuration discovery service with name.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.composite.v3.DynamicConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false

  field :config_discovery, 2,
    type: Envoy.Config.Core.V3.ExtensionConfigSource,
    json_name: "configDiscovery"
end

defmodule Envoy.Extensions.Filters.Http.Composite.V3.ExecuteFilterAction do
  @moduledoc """
  Composite match action (see :ref:`matching docs <arch_overview_matching_api>` for more info on match actions).
  This specifies the filter configuration of the filter that the composite filter should delegate filter interactions to.
  [#next-free-field: 6]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.composite.v3.ExecuteFilterAction",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :typed_config, 1,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "typedConfig",
    deprecated: false

  field :dynamic_config, 2,
    type: Envoy.Extensions.Filters.Http.Composite.V3.DynamicConfig,
    json_name: "dynamicConfig",
    deprecated: false

  field :filter_chain, 4,
    type: Envoy.Extensions.Filters.Http.Composite.V3.FilterChainConfiguration,
    json_name: "filterChain"

  field :filter_chain_name, 5, type: :string, json_name: "filterChainName"

  field :sample_percent, 3,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "samplePercent"
end
