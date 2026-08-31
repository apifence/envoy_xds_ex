defmodule Envoy.Admin.V3.ServerInfo.State do
  use Protobuf,
    enum: true,
    full_name: "envoy.admin.v3.ServerInfo.State",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :LIVE, 0
  field :DRAINING, 1
  field :PRE_INITIALIZING, 2
  field :INITIALIZING, 3
end

defmodule Envoy.Admin.V3.CommandLineOptions.IpVersion do
  use Protobuf,
    enum: true,
    full_name: "envoy.admin.v3.CommandLineOptions.IpVersion",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :v4, 0
  field :v6, 1
end

defmodule Envoy.Admin.V3.CommandLineOptions.Mode do
  use Protobuf,
    enum: true,
    full_name: "envoy.admin.v3.CommandLineOptions.Mode",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :Serve, 0
  field :Validate, 1
  field :InitOnly, 2
end

defmodule Envoy.Admin.V3.CommandLineOptions.DrainStrategy do
  use Protobuf,
    enum: true,
    full_name: "envoy.admin.v3.CommandLineOptions.DrainStrategy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :Gradual, 0
  field :Immediate, 1
end

defmodule Envoy.Admin.V3.ServerInfo do
  @moduledoc """
  Proto representation of the value returned by /server_info, containing
  server version/server status information.
  [#next-free-field: 9]
  [#protodoc-title: Server state]
  """

  use Protobuf,
    full_name: "envoy.admin.v3.ServerInfo",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :version, 1, type: :string
  field :state, 2, type: Envoy.Admin.V3.ServerInfo.State, enum: true
  field :uptime_current_epoch, 3, type: Google.Protobuf.Duration, json_name: "uptimeCurrentEpoch"
  field :uptime_all_epochs, 4, type: Google.Protobuf.Duration, json_name: "uptimeAllEpochs"
  field :hot_restart_version, 5, type: :string, json_name: "hotRestartVersion"

  field :command_line_options, 6,
    type: Envoy.Admin.V3.CommandLineOptions,
    json_name: "commandLineOptions"

  field :node, 7, type: Envoy.Config.Core.V3.Node
  field :hot_restart_initializing, 8, type: :bool, json_name: "hotRestartInitializing"
end

defmodule Envoy.Admin.V3.CommandLineOptions do
  @moduledoc """
  [#next-free-field: 44]
  """

  use Protobuf,
    full_name: "envoy.admin.v3.CommandLineOptions",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :base_id, 1, type: :uint64, json_name: "baseId"
  field :use_dynamic_base_id, 31, type: :bool, json_name: "useDynamicBaseId"
  field :skip_hot_restart_on_no_parent, 39, type: :bool, json_name: "skipHotRestartOnNoParent"
  field :skip_hot_restart_parent_stats, 40, type: :bool, json_name: "skipHotRestartParentStats"
  field :base_id_path, 32, type: :string, json_name: "baseIdPath"
  field :concurrency, 2, type: :uint32
  field :config_path, 3, type: :string, json_name: "configPath"
  field :config_yaml, 4, type: :string, json_name: "configYaml"
  field :allow_unknown_static_fields, 5, type: :bool, json_name: "allowUnknownStaticFields"
  field :reject_unknown_dynamic_fields, 26, type: :bool, json_name: "rejectUnknownDynamicFields"
  field :ignore_unknown_dynamic_fields, 30, type: :bool, json_name: "ignoreUnknownDynamicFields"
  field :skip_deprecated_logs, 41, type: :bool, json_name: "skipDeprecatedLogs"
  field :admin_address_path, 6, type: :string, json_name: "adminAddressPath"

  field :local_address_ip_version, 7,
    type: Envoy.Admin.V3.CommandLineOptions.IpVersion,
    json_name: "localAddressIpVersion",
    enum: true

  field :log_level, 8, type: :string, json_name: "logLevel"
  field :component_log_level, 9, type: :string, json_name: "componentLogLevel"
  field :log_format, 10, type: :string, json_name: "logFormat"
  field :log_format_escaped, 27, type: :bool, json_name: "logFormatEscaped"
  field :log_path, 11, type: :string, json_name: "logPath"
  field :service_cluster, 13, type: :string, json_name: "serviceCluster"
  field :service_node, 14, type: :string, json_name: "serviceNode"
  field :service_zone, 15, type: :string, json_name: "serviceZone"
  field :file_flush_interval, 16, type: Google.Protobuf.Duration, json_name: "fileFlushInterval"
  field :file_flush_min_size, 42, type: :uint32, json_name: "fileFlushMinSize"
  field :drain_time, 17, type: Google.Protobuf.Duration, json_name: "drainTime"

  field :drain_strategy, 33,
    type: Envoy.Admin.V3.CommandLineOptions.DrainStrategy,
    json_name: "drainStrategy",
    enum: true

  field :parent_shutdown_time, 18, type: Google.Protobuf.Duration, json_name: "parentShutdownTime"
  field :mode, 19, type: Envoy.Admin.V3.CommandLineOptions.Mode, enum: true
  field :disable_hot_restart, 22, type: :bool, json_name: "disableHotRestart"
  field :enable_mutex_tracing, 23, type: :bool, json_name: "enableMutexTracing"
  field :restart_epoch, 24, type: :uint32, json_name: "restartEpoch"
  field :cpuset_threads, 25, type: :bool, json_name: "cpusetThreads"
  field :disabled_extensions, 28, repeated: true, type: :string, json_name: "disabledExtensions"
  field :enable_fine_grain_logging, 34, type: :bool, json_name: "enableFineGrainLogging"
  field :log_stacktrace_single_entry, 43, type: :bool, json_name: "logStacktraceSingleEntry"
  field :socket_path, 35, type: :string, json_name: "socketPath"
  field :socket_mode, 36, type: :uint32, json_name: "socketMode"
  field :enable_core_dump, 37, type: :bool, json_name: "enableCoreDump"
  field :stats_tag, 38, repeated: true, type: :string, json_name: "statsTag"
end
