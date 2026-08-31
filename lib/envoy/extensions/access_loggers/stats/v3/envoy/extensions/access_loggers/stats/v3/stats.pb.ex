defmodule Envoy.Extensions.AccessLoggers.Stats.V3.Config.Histogram.Unit do
  @moduledoc """
  The histogram units. The units are needed for some stat sinks.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.access_loggers.stats.v3.Config.Histogram.Unit",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :Unspecified, 0
  field :Bytes, 1
  field :Microseconds, 2
  field :Milliseconds, 3
  field :Percent, 4
end

defmodule Envoy.Extensions.AccessLoggers.Stats.V3.Config.Tag do
  @moduledoc """
  Defines a tag on a stat.
  """

  use Protobuf,
    full_name: "envoy.extensions.access_loggers.stats.v3.Config.Tag",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :value_format, 2, type: :string, json_name: "valueFormat", deprecated: false
  field :rules, 3, type: Xds.Type.Matcher.V3.Matcher
end

defmodule Envoy.Extensions.AccessLoggers.Stats.V3.Config.Stat do
  @moduledoc """
  Defines the name and tags of a stat.
  """

  use Protobuf,
    full_name: "envoy.extensions.access_loggers.stats.v3.Config.Stat",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :tags, 2, repeated: true, type: Envoy.Extensions.AccessLoggers.Stats.V3.Config.Tag
end

defmodule Envoy.Extensions.AccessLoggers.Stats.V3.Config.Histogram do
  @moduledoc """
  Configuration for a histogram stat.
  """

  use Protobuf,
    full_name: "envoy.extensions.access_loggers.stats.v3.Config.Histogram",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :stat, 1, type: Envoy.Extensions.AccessLoggers.Stats.V3.Config.Stat, deprecated: false

  field :unit, 2,
    type: Envoy.Extensions.AccessLoggers.Stats.V3.Config.Histogram.Unit,
    enum: true,
    deprecated: false

  field :value_format, 3, type: :string, json_name: "valueFormat", deprecated: false
end

defmodule Envoy.Extensions.AccessLoggers.Stats.V3.Config.Counter do
  @moduledoc """
  Configuration for a counter stat.
  """

  use Protobuf,
    full_name: "envoy.extensions.access_loggers.stats.v3.Config.Counter",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :stat, 1, type: Envoy.Extensions.AccessLoggers.Stats.V3.Config.Stat, deprecated: false
  field :value_format, 2, type: :string, json_name: "valueFormat", deprecated: false

  field :value_fixed, 3,
    type: Google.Protobuf.UInt64Value,
    json_name: "valueFixed",
    deprecated: false
end

defmodule Envoy.Extensions.AccessLoggers.Stats.V3.Config.Gauge.Set do
  @moduledoc """
  The Set operation config.
  """

  use Protobuf,
    full_name: "envoy.extensions.access_loggers.stats.v3.Config.Gauge.Set",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :log_type, 1,
    type: Envoy.Data.Accesslog.V3.AccessLogType,
    json_name: "logType",
    enum: true,
    deprecated: false
end

defmodule Envoy.Extensions.AccessLoggers.Stats.V3.Config.Gauge.PairedAddSubtract do
  @moduledoc """
  The PairedAddSubtract operation config.
  Usage restrictions:

  1. We only support add first then subtract logic and we rely on the symmetrical log types
     (e.g., DownstreamStart/DownstreamEnd) to increment and decrement the gauge.
  2. During runtime, sub_log_type will execute if and only if add_log_type operation has
     been done, tracked by inflight counter in filter state.
  3. If the add_log_type operation was executed, the sub_log_type will happen when the
     stream/connection is closed, even if the configured log type didn't happen.
  """

  use Protobuf,
    full_name: "envoy.extensions.access_loggers.stats.v3.Config.Gauge.PairedAddSubtract",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :add_log_type, 1,
    type: Envoy.Data.Accesslog.V3.AccessLogType,
    json_name: "addLogType",
    enum: true,
    deprecated: false

  field :sub_log_type, 2,
    type: Envoy.Data.Accesslog.V3.AccessLogType,
    json_name: "subLogType",
    enum: true,
    deprecated: false
end

defmodule Envoy.Extensions.AccessLoggers.Stats.V3.Config.Gauge do
  @moduledoc """
  Configuration for a gauge stat. Gauges can be used to add, subtract, or set
  values, and are useful for tracking concurrency or other mutable values
  over time.
  [#next-free-field: 6]
  """

  use Protobuf,
    full_name: "envoy.extensions.access_loggers.stats.v3.Config.Gauge",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :stat, 1, type: Envoy.Extensions.AccessLoggers.Stats.V3.Config.Stat, deprecated: false
  field :value_format, 2, type: :string, json_name: "valueFormat", deprecated: false

  field :value_fixed, 3,
    type: Google.Protobuf.UInt64Value,
    json_name: "valueFixed",
    deprecated: false

  field :add_subtract, 4,
    type: Envoy.Extensions.AccessLoggers.Stats.V3.Config.Gauge.PairedAddSubtract,
    json_name: "addSubtract"

  field :set, 5, type: Envoy.Extensions.AccessLoggers.Stats.V3.Config.Gauge.Set
end

defmodule Envoy.Extensions.AccessLoggers.Stats.V3.Config do
  @moduledoc """
  [#next-free-field: 7]
  [#protodoc-title: Stats logger]
  Configuration for an access logger that emits custom Envoy stats according to its
  configuration. The stats can have tags and values derived from
  :ref:`command operators <config_access_log_command_operators>`.
  [#extension: envoy.access_loggers.stats]

  .. warning::
    It is easy to configure and use this extension in ways that create very
    large numbers of stats in Envoy, which can cause excessive memory or CPU use
    leading to a denial of service in Envoy, or can overwhelm any configured
    stat sinks by sending too many unique metrics.
  """

  use Protobuf,
    full_name: "envoy.extensions.access_loggers.stats.v3.Config",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: true
  field :stats_scope, 6, type: Envoy.Type.V3.Scope, json_name: "statsScope"

  field :histograms, 3,
    repeated: true,
    type: Envoy.Extensions.AccessLoggers.Stats.V3.Config.Histogram

  field :counters, 4, repeated: true, type: Envoy.Extensions.AccessLoggers.Stats.V3.Config.Counter
  field :gauges, 5, repeated: true, type: Envoy.Extensions.AccessLoggers.Stats.V3.Config.Gauge
end
