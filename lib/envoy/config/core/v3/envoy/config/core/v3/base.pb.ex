defmodule Envoy.Config.Core.V3.RoutingPriority do
  @moduledoc """
  Envoy supports :ref:`upstream priority routing
  <arch_overview_http_routing_priority>` both at the route and the virtual
  cluster level. The current priority implementation uses different connection
  pool and circuit breaking settings for each priority level. This means that
  even for HTTP/2 requests, two physical connections will be used to an
  upstream host. In the future Envoy will likely support true HTTP/2 priority
  over a single upstream connection.
  [#protodoc-title: Common types]
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.config.core.v3.RoutingPriority",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :DEFAULT, 0
  field :HIGH, 1
end

defmodule Envoy.Config.Core.V3.RequestMethod do
  @moduledoc """
  HTTP request method.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.config.core.v3.RequestMethod",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :METHOD_UNSPECIFIED, 0
  field :GET, 1
  field :HEAD, 2
  field :POST, 3
  field :PUT, 4
  field :DELETE, 5
  field :CONNECT, 6
  field :OPTIONS, 7
  field :TRACE, 8
  field :PATCH, 9
end

defmodule Envoy.Config.Core.V3.TrafficDirection do
  @moduledoc """
  Identifies the direction of the traffic relative to the local Envoy.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.config.core.v3.TrafficDirection",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :UNSPECIFIED, 0
  field :INBOUND, 1
  field :OUTBOUND, 2
end

defmodule Envoy.Config.Core.V3.KeyValueAppend.KeyValueAppendAction do
  @moduledoc """
  Describes the supported actions types for key/value pair append action.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.config.core.v3.KeyValueAppend.KeyValueAppendAction",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :APPEND_IF_EXISTS_OR_ADD, 0
  field :ADD_IF_ABSENT, 1
  field :OVERWRITE_IF_EXISTS_OR_ADD, 2
  field :OVERWRITE_IF_EXISTS, 3
end

defmodule Envoy.Config.Core.V3.HeaderValueOption.HeaderAppendAction do
  @moduledoc """
  Describes the supported actions types for header append action.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.config.core.v3.HeaderValueOption.HeaderAppendAction",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :APPEND_IF_EXISTS_OR_ADD, 0
  field :ADD_IF_ABSENT, 1
  field :OVERWRITE_IF_EXISTS_OR_ADD, 2
  field :OVERWRITE_IF_EXISTS, 3
end

defmodule Envoy.Config.Core.V3.Locality do
  @moduledoc """
  Identifies location of where either Envoy runs or where upstream hosts run.
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.Locality",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :region, 1, type: :string
  field :zone, 2, type: :string
  field :sub_zone, 3, type: :string, json_name: "subZone"
end

