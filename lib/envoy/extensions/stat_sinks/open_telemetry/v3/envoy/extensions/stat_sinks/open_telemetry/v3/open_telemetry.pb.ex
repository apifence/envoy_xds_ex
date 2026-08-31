defmodule Envoy.Extensions.StatSinks.OpenTelemetry.V3.SinkConfig.ConversionAction do
  @moduledoc """
  ConversionAction is used to convert a stat to a metric. If a stat matches,
  the metric_name and static_metric_labels will be
  used to create the metric. This can be used to rename a
  stat, add static labels, and aggregate multiple stats into a single metric.
  """

  use Protobuf,
    full_name: "envoy.extensions.stat_sinks.open_telemetry.v3.SinkConfig.ConversionAction",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :metric_name, 2, type: :string, json_name: "metricName"

  field :static_metric_labels, 3,
    repeated: true,
    type: Opentelemetry.Proto.Common.V1.KeyValue,
    json_name: "staticMetricLabels"
end

defmodule Envoy.Extensions.StatSinks.OpenTelemetry.V3.SinkConfig.DropAction do
  @moduledoc """
  DropAction is an action that, when matched, will prevent the stat from being converted to an OTLP metric and flushed.
  """

  use Protobuf,
    full_name: "envoy.extensions.stat_sinks.open_telemetry.v3.SinkConfig.DropAction",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Extensions.StatSinks.OpenTelemetry.V3.SinkConfig do
  @moduledoc """
  [#next-free-field: 11]
  [#protodoc-title: Open Telemetry Stats Sink]
  Stats configuration proto schema for ``envoy.stat_sinks.open_telemetry`` sink.
  [#extension: envoy.stat_sinks.open_telemetry]
  """

  use Protobuf,
    full_name: "envoy.extensions.stat_sinks.open_telemetry.v3.SinkConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :protocol_specifier, 0

  field :grpc_service, 1,
    type: Envoy.Config.Core.V3.GrpcService,
    json_name: "grpcService",
    oneof: 0,
    deprecated: false

  field :http_service, 9,
    type: Envoy.Config.Core.V3.HttpService,
    json_name: "httpService",
    oneof: 0

  field :resource_detectors, 7,
    repeated: true,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "resourceDetectors"

  field :report_counters_as_deltas, 2, type: :bool, json_name: "reportCountersAsDeltas"
  field :report_histograms_as_deltas, 3, type: :bool, json_name: "reportHistogramsAsDeltas"

  field :emit_tags_as_attributes, 4,
    type: Google.Protobuf.BoolValue,
    json_name: "emitTagsAsAttributes"

  field :use_tag_extracted_name, 5,
    type: Google.Protobuf.BoolValue,
    json_name: "useTagExtractedName"

  field :prefix, 6, type: :string

  field :custom_metric_conversions, 8,
    type: Xds.Type.Matcher.V3.Matcher,
    json_name: "customMetricConversions"

  field :max_data_points_per_request, 10, type: :uint32, json_name: "maxDataPointsPerRequest"
end
