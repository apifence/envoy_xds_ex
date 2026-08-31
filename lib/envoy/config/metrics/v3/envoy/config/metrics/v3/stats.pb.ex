defmodule Envoy.Config.Metrics.V3.StatsSink do
  @moduledoc """
  Configuration for pluggable stats sinks.
  [#protodoc-title: Stats]
  Statistics :ref:`architecture overview <arch_overview_statistics>`.
  """

  use Protobuf,
    full_name: "envoy.config.metrics.v3.StatsSink",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :config_type, 0

  field :name, 1, type: :string
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Config.Metrics.V3.StatsConfig do
  @moduledoc """
  Statistics configuration such as tagging.
  [#next-free-field: 6]
  """

  use Protobuf,
    full_name: "envoy.config.metrics.v3.StatsConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :stats_tags, 1,
    repeated: true,
    type: Envoy.Config.Metrics.V3.TagSpecifier,
    json_name: "statsTags"

  field :use_all_default_tags, 2, type: Google.Protobuf.BoolValue, json_name: "useAllDefaultTags"
  field :stats_matcher, 3, type: Envoy.Config.Metrics.V3.StatsMatcher, json_name: "statsMatcher"

  field :histogram_bucket_settings, 4,
    repeated: true,
    type: Envoy.Config.Metrics.V3.HistogramBucketSettings,
    json_name: "histogramBucketSettings"

  field :allow_default_tag_overrides, 5,
    type: Google.Protobuf.BoolValue,
    json_name: "allowDefaultTagOverrides"
end

defmodule Envoy.Config.Metrics.V3.StatsMatcher do
  @moduledoc """
  Configuration for disabling stat instantiation.
  The instantiation of stats is unrestricted by default. If the goal is to configure Envoy to
  instantiate all stats, there is no need to construct a StatsMatcher.

  However, StatsMatcher can be used to limit the creation of families of stats in order to
  conserve memory. Stats can either be disabled entirely, or they can be
  limited by either an exclusion or an inclusion list of :ref:`StringMatcher
  <envoy_v3_api_msg_type.matcher.v3.StringMatcher>` protos:

  * If ``reject_all`` is set to ``true``, no stats will be instantiated. If ``reject_all`` is set to
    ``false``, all stats will be instantiated.

  * If an exclusion list is supplied, any stat name matching *any* of the StringMatchers in the
    list will not instantiate.

  * If an inclusion list is supplied, no stats will instantiate, except those matching *any* of
    the StringMatchers in the list.
  A StringMatcher can be used to match against an exact string, a suffix / prefix, or a regex.
  **NB:** For performance reasons, it is highly recommended to use a prefix- or suffix-based
  matcher rather than a regex-based matcher.

  Example 1. Excluding all stats.

  .. code-block:: json

    {
      "statsMatcher": {
        "rejectAll": "true"
      }
    }

  Example 2. Excluding all cluster-specific stats, but not cluster-manager stats:

  .. code-block:: json

    {
      "statsMatcher": {
        "exclusionList": {
          "patterns": [
            {
              "prefix": "cluster."
            }
          ]
        }
      }
    }

  Example 3. Including only manager-related stats:

  .. code-block:: json

    {
      "statsMatcher": {
        "inclusionList": {
          "patterns": [
            {
              "prefix": "cluster_manager."
            },
            {
              "prefix": "listener_manager."
            }
          ]
        }
      }
    }
  """

  use Protobuf,
    full_name: "envoy.config.metrics.v3.StatsMatcher",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :stats_matcher, 0

  field :reject_all, 1, type: :bool, json_name: "rejectAll", oneof: 0

  field :exclusion_list, 2,
    type: Envoy.Type.Matcher.V3.ListStringMatcher,
    json_name: "exclusionList",
    oneof: 0

  field :inclusion_list, 3,
    type: Envoy.Type.Matcher.V3.ListStringMatcher,
    json_name: "inclusionList",
    oneof: 0
end

defmodule Envoy.Config.Metrics.V3.TagSpecifier do
  @moduledoc """
  Designates a tag name and value pair. The value may be either a fixed value
  or a regex providing the value via capture groups. The specified tag will be
  unconditionally set if a fixed value, otherwise it will only be set if one
  or more capture groups in the regex match.
  """

  use Protobuf,
    full_name: "envoy.config.metrics.v3.TagSpecifier",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :tag_value, 0

  field :tag_name, 1, type: :string, json_name: "tagName"
  field :regex, 2, type: :string, oneof: 0, deprecated: false
  field :fixed_value, 3, type: :string, json_name: "fixedValue", oneof: 0
end

defmodule Envoy.Config.Metrics.V3.HistogramBucketSettings do
  @moduledoc """
  Specifies a matcher for stats and the buckets that matching stats should use.
  """

  use Protobuf,
    full_name: "envoy.config.metrics.v3.HistogramBucketSettings",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :match, 1, type: Envoy.Type.Matcher.V3.StringMatcher, deprecated: false
  field :buckets, 2, repeated: true, type: :double, deprecated: false
  field :bins, 3, type: Google.Protobuf.UInt32Value, deprecated: false
end

defmodule Envoy.Config.Metrics.V3.StatsdSink do
  @moduledoc """
  Stats configuration proto schema for built-in ``envoy.stat_sinks.statsd`` sink. This sink does not support
  tagged metrics.
  [#extension: envoy.stat_sinks.statsd]
  """

  use Protobuf,
    full_name: "envoy.config.metrics.v3.StatsdSink",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :statsd_specifier, 0

  field :address, 1, type: Envoy.Config.Core.V3.Address, oneof: 0
  field :tcp_cluster_name, 2, type: :string, json_name: "tcpClusterName", oneof: 0
  field :prefix, 3, type: :string
end

defmodule Envoy.Config.Metrics.V3.DogStatsdSink do
  @moduledoc """
  Stats configuration proto schema for built-in ``envoy.stat_sinks.dog_statsd`` sink.
  The sink emits stats with `DogStatsD <https://docs.datadoghq.com/guides/dogstatsd/>`_
  compatible tags. Tags are configurable via :ref:`StatsConfig
  <envoy_v3_api_msg_config.metrics.v3.StatsConfig>`.
  [#extension: envoy.stat_sinks.dog_statsd]
  """

  use Protobuf,
    full_name: "envoy.config.metrics.v3.DogStatsdSink",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :dog_statsd_specifier, 0

  field :address, 1, type: Envoy.Config.Core.V3.Address, oneof: 0
  field :prefix, 3, type: :string

  field :max_bytes_per_datagram, 4,
    type: Google.Protobuf.UInt64Value,
    json_name: "maxBytesPerDatagram",
    deprecated: false
end

defmodule Envoy.Config.Metrics.V3.HystrixSink do
  @moduledoc """
  Stats configuration proto schema for built-in ``envoy.stat_sinks.hystrix`` sink.
  The sink emits stats in `text/event-stream
  <https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events>`_
  formatted stream for use by `Hystrix dashboard
  <https://github.com/Netflix-Skunkworks/hystrix-dashboard/wiki>`_.

  Note that only a single HystrixSink should be configured.

  Streaming is started through an admin endpoint :http:get:`/hystrix_event_stream`.
  [#extension: envoy.stat_sinks.hystrix]
  """

  use Protobuf,
    full_name: "envoy.config.metrics.v3.HystrixSink",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :num_buckets, 1, type: :int64, json_name: "numBuckets"
end
