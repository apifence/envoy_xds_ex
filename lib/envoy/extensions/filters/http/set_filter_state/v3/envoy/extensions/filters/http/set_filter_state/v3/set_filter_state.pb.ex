defmodule Envoy.Extensions.Filters.Http.SetFilterState.V3.Config do
  @moduledoc """
  [#protodoc-title: Set-Filter-State Filter]

  This filter sets or updates the dynamic filter state. See :ref:`the filter
  documentation <config_http_filters_set_filter_state>` for more information on
  how this filter should be used.

  [#extension: envoy.filters.http.set_filter_state]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.set_filter_state.v3.Config",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :on_request_headers, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Common.SetFilterState.V3.FilterStateValue,
    json_name: "onRequestHeaders"

  field :clear_route_cache, 2, type: :bool, json_name: "clearRouteCache"
end
