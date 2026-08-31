defmodule Envoy.Extensions.ResourceMonitors.FixedHeap.V3.FixedHeapConfig do
  @moduledoc """
  The fixed heap resource monitor reports the Envoy process memory pressure, computed as a
  fraction of currently reserved heap memory divided by a statically configured maximum
  specified in the FixedHeapConfig.
  [#protodoc-title: Fixed heap]
  [#extension: envoy.resource_monitors.fixed_heap]
  """

  use Protobuf,
    full_name: "envoy.extensions.resource_monitors.fixed_heap.v3.FixedHeapConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :max_heap_size_bytes, 1, type: :uint64, json_name: "maxHeapSizeBytes"

  field :max_heap_size_bytes_runtime, 2,
    type: Envoy.Config.Core.V3.RuntimeUInt64,
    json_name: "maxHeapSizeBytesRuntime"
end
