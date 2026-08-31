defmodule Envoy.Extensions.Watchdog.BacktraceAction.V3.BacktraceActionConfig do
  @moduledoc """
  Configuration for the backtrace watchdog action.

  This action is currently only supported on Linux.
  [#protodoc-title: Watchdog Action that logs backtraces.]
  [#extension: envoy.watchdog.backtrace_action]
  """

  use Protobuf,
    full_name: "envoy.extensions.watchdog.backtrace_action.v3.BacktraceActionConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :cooldown_duration, 1, type: Google.Protobuf.Duration, json_name: "cooldownDuration"
end
