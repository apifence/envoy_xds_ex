defmodule Envoy.Extensions.Tracers.DynamicModules.V3.DynamicModuleTracer do
  @moduledoc """
  Configuration for the Dynamic Modules Tracer. This tracer allows loading shared object
  files via ``dlopen`` to implement custom distributed tracing backends.

  A module can be loaded by multiple tracer configurations; the module is loaded only once
  and shared across multiple tracer instances.

  The tracer receives trace context from incoming requests and can inject trace context into
  outgoing requests for propagation. It supports the full span lifecycle: creation, tagging,
  logging, child spans, and reporting.
  [#protodoc-title: Dynamic Modules Tracer]
  [#extension: envoy.tracers.dynamic_modules]
  """

  use Protobuf,
    full_name: "envoy.extensions.tracers.dynamic_modules.v3.DynamicModuleTracer",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :dynamic_module_config, 1,
    type: Envoy.Extensions.DynamicModules.V3.DynamicModuleConfig,
    json_name: "dynamicModuleConfig",
    deprecated: false

  field :tracer_name, 2, type: :string, json_name: "tracerName"
  field :tracer_config, 3, type: Google.Protobuf.Any, json_name: "tracerConfig"
end
