defmodule Envoy.Config.Bootstrap.V3.Watchdog.WatchdogAction.WatchdogEvent do
  @moduledoc """
  The events are fired in this order: ``KILL``, ``MULTIKILL``, ``MEGAMISS``, ``MISS``.
  Within an event type, actions execute in the order they are configured.
  For ``KILL``/``MULTIKILL`` there is a default ``PANIC`` that will run after the
  registered actions and kills the process if it wasn't already killed.
  It might be useful to specify several debug actions, and possibly an
  alternate ``FATAL`` action.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.config.bootstrap.v3.Watchdog.WatchdogAction.WatchdogEvent",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :UNKNOWN, 0
  field :KILL, 1
  field :MULTIKILL, 2
  field :MEGAMISS, 3
  field :MISS, 4
end

defmodule Envoy.Config.Bootstrap.V3.CustomInlineHeader.InlineHeaderType do
  use Protobuf,
    enum: true,
    full_name: "envoy.config.bootstrap.v3.CustomInlineHeader.InlineHeaderType",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :REQUEST_HEADER, 0
  field :REQUEST_TRAILER, 1
  field :RESPONSE_HEADER, 2
  field :RESPONSE_TRAILER, 3
end

defmodule Envoy.Config.Bootstrap.V3.ApiListenerManager.ThreadingModel do
  use Protobuf,
    enum: true,
    full_name: "envoy.config.bootstrap.v3.ApiListenerManager.ThreadingModel",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :MAIN_THREAD_ONLY, 0
  field :STANDALONE_WORKER_THREAD, 1
end

defmodule Envoy.Config.Bootstrap.V3.Bootstrap.StaticResources do
  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.Bootstrap.StaticResources",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :listeners, 1, repeated: true, type: Envoy.Config.Listener.V3.Listener
  field :clusters, 2, repeated: true, type: Envoy.Config.Cluster.V3.Cluster
  field :secrets, 3, repeated: true, type: Envoy.Extensions.TransportSockets.Tls.V3.Secret
end

defmodule Envoy.Config.Bootstrap.V3.Bootstrap.DynamicResources do
  @moduledoc """
  [#next-free-field: 7]
  """

  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.Bootstrap.DynamicResources",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :lds_config, 1, type: Envoy.Config.Core.V3.ConfigSource, json_name: "ldsConfig"
  field :lds_resources_locator, 5, type: :string, json_name: "ldsResourcesLocator"
  field :cds_config, 2, type: Envoy.Config.Core.V3.ConfigSource, json_name: "cdsConfig"
  field :cds_resources_locator, 6, type: :string, json_name: "cdsResourcesLocator"
  field :ads_config, 3, type: Envoy.Config.Core.V3.ApiConfigSource, json_name: "adsConfig"
end

defmodule Envoy.Config.Bootstrap.V3.Bootstrap.ApplicationLogConfig.LogFormat do
  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.Bootstrap.ApplicationLogConfig.LogFormat",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :log_format, 0

  field :json_format, 1, type: Google.Protobuf.Struct, json_name: "jsonFormat", oneof: 0
  field :text_format, 2, type: :string, json_name: "textFormat", oneof: 0
end

defmodule Envoy.Config.Bootstrap.V3.Bootstrap.ApplicationLogConfig do
  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.Bootstrap.ApplicationLogConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :log_format, 1,
    type: Envoy.Config.Bootstrap.V3.Bootstrap.ApplicationLogConfig.LogFormat,
    json_name: "logFormat"
end

defmodule Envoy.Config.Bootstrap.V3.Bootstrap.DeferredStatOptions do
  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.Bootstrap.DeferredStatOptions",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :enable_deferred_creation_stats, 1, type: :bool, json_name: "enableDeferredCreationStats"
end

defmodule Envoy.Config.Bootstrap.V3.Bootstrap.GrpcAsyncClientManagerConfig do
  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.Bootstrap.GrpcAsyncClientManagerConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :max_cached_entry_idle_duration, 1,
    type: Google.Protobuf.Duration,
    json_name: "maxCachedEntryIdleDuration",
    deprecated: false
end

defmodule Envoy.Config.Bootstrap.V3.Bootstrap.CertificateProviderInstancesEntry do
  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.Bootstrap.CertificateProviderInstancesEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Config.Core.V3.TypedExtensionConfig
end

defmodule Envoy.Config.Bootstrap.V3.Bootstrap do
  @moduledoc """
  Bootstrap :ref:`configuration overview <config_overview_bootstrap>`.
  [#next-free-field: 44]
  [#protodoc-title: Bootstrap]
  This proto is supplied via the :option:`-c` CLI flag and acts as the root
  of the Envoy v3 configuration. See the :ref:`v3 configuration overview
  <config_overview_bootstrap>` for more detail.
  """

  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.Bootstrap",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :stats_flush, 0

  oneof :stats_eviction, 1

  field :node, 1, type: Envoy.Config.Core.V3.Node
  field :node_context_params, 26, repeated: true, type: :string, json_name: "nodeContextParams"

  field :static_resources, 2,
    type: Envoy.Config.Bootstrap.V3.Bootstrap.StaticResources,
    json_name: "staticResources"

  field :dynamic_resources, 3,
    type: Envoy.Config.Bootstrap.V3.Bootstrap.DynamicResources,
    json_name: "dynamicResources"

  field :cluster_manager, 4,
    type: Envoy.Config.Bootstrap.V3.ClusterManager,
    json_name: "clusterManager"

  field :hds_config, 14, type: Envoy.Config.Core.V3.ApiConfigSource, json_name: "hdsConfig"
  field :flags_path, 5, type: :string, json_name: "flagsPath"

  field :stats_sinks, 6,
    repeated: true,
    type: Envoy.Config.Metrics.V3.StatsSink,
    json_name: "statsSinks"

  field :deferred_stat_options, 39,
    type: Envoy.Config.Bootstrap.V3.Bootstrap.DeferredStatOptions,
    json_name: "deferredStatOptions"

  field :stats_config, 13, type: Envoy.Config.Metrics.V3.StatsConfig, json_name: "statsConfig"

  field :stats_flush_interval, 7,
    type: Google.Protobuf.Duration,
    json_name: "statsFlushInterval",
    deprecated: false

  field :stats_flush_on_admin, 29,
    type: :bool,
    json_name: "statsFlushOnAdmin",
    oneof: 0,
    deprecated: false

  field :stats_eviction_interval, 42,
    type: Google.Protobuf.Duration,
    json_name: "statsEvictionInterval",
    oneof: 1,
    deprecated: false

  field :watchdog, 8, type: Envoy.Config.Bootstrap.V3.Watchdog, deprecated: true
  field :watchdogs, 27, type: Envoy.Config.Bootstrap.V3.Watchdogs
  field :tracing, 9, type: Envoy.Config.Trace.V3.Tracing, deprecated: true

  field :layered_runtime, 17,
    type: Envoy.Config.Bootstrap.V3.LayeredRuntime,
    json_name: "layeredRuntime"

  field :admin, 12, type: Envoy.Config.Bootstrap.V3.Admin

  field :overload_manager, 15,
    type: Envoy.Config.Overload.V3.OverloadManager,
    json_name: "overloadManager",
    deprecated: false

  field :enable_dispatcher_stats, 16, type: :bool, json_name: "enableDispatcherStats"
  field :header_prefix, 18, type: :string, json_name: "headerPrefix"

  field :stats_server_version_override, 19,
    type: Google.Protobuf.UInt64Value,
    json_name: "statsServerVersionOverride"

  field :use_tcp_for_dns_lookups, 20,
    type: :bool,
    json_name: "useTcpForDnsLookups",
    deprecated: true

  field :dns_resolution_config, 30,
    type: Envoy.Config.Core.V3.DnsResolutionConfig,
    json_name: "dnsResolutionConfig",
    deprecated: true

  field :typed_dns_resolver_config, 31,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "typedDnsResolverConfig"

  field :bootstrap_extensions, 21,
    repeated: true,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "bootstrapExtensions"

  field :fatal_actions, 28,
    repeated: true,
    type: Envoy.Config.Bootstrap.V3.FatalAction,
    json_name: "fatalActions"

  field :config_sources, 22,
    repeated: true,
    type: Envoy.Config.Core.V3.ConfigSource,
    json_name: "configSources"

  field :default_config_source, 23,
    type: Envoy.Config.Core.V3.ConfigSource,
    json_name: "defaultConfigSource"

  field :default_socket_interface, 24, type: :string, json_name: "defaultSocketInterface"

  field :certificate_provider_instances, 25,
    repeated: true,
    type: Envoy.Config.Bootstrap.V3.Bootstrap.CertificateProviderInstancesEntry,
    json_name: "certificateProviderInstances",
    map: true

  field :inline_headers, 32,
    repeated: true,
    type: Envoy.Config.Bootstrap.V3.CustomInlineHeader,
    json_name: "inlineHeaders"

  field :perf_tracing_file_path, 33, type: :string, json_name: "perfTracingFilePath"

  field :default_regex_engine, 34,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "defaultRegexEngine"

  field :xds_delegate_extension, 35,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "xdsDelegateExtension"

  field :xds_config_tracker_extension, 36,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "xdsConfigTrackerExtension"

  field :listener_manager, 37,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "listenerManager"

  field :application_log_config, 38,
    type: Envoy.Config.Bootstrap.V3.Bootstrap.ApplicationLogConfig,
    json_name: "applicationLogConfig"

  field :grpc_async_client_manager_config, 40,
    type: Envoy.Config.Bootstrap.V3.Bootstrap.GrpcAsyncClientManagerConfig,
    json_name: "grpcAsyncClientManagerConfig"

  field :memory_allocator_manager, 41,
    type: Envoy.Config.Bootstrap.V3.MemoryAllocatorManager,
    json_name: "memoryAllocatorManager"

  field :enable_worker_cpu_affinity, 43, type: :bool, json_name: "enableWorkerCpuAffinity"
end

defmodule Envoy.Config.Bootstrap.V3.Admin do
  @moduledoc """
  Administration interface :ref:`operations documentation
  <operations_admin_interface>`.
  [#next-free-field: 8]
  """

  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.Admin",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :access_log, 5,
    repeated: true,
    type: Envoy.Config.Accesslog.V3.AccessLog,
    json_name: "accessLog"

  field :access_log_path, 1, type: :string, json_name: "accessLogPath", deprecated: true
  field :profile_path, 2, type: :string, json_name: "profilePath"
  field :address, 3, type: Envoy.Config.Core.V3.Address

  field :socket_options, 4,
    repeated: true,
    type: Envoy.Config.Core.V3.SocketOption,
    json_name: "socketOptions"

  field :ignore_global_conn_limit, 6, type: :bool, json_name: "ignoreGlobalConnLimit"

  field :allow_paths, 7,
    repeated: true,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "allowPaths"
end

defmodule Envoy.Config.Bootstrap.V3.ClusterManager.OutlierDetection do
  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.ClusterManager.OutlierDetection",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :event_log_path, 1, type: :string, json_name: "eventLogPath"

  field :event_service, 2,
    type: Envoy.Config.Core.V3.EventServiceConfig,
    json_name: "eventService"
end

defmodule Envoy.Config.Bootstrap.V3.ClusterManager do
  @moduledoc """
  Cluster manager :ref:`architecture overview <arch_overview_cluster_manager>`.
  [#next-free-field: 6]
  """

  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.ClusterManager",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :local_cluster_name, 1, type: :string, json_name: "localClusterName"

  field :outlier_detection, 2,
    type: Envoy.Config.Bootstrap.V3.ClusterManager.OutlierDetection,
    json_name: "outlierDetection"

  field :upstream_bind_config, 3,
    type: Envoy.Config.Core.V3.BindConfig,
    json_name: "upstreamBindConfig"

  field :load_stats_config, 4,
    type: Envoy.Config.Core.V3.ApiConfigSource,
    json_name: "loadStatsConfig"

  field :enable_deferred_cluster_creation, 5,
    type: :bool,
    json_name: "enableDeferredClusterCreation"
end

defmodule Envoy.Config.Bootstrap.V3.Watchdogs do
  @moduledoc """
  Allows you to specify different watchdog configs for different subsystems.
  This allows finer tuned policies for the watchdog. If a subsystem is omitted
  the default values for that system will be used.
  """

  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.Watchdogs",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :main_thread_watchdog, 1,
    type: Envoy.Config.Bootstrap.V3.Watchdog,
    json_name: "mainThreadWatchdog"

  field :worker_watchdog, 2, type: Envoy.Config.Bootstrap.V3.Watchdog, json_name: "workerWatchdog"
end

defmodule Envoy.Config.Bootstrap.V3.Watchdog.WatchdogAction do
  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.Watchdog.WatchdogAction",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :config, 1, type: Envoy.Config.Core.V3.TypedExtensionConfig

  field :event, 2,
    type: Envoy.Config.Bootstrap.V3.Watchdog.WatchdogAction.WatchdogEvent,
    enum: true,
    deprecated: false
end

defmodule Envoy.Config.Bootstrap.V3.Watchdog do
  @moduledoc """
  Envoy process watchdog configuration. When configured, this monitors for
  nonresponsive threads and kills the process after the configured thresholds.
  See the :ref:`watchdog documentation <operations_performance_watchdog>` for more information.
  [#next-free-field: 8]
  """

  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.Watchdog",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :actions, 7, repeated: true, type: Envoy.Config.Bootstrap.V3.Watchdog.WatchdogAction
  field :miss_timeout, 1, type: Google.Protobuf.Duration, json_name: "missTimeout"
  field :megamiss_timeout, 2, type: Google.Protobuf.Duration, json_name: "megamissTimeout"
  field :kill_timeout, 3, type: Google.Protobuf.Duration, json_name: "killTimeout"

  field :max_kill_timeout_jitter, 6,
    type: Google.Protobuf.Duration,
    json_name: "maxKillTimeoutJitter",
    deprecated: false

  field :multikill_timeout, 4, type: Google.Protobuf.Duration, json_name: "multikillTimeout"
  field :multikill_threshold, 5, type: Envoy.Type.V3.Percent, json_name: "multikillThreshold"
end

defmodule Envoy.Config.Bootstrap.V3.FatalAction do
  @moduledoc """
  Fatal actions to run while crashing. Actions can be safe (meaning they are
  async-signal safe) or unsafe. We run all safe actions before we run unsafe actions.

  .. note::

    If using an unsafe action that could get stuck or deadlock, it is important to
    have an out of band system to terminate the process.

  The interface for the extension is ``Envoy::Server::Configuration::FatalAction``.
  ``FatalAction`` extensions live in the ``envoy.extensions.fatal_actions`` API
  namespace.
  """

  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.FatalAction",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :config, 1, type: Envoy.Config.Core.V3.TypedExtensionConfig
end

defmodule Envoy.Config.Bootstrap.V3.Runtime do
  @moduledoc """
  Runtime :ref:`configuration overview <config_runtime>` (deprecated).
  """

  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.Runtime",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :symlink_root, 1, type: :string, json_name: "symlinkRoot"
  field :subdirectory, 2, type: :string
  field :override_subdirectory, 3, type: :string, json_name: "overrideSubdirectory"
  field :base, 4, type: Google.Protobuf.Struct
end

defmodule Envoy.Config.Bootstrap.V3.RuntimeLayer.DiskLayer do
  @moduledoc """
  :ref:`Disk runtime <config_runtime_local_disk>` layer.
  """

  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.RuntimeLayer.DiskLayer",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :symlink_root, 1, type: :string, json_name: "symlinkRoot"
  field :subdirectory, 3, type: :string
  field :append_service_cluster, 2, type: :bool, json_name: "appendServiceCluster"
end

defmodule Envoy.Config.Bootstrap.V3.RuntimeLayer.AdminLayer do
  @moduledoc """
  :ref:`Admin console runtime <config_runtime_admin>` layer.
  """

  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.RuntimeLayer.AdminLayer",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Config.Bootstrap.V3.RuntimeLayer.RtdsLayer do
  @moduledoc """
  :ref:`Runtime Discovery Service (RTDS) <config_runtime_rtds>` layer.
  """

  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.RuntimeLayer.RtdsLayer",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :name, 1, type: :string
  field :rtds_config, 2, type: Envoy.Config.Core.V3.ConfigSource, json_name: "rtdsConfig"
end

defmodule Envoy.Config.Bootstrap.V3.RuntimeLayer do
  @moduledoc """
  [#next-free-field: 6]
  """

  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.RuntimeLayer",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :layer_specifier, 0

  field :name, 1, type: :string, deprecated: false
  field :static_layer, 2, type: Google.Protobuf.Struct, json_name: "staticLayer", oneof: 0

  field :disk_layer, 3,
    type: Envoy.Config.Bootstrap.V3.RuntimeLayer.DiskLayer,
    json_name: "diskLayer",
    oneof: 0

  field :admin_layer, 4,
    type: Envoy.Config.Bootstrap.V3.RuntimeLayer.AdminLayer,
    json_name: "adminLayer",
    oneof: 0

  field :rtds_layer, 5,
    type: Envoy.Config.Bootstrap.V3.RuntimeLayer.RtdsLayer,
    json_name: "rtdsLayer",
    oneof: 0
end

defmodule Envoy.Config.Bootstrap.V3.LayeredRuntime do
  @moduledoc """
  Runtime :ref:`configuration overview <config_runtime>`.
  """

  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.LayeredRuntime",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :layers, 1, repeated: true, type: Envoy.Config.Bootstrap.V3.RuntimeLayer
end

defmodule Envoy.Config.Bootstrap.V3.CustomInlineHeader do
  @moduledoc """
  Used to specify the header that needs to be registered as an inline header.

  If request or response contain multiple headers with the same name and the header
  name is registered as an inline header, then multiple headers will be folded
  into one, and multiple header values will be concatenated by a suitable delimiter.
  The delimiter is generally a comma.

  For example, if ``foo`` is registered as an inline header, and the headers contain
  the following two headers:

  .. code-block:: text

    foo: bar
    foo: eep

  Then they will eventually be folded into:

  .. code-block:: text

    foo: bar, eep

  Inline headers provide O(1) search performance, but each inline header imposes
  an additional memory overhead on all instances of the corresponding type of
  HeaderMap or TrailerMap.
  """

  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.CustomInlineHeader",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :inline_header_name, 1, type: :string, json_name: "inlineHeaderName", deprecated: false

  field :inline_header_type, 2,
    type: Envoy.Config.Bootstrap.V3.CustomInlineHeader.InlineHeaderType,
    json_name: "inlineHeaderType",
    enum: true,
    deprecated: false
end

defmodule Envoy.Config.Bootstrap.V3.MemoryAllocatorManager do
  @moduledoc """
  [#next-free-field: 6]
  """

  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.MemoryAllocatorManager",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :bytes_to_release, 1, type: :uint64, json_name: "bytesToRelease"

  field :memory_release_interval, 2,
    type: Google.Protobuf.Duration,
    json_name: "memoryReleaseInterval"

  field :soft_memory_limit_bytes, 3,
    type: Google.Protobuf.UInt64Value,
    json_name: "softMemoryLimitBytes"

  field :max_per_cpu_cache_size_bytes, 4,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxPerCpuCacheSizeBytes"

  field :max_unfreed_memory_bytes, 5, type: :uint64, json_name: "maxUnfreedMemoryBytes"
end

defmodule Envoy.Config.Bootstrap.V3.ListenerManager do
  @moduledoc """
  A placeholder proto so that users can explicitly configure the standard
  Listener Manager via the bootstrap's :ref:`listener_manager <envoy_v3_api_field_config.bootstrap.v3.Bootstrap.listener_manager>`.
  [#not-implemented-hide:]
  """

  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.ListenerManager",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Config.Bootstrap.V3.ValidationListenerManager do
  @moduledoc """
  A placeholder proto so that users can explicitly configure the standard
  Validation Listener Manager via the bootstrap's :ref:`listener_manager <envoy_v3_api_field_config.bootstrap.v3.Bootstrap.listener_manager>`.
  [#not-implemented-hide:]
  """

  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.ValidationListenerManager",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Config.Bootstrap.V3.ApiListenerManager do
  @moduledoc """
  A placeholder proto so that users can explicitly configure the API
  Listener Manager via the bootstrap's :ref:`listener_manager <envoy_v3_api_field_config.bootstrap.v3.Bootstrap.listener_manager>`.
  [#not-implemented-hide:]
  """

  use Protobuf,
    full_name: "envoy.config.bootstrap.v3.ApiListenerManager",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :threading_model, 1,
    type: Envoy.Config.Bootstrap.V3.ApiListenerManager.ThreadingModel,
    json_name: "threadingModel",
    enum: true
end
