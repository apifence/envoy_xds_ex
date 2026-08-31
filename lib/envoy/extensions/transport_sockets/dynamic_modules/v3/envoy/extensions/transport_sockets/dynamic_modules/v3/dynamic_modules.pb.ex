defmodule Envoy.Extensions.TransportSockets.DynamicModules.V3.DynamicModuleTransportSocket do
  @moduledoc """
  Configuration for a transport socket implemented by a dynamic module. The transport socket
  performs the raw I/O for a connection and may transform the bytes that flow over it, for example
  to implement a custom encryption scheme.

  Example:

  .. code-block:: yaml

    transport_socket:
      name: envoy.transport_sockets.dynamic_modules
      typed_config:
        "@type": type.googleapis.com/envoy.extensions.transport_sockets.dynamic_modules.v3.DynamicModuleTransportSocket
        dynamic_module_config:
          name: my_module
        transport_socket_name: my_transport_socket
  [#protodoc-title: Dynamic Module Transport Socket]
  [#extension: envoy.transport_sockets.dynamic_modules]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.transport_sockets.dynamic_modules.v3.DynamicModuleTransportSocket",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :dynamic_module_config, 1,
    type: Envoy.Extensions.DynamicModules.V3.DynamicModuleConfig,
    json_name: "dynamicModuleConfig",
    deprecated: false

  field :transport_socket_name, 2,
    type: :string,
    json_name: "transportSocketName",
    deprecated: false

  field :transport_socket_config, 3, type: Google.Protobuf.Any, json_name: "transportSocketConfig"
  field :implements_secure_transport, 4, type: :bool, json_name: "implementsSecureTransport"
end
