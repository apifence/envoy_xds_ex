defmodule Envoy.Type.V3.Scope do
  @moduledoc """
  Stats scope configuration.
  This configuration can be used to create a singleton scope that is shared
  across multiple instances within the process.
  [#next-free-field: 7]
  [#protodoc-title: Scope]
  """

  use Protobuf,
    full_name: "envoy.type.v3.Scope",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :max_counters, 1, type: Google.Protobuf.UInt32Value, json_name: "maxCounters"
  field :max_gauges, 2, type: Google.Protobuf.UInt32Value, json_name: "maxGauges"
  field :max_histograms, 3, type: Google.Protobuf.UInt32Value, json_name: "maxHistograms"
  field :enable_eviction, 4, type: :bool, json_name: "enableEviction"
  field :prefix, 5, type: :string
  field :sharing_name, 6, type: :string, json_name: "sharingName"
end
