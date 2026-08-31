defmodule Envoy.Extensions.Filters.Network.SetFilterState.V3.Config do
  @moduledoc """
  [#protodoc-title: Set-Filter-State Filter]

  This filter sets or updates the dynamic filter state. See :ref:`the filter
  documentation <config_network_filters_set_filter_state>` for more
  information on how this filter should be used.

  [#extension: envoy.filters.network.set_filter_state]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.network.set_filter_state.v3.Config",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :on_new_connection, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Common.SetFilterState.V3.FilterStateValue,
    json_name: "onNewConnection"

  field :on_downstream_tls_handshake, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Common.SetFilterState.V3.FilterStateValue,
    json_name: "onDownstreamTlsHandshake"

  field :on_downstream_data, 3,
    repeated: true,
    type: Envoy.Extensions.Filters.Common.SetFilterState.V3.FilterStateValue,
    json_name: "onDownstreamData"
end
