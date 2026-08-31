defmodule Envoy.Extensions.Filters.Listener.SetFilterState.V3.Config do
  @moduledoc """
  [#protodoc-title: Set-Filter-State Filter]

  This filter sets or updates the dynamic filter state.

  [#extension: envoy.filters.listener.set_filter_state]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.listener.set_filter_state.v3.Config",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :on_accept, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Common.SetFilterState.V3.FilterStateValue,
    json_name: "onAccept"
end
