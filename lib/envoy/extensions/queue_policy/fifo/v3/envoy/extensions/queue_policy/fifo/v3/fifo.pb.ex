defmodule Envoy.Extensions.QueuePolicy.Fifo.V3.FifoQueuePolicyConfig do
  @moduledoc """
  Configuration for the FIFO pending requests queue policy.
  [#protodoc-title: FIFO Queue Policy]
  [#extension: envoy.queue_policy.fifo]
  """

  use Protobuf,
    full_name: "envoy.extensions.queue_policy.fifo.v3.FifoQueuePolicyConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end