defmodule Envoy.Config.Core.V3.BuildVersion do
  @moduledoc """
  BuildVersion combines SemVer version of extension with free-form build information
  (i.e. 'alpha', 'private-build') as a set of strings.
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.BuildVersion",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :version, 1, type: Envoy.Type.V3.SemanticVersion
  field :metadata, 2, type: Google.Protobuf.Struct
end

defmodule Envoy.Config.Core.V3.Extension do
  @moduledoc """
  Version and identification for an Envoy extension.
  [#next-free-field: 7]
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.Extension",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :name, 1, type: :string
  field :category, 2, type: :string
  field :type_descriptor, 3, type: :string, json_name: "typeDescriptor", deprecated: true
  field :version, 4, type: Envoy.Config.Core.V3.BuildVersion
  field :disabled, 5, type: :bool
  field :type_urls, 6, repeated: true, type: :string, json_name: "typeUrls"
end

defmodule Envoy.Config.Core.V3.Node.DynamicParametersEntry do
  use Protobuf,
    full_name: "envoy.config.core.v3.Node.DynamicParametersEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Xds.Core.V3.ContextParams
end

defmodule Envoy.Config.Core.V3.Node do
  @moduledoc """
  Identifies a specific Envoy instance. The node identifier is presented to the
  management server, which may use this identifier to distinguish per Envoy
  configuration for serving.
  [#next-free-field: 13]
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.Node",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :user_agent_version_type, 0

  field :id, 1, type: :string
  field :cluster, 2, type: :string
  field :metadata, 3, type: Google.Protobuf.Struct

  field :dynamic_parameters, 12,
    repeated: true,
    type: Envoy.Config.Core.V3.Node.DynamicParametersEntry,
    json_name: "dynamicParameters",
    map: true

  field :locality, 4, type: Envoy.Config.Core.V3.Locality
  field :user_agent_name, 6, type: :string, json_name: "userAgentName"
  field :user_agent_version, 7, type: :string, json_name: "userAgentVersion", oneof: 0

  field :user_agent_build_version, 8,
    type: Envoy.Config.Core.V3.BuildVersion,
    json_name: "userAgentBuildVersion",
    oneof: 0

  field :extensions, 9, repeated: true, type: Envoy.Config.Core.V3.Extension
  field :client_features, 10, repeated: true, type: :string, json_name: "clientFeatures"

  field :listening_addresses, 11,
    repeated: true,
    type: Envoy.Config.Core.V3.Address,
    json_name: "listeningAddresses",
    deprecated: true
end

defmodule Envoy.Config.Core.V3.Metadata.FilterMetadataEntry do
  use Protobuf,
    full_name: "envoy.config.core.v3.Metadata.FilterMetadataEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Struct
end

defmodule Envoy.Config.Core.V3.Metadata.TypedFilterMetadataEntry do
  use Protobuf,
    full_name: "envoy.config.core.v3.Metadata.TypedFilterMetadataEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Any
end

defmodule Envoy.Config.Core.V3.Metadata do
  @moduledoc """
  Metadata provides additional inputs to filters based on matched listeners,
  filter chains, routes and endpoints. It is structured as a map, usually from
  filter name (in reverse DNS format) to metadata specific to the filter. Metadata
  key-values for a filter are merged as connection and request handling occurs,
  with later values for the same key overriding earlier values.

  An example use of metadata is providing additional values to
  http_connection_manager in the envoy.http_connection_manager.access_log
  namespace.

  Another example use of metadata is to per service config info in cluster metadata, which may get
  consumed by multiple filters.

  For load balancing, Metadata provides a means to subset cluster endpoints.
  Endpoints have a Metadata object associated and routes contain a Metadata
  object to match against. There are some well defined metadata used today for
  this purpose:

  * ``{"envoy.lb": {"canary": <bool> }}`` This indicates the canary status of an
    endpoint and is also used during header processing
    (x-envoy-upstream-canary) and for stats purposes.
  [#next-major-version: move to type/metadata/v2]
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.Metadata",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :filter_metadata, 1,
    repeated: true,
    type: Envoy.Config.Core.V3.Metadata.FilterMetadataEntry,
    json_name: "filterMetadata",
    map: true,
    deprecated: false

  field :typed_filter_metadata, 2,
    repeated: true,
    type: Envoy.Config.Core.V3.Metadata.TypedFilterMetadataEntry,
    json_name: "typedFilterMetadata",
    map: true,
    deprecated: false
end

defmodule Envoy.Config.Core.V3.RuntimeUInt32 do
  @moduledoc """
  Runtime derived uint32 with a default when not specified.
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.RuntimeUInt32",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :default_value, 2, type: :uint32, json_name: "defaultValue"
  field :runtime_key, 3, type: :string, json_name: "runtimeKey"
end

defmodule Envoy.Config.Core.V3.RuntimeUInt64 do
  @moduledoc """
  Runtime derived uint64 with a default when not specified.
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.RuntimeUInt64",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :default_value, 2, type: :uint64, json_name: "defaultValue"
  field :runtime_key, 3, type: :string, json_name: "runtimeKey"
end

defmodule Envoy.Config.Core.V3.RuntimePercent do
  @moduledoc """
  Runtime derived percentage with a default when not specified.
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.RuntimePercent",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :default_value, 1, type: Envoy.Type.V3.Percent, json_name: "defaultValue"
  field :runtime_key, 2, type: :string, json_name: "runtimeKey"
end

defmodule Envoy.Config.Core.V3.RuntimeDouble do
  @moduledoc """
  Runtime derived double with a default when not specified.
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.RuntimeDouble",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :default_value, 1, type: :double, json_name: "defaultValue"
  field :runtime_key, 2, type: :string, json_name: "runtimeKey"
end

defmodule Envoy.Config.Core.V3.RuntimeFeatureFlag do
  @moduledoc """
  Runtime derived bool with a default when not specified.
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.RuntimeFeatureFlag",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :default_value, 1,
    type: Google.Protobuf.BoolValue,
    json_name: "defaultValue",
    deprecated: false

  field :runtime_key, 2, type: :string, json_name: "runtimeKey"
end

defmodule Envoy.Config.Core.V3.KeyValue do
  @moduledoc """
  Please use :ref:`KeyValuePair <envoy_api_msg_config.core.v3.KeyValuePair>` instead.
  [#not-implemented-hide:]
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.KeyValue",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string, deprecated: true
  field :value, 2, type: :bytes, deprecated: true
end

defmodule Envoy.Config.Core.V3.KeyValuePair do
  use Protobuf,
    full_name: "envoy.config.core.v3.KeyValuePair",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string, deprecated: false
  field :value, 2, type: Google.Protobuf.Value
end

defmodule Envoy.Config.Core.V3.KeyValueAppend do
  @moduledoc """
  Key/value pair plus option to control append behavior. This is used to specify
  key/value pairs that should be appended to a set of existing key/value pairs.
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.KeyValueAppend",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :record, 3, type: Envoy.Config.Core.V3.KeyValuePair
  field :entry, 1, type: Envoy.Config.Core.V3.KeyValue, deprecated: true

  field :action, 2,
    type: Envoy.Config.Core.V3.KeyValueAppend.KeyValueAppendAction,
    enum: true,
    deprecated: false
end

defmodule Envoy.Config.Core.V3.KeyValueMutation do
  @moduledoc """
  Key/value pair to append or remove.
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.KeyValueMutation",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :append, 1, type: Envoy.Config.Core.V3.KeyValueAppend
  field :remove, 2, type: :string, deprecated: false
end

defmodule Envoy.Config.Core.V3.QueryParameter do
  @moduledoc """
  Query parameter name/value pair.
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.QueryParameter",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string, deprecated: false
  field :value, 2, type: :string
end

defmodule Envoy.Config.Core.V3.HeaderValue do
  @moduledoc """
  Header name/value pair.
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.HeaderValue",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string, deprecated: false
  field :value, 2, type: :string, deprecated: false
  field :raw_value, 3, type: :bytes, json_name: "rawValue", deprecated: false
end

defmodule Envoy.Config.Core.V3.HeaderValueOption do
  @moduledoc """
  Header name/value pair plus option to control append behavior.
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.HeaderValueOption",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :header, 1, type: Envoy.Config.Core.V3.HeaderValue, deprecated: false
  field :append, 2, type: Google.Protobuf.BoolValue, deprecated: true

  field :append_action, 3,
    type: Envoy.Config.Core.V3.HeaderValueOption.HeaderAppendAction,
    json_name: "appendAction",
    enum: true,
    deprecated: false

  field :keep_empty_value, 4, type: :bool, json_name: "keepEmptyValue"
end

defmodule Envoy.Config.Core.V3.HeaderMap do
  @moduledoc """
  Wrapper for a set of headers.
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.HeaderMap",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :headers, 1, repeated: true, type: Envoy.Config.Core.V3.HeaderValue
end

defmodule Envoy.Config.Core.V3.WatchedDirectory do
  @moduledoc """
  A directory that is watched for changes, e.g. by inotify on Linux. Move/rename
  events inside this directory trigger the watch.
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.WatchedDirectory",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :path, 1, type: :string, deprecated: false
  field :watch_modify, 2, type: :bool, json_name: "watchModify"
end

defmodule Envoy.Config.Core.V3.DataSource do
  @moduledoc """
  Data source consisting of a file, an inline value, or an environment variable.
  [#next-free-field: 6]
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.DataSource",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :specifier, 0

  field :filename, 1, type: :string, oneof: 0, deprecated: false
  field :inline_bytes, 2, type: :bytes, json_name: "inlineBytes", oneof: 0
  field :inline_string, 3, type: :string, json_name: "inlineString", oneof: 0

  field :environment_variable, 4,
    type: :string,
    json_name: "environmentVariable",
    oneof: 0,
    deprecated: false

  field :watched_directory, 5,
    type: Envoy.Config.Core.V3.WatchedDirectory,
    json_name: "watchedDirectory"
end

defmodule Envoy.Config.Core.V3.RetryPolicy.RetryPriority do
  @moduledoc """
  See :ref:`RetryPriority <envoy_v3_api_field_config.route.v3.RetryPolicy.retry_priority>`.
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.RetryPolicy.RetryPriority",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 2, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Config.Core.V3.RetryPolicy.RetryHostPredicate do
  @moduledoc """
  See :ref:`RetryHostPredicate <envoy_v3_api_field_config.route.v3.RetryPolicy.retry_host_predicate>`.
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.RetryPolicy.RetryHostPredicate",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 2, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Config.Core.V3.RetryPolicy do
  @moduledoc """
  The message specifies the retry policy of remote data source when fetching fails.
  [#next-free-field: 7]
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.RetryPolicy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :retry_back_off, 1, type: Envoy.Config.Core.V3.BackoffStrategy, json_name: "retryBackOff"

  field :num_retries, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "numRetries",
    deprecated: false

  field :retry_on, 3, type: :string, json_name: "retryOn"

  field :retry_priority, 4,
    type: Envoy.Config.Core.V3.RetryPolicy.RetryPriority,
    json_name: "retryPriority"

  field :retry_host_predicate, 5,
    repeated: true,
    type: Envoy.Config.Core.V3.RetryPolicy.RetryHostPredicate,
    json_name: "retryHostPredicate"

  field :host_selection_retry_max_attempts, 6,
    type: :int64,
    json_name: "hostSelectionRetryMaxAttempts"
end

defmodule Envoy.Config.Core.V3.RemoteDataSource do
  @moduledoc """
  The message specifies how to fetch data from remote and how to verify it.
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.RemoteDataSource",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :http_uri, 1, type: Envoy.Config.Core.V3.HttpUri, json_name: "httpUri", deprecated: false
  field :sha256, 2, type: :string, deprecated: false
  field :retry_policy, 3, type: Envoy.Config.Core.V3.RetryPolicy, json_name: "retryPolicy"
end

defmodule Envoy.Config.Core.V3.AsyncDataSource do
  @moduledoc """
  Async data source which support async data fetch.
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.AsyncDataSource",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :specifier, 0

  field :local, 1, type: Envoy.Config.Core.V3.DataSource, oneof: 0
  field :remote, 2, type: Envoy.Config.Core.V3.RemoteDataSource, oneof: 0
end

defmodule Envoy.Config.Core.V3.TransportSocket do
  @moduledoc """
  Configuration for transport socket in :ref:`listeners <config_listeners>` and
  :ref:`clusters <envoy_v3_api_msg_config.cluster.v3.Cluster>`. If the configuration is
  empty, a default transport socket implementation and configuration will be
  chosen based on the platform and existence of tls_context.
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.TransportSocket",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Config.Core.V3.RuntimeFractionalPercent do
  @moduledoc """
  Runtime derived FractionalPercent with defaults for when the numerator or denominator is not
  specified via a runtime key.

  .. note::

    Parsing of the runtime key's data is implemented such that it may be represented as a
    :ref:`FractionalPercent <envoy_v3_api_msg_type.v3.FractionalPercent>` proto represented as JSON/YAML
    and may also be represented as an integer with the assumption that the value is an integral
    percentage out of 100. For instance, a runtime key lookup returning the value "42" would parse
    as a ``FractionalPercent`` whose numerator is 42 and denominator is HUNDRED.
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.RuntimeFractionalPercent",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :default_value, 1,
    type: Envoy.Type.V3.FractionalPercent,
    json_name: "defaultValue",
    deprecated: false

  field :runtime_key, 2, type: :string, json_name: "runtimeKey"
end

defmodule Envoy.Config.Core.V3.ControlPlane do
  @moduledoc """
  Identifies a specific ControlPlane instance that Envoy is connected to.
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.ControlPlane",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :identifier, 1, type: :string
end
