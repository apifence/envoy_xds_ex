defmodule Envoy.Config.Core.V3.SocketAddress.Protocol do
  use Protobuf,
    enum: true,
    full_name: "envoy.config.core.v3.SocketAddress.Protocol",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :TCP, 0
  field :UDP, 1
end

defmodule Envoy.Config.Core.V3.Pipe do
  @moduledoc """
  [#protodoc-title: Network addresses]
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.Pipe",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :path, 1, type: :string, deprecated: false
  field :mode, 2, type: :uint32, deprecated: false
end

defmodule Envoy.Config.Core.V3.EnvoyInternalAddress do
  @moduledoc """
  The address represents an envoy internal listener.
  [#comment: TODO(asraa): When address available, remove workaround from test/server/server_fuzz_test.cc:30.]
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.EnvoyInternalAddress",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :address_name_specifier, 0

  field :server_listener_name, 1, type: :string, json_name: "serverListenerName", oneof: 0
  field :endpoint_id, 2, type: :string, json_name: "endpointId"
end

defmodule Envoy.Config.Core.V3.SocketAddress do
  @moduledoc """
  [#next-free-field: 8]
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.SocketAddress",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :port_specifier, 0

  field :protocol, 1,
    type: Envoy.Config.Core.V3.SocketAddress.Protocol,
    enum: true,
    deprecated: false

  field :address, 2, type: :string, deprecated: false
  field :port_value, 3, type: :uint32, json_name: "portValue", oneof: 0, deprecated: false
  field :named_port, 4, type: :string, json_name: "namedPort", oneof: 0
  field :resolver_name, 5, type: :string, json_name: "resolverName"
  field :ipv4_compat, 6, type: :bool, json_name: "ipv4Compat"
  field :network_namespace_filepath, 7, type: :string, json_name: "networkNamespaceFilepath"
end

defmodule Envoy.Config.Core.V3.TcpKeepalive do
  use Protobuf,
    full_name: "envoy.config.core.v3.TcpKeepalive",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :keepalive_probes, 1, type: Google.Protobuf.UInt32Value, json_name: "keepaliveProbes"
  field :keepalive_time, 2, type: Google.Protobuf.UInt32Value, json_name: "keepaliveTime"
  field :keepalive_interval, 3, type: Google.Protobuf.UInt32Value, json_name: "keepaliveInterval"
end

defmodule Envoy.Config.Core.V3.ExtraSourceAddress do
  use Protobuf,
    full_name: "envoy.config.core.v3.ExtraSourceAddress",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :address, 1, type: Envoy.Config.Core.V3.SocketAddress, deprecated: false

  field :socket_options, 2,
    type: Envoy.Config.Core.V3.SocketOptionsOverride,
    json_name: "socketOptions"
end

defmodule Envoy.Config.Core.V3.BindConfig do
  @moduledoc """
  [#next-free-field: 8]
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.BindConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :source_address, 1, type: Envoy.Config.Core.V3.SocketAddress, json_name: "sourceAddress"
  field :freebind, 2, type: Google.Protobuf.BoolValue

  field :socket_options, 3,
    repeated: true,
    type: Envoy.Config.Core.V3.SocketOption,
    json_name: "socketOptions"

  field :extra_source_addresses, 5,
    repeated: true,
    type: Envoy.Config.Core.V3.ExtraSourceAddress,
    json_name: "extraSourceAddresses"

  field :additional_source_addresses, 4,
    repeated: true,
    type: Envoy.Config.Core.V3.SocketAddress,
    json_name: "additionalSourceAddresses",
    deprecated: true

  field :local_address_selector, 6,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "localAddressSelector"

  field :validate_network_namespaces, 7, type: :bool, json_name: "validateNetworkNamespaces"
end

defmodule Envoy.Config.Core.V3.Address do
  @moduledoc """
  Addresses specify either a logical or physical address and port, which are
  used to tell Envoy where to bind/listen, connect to upstream and find
  management servers.
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.Address",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :address, 0

  field :socket_address, 1,
    type: Envoy.Config.Core.V3.SocketAddress,
    json_name: "socketAddress",
    oneof: 0

  field :pipe, 2, type: Envoy.Config.Core.V3.Pipe, oneof: 0

  field :envoy_internal_address, 3,
    type: Envoy.Config.Core.V3.EnvoyInternalAddress,
    json_name: "envoyInternalAddress",
    oneof: 0
end

defmodule Envoy.Config.Core.V3.CidrRange do
  @moduledoc """
  CidrRange specifies an IP Address and a prefix length to construct
  the subnet mask for a `CIDR <https://tools.ietf.org/html/rfc4632>`_ range.
  """

  use Protobuf,
    full_name: "envoy.config.core.v3.CidrRange",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :address_prefix, 1, type: :string, json_name: "addressPrefix", deprecated: false

  field :prefix_len, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "prefixLen",
    deprecated: false
end
