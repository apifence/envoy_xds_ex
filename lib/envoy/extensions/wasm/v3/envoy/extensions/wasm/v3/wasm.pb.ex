defmodule Envoy.Extensions.Wasm.V3.FailurePolicy do
  @moduledoc """
  If there is a fatal error on the VM (e.g. exception, ``abort()``), then the policy will be applied.
  [#protodoc-title: Wasm]
  [#extension: envoy.bootstrap.wasm]
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.wasm.v3.FailurePolicy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :UNSPECIFIED, 0
  field :FAIL_RELOAD, 1
  field :FAIL_CLOSED, 2
  field :FAIL_OPEN, 3
end

defmodule Envoy.Extensions.Wasm.V3.ReloadConfig do
  use Protobuf,
    full_name: "envoy.extensions.wasm.v3.ReloadConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :backoff, 1, type: Envoy.Config.Core.V3.BackoffStrategy
end

defmodule Envoy.Extensions.Wasm.V3.CapabilityRestrictionConfig.AllowedCapabilitiesEntry do
  use Protobuf,
    full_name: "envoy.extensions.wasm.v3.CapabilityRestrictionConfig.AllowedCapabilitiesEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Extensions.Wasm.V3.SanitizationConfig
end

defmodule Envoy.Extensions.Wasm.V3.CapabilityRestrictionConfig do
  @moduledoc """
  Configuration for restricting Proxy-Wasm capabilities available to modules.
  """

  use Protobuf,
    full_name: "envoy.extensions.wasm.v3.CapabilityRestrictionConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :allowed_capabilities, 1,
    repeated: true,
    type: Envoy.Extensions.Wasm.V3.CapabilityRestrictionConfig.AllowedCapabilitiesEntry,
    json_name: "allowedCapabilities",
    map: true
end

defmodule Envoy.Extensions.Wasm.V3.SanitizationConfig do
  @moduledoc """
  Configuration for sanitization of inputs to an allowed capability.

  .. note::
    This is currently unimplemented.
  """

  use Protobuf,
    full_name: "envoy.extensions.wasm.v3.SanitizationConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Extensions.Wasm.V3.VmConfig do
  @moduledoc """
  Configuration for a Wasm VM.
  [#next-free-field: 9]
  """

  use Protobuf,
    full_name: "envoy.extensions.wasm.v3.VmConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :vm_id, 1, type: :string, json_name: "vmId"
  field :runtime, 2, type: :string
  field :code, 3, type: Envoy.Config.Core.V3.AsyncDataSource
  field :configuration, 4, type: Google.Protobuf.Any
  field :allow_precompiled, 5, type: :bool, json_name: "allowPrecompiled"
  field :nack_on_code_cache_miss, 6, type: :bool, json_name: "nackOnCodeCacheMiss"

  field :environment_variables, 7,
    type: Envoy.Extensions.Wasm.V3.EnvironmentVariables,
    json_name: "environmentVariables"

  field :capability_restriction_config, 8,
    type: Envoy.Extensions.Wasm.V3.CapabilityRestrictionConfig,
    json_name: "capabilityRestrictionConfig"
end

defmodule Envoy.Extensions.Wasm.V3.EnvironmentVariables.KeyValuesEntry do
  use Protobuf,
    full_name: "envoy.extensions.wasm.v3.EnvironmentVariables.KeyValuesEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Envoy.Extensions.Wasm.V3.EnvironmentVariables do
  use Protobuf,
    full_name: "envoy.extensions.wasm.v3.EnvironmentVariables",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :host_env_keys, 1, repeated: true, type: :string, json_name: "hostEnvKeys"

  field :key_values, 2,
    repeated: true,
    type: Envoy.Extensions.Wasm.V3.EnvironmentVariables.KeyValuesEntry,
    json_name: "keyValues",
    map: true
end

defmodule Envoy.Extensions.Wasm.V3.PluginConfig do
  @moduledoc """
  Base Configuration for Wasm Plugins e.g. filters and services.
  [#next-free-field: 10]
  """

  use Protobuf,
    full_name: "envoy.extensions.wasm.v3.PluginConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :vm, 0

  field :name, 1, type: :string
  field :root_id, 2, type: :string, json_name: "rootId"
  field :vm_config, 3, type: Envoy.Extensions.Wasm.V3.VmConfig, json_name: "vmConfig", oneof: 0
  field :configuration, 4, type: Google.Protobuf.Any
  field :fail_open, 5, type: :bool, json_name: "failOpen", deprecated: true

  field :failure_policy, 7,
    type: Envoy.Extensions.Wasm.V3.FailurePolicy,
    json_name: "failurePolicy",
    enum: true

  field :reload_config, 8, type: Envoy.Extensions.Wasm.V3.ReloadConfig, json_name: "reloadConfig"

  field :capability_restriction_config, 6,
    type: Envoy.Extensions.Wasm.V3.CapabilityRestrictionConfig,
    json_name: "capabilityRestrictionConfig",
    deprecated: true

  field :allow_on_headers_stop_iteration, 9,
    type: Google.Protobuf.BoolValue,
    json_name: "allowOnHeadersStopIteration"
end

defmodule Envoy.Extensions.Wasm.V3.WasmService do
  @moduledoc """
  WasmService is configured as a built-in ``envoy.wasm_service`` :ref:`WasmService
  <config_wasm_service>` This opaque configuration will be used to create a Wasm Service.
  """

  use Protobuf,
    full_name: "envoy.extensions.wasm.v3.WasmService",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :config, 1, type: Envoy.Extensions.Wasm.V3.PluginConfig
  field :singleton, 2, type: :bool
end
