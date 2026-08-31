defmodule Envoy.Config.Trace.V3.ZipkinConfig.TraceContextOption do
  @moduledoc """
  Available trace context options for handling different trace header formats.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.config.trace.v3.ZipkinConfig.TraceContextOption",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :USE_B3, 0
  field :USE_B3_WITH_W3C_PROPAGATION, 1
end

defmodule Envoy.Config.Trace.V3.ZipkinConfig.CollectorEndpointVersion do
  @moduledoc """
  Available Zipkin collector endpoint versions.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.config.trace.v3.ZipkinConfig.CollectorEndpointVersion",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :DEPRECATED_AND_UNAVAILABLE_DO_NOT_USE, 0
  field :HTTP_JSON, 1
  field :HTTP_PROTO, 2
  field :GRPC, 3
end

defmodule Envoy.Config.Trace.V3.ZipkinConfig do
  @moduledoc """
  Configuration for the Zipkin tracer.
  [#extension: envoy.tracers.zipkin]
  [#next-free-field: 11]
  [#protodoc-title: Zipkin tracer]
  """

  use Protobuf,
    full_name: "envoy.config.trace.v3.ZipkinConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :collector_cluster, 1, type: :string, json_name: "collectorCluster"
  field :collector_endpoint, 2, type: :string, json_name: "collectorEndpoint"
  field :trace_id_128bit, 3, type: :bool, json_name: "traceId128bit"
  field :shared_span_context, 4, type: Google.Protobuf.BoolValue, json_name: "sharedSpanContext"

  field :collector_endpoint_version, 5,
    type: Envoy.Config.Trace.V3.ZipkinConfig.CollectorEndpointVersion,
    json_name: "collectorEndpointVersion",
    enum: true

  field :collector_hostname, 6, type: :string, json_name: "collectorHostname"

  field :split_spans_for_request, 7,
    type: :bool,
    json_name: "splitSpansForRequest",
    deprecated: true

  field :trace_context_option, 8,
    type: Envoy.Config.Trace.V3.ZipkinConfig.TraceContextOption,
    json_name: "traceContextOption",
    enum: true

  field :collector_service, 9,
    type: Envoy.Config.Core.V3.HttpService,
    json_name: "collectorService"

  field :timestamp_trace_ids, 10, type: :bool, json_name: "timestampTraceIds"
end
