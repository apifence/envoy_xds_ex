defmodule Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol.TlvLocation do
  @moduledoc """
  Controls where TLV values are stored when rules match.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.filters.listener.proxy_protocol.v3.ProxyProtocol.TlvLocation",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :DYNAMIC_METADATA, 0
  field :FILTER_STATE, 1
end

defmodule Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol.KeyValuePair.ValueStringEncoding do
  @moduledoc """
  Specifies the encoding scheme that is used to encode the TLV value before it is
  stored in dynamic metadata or filter state.
  """

  use Protobuf,
    enum: true,
    full_name:
      "envoy.extensions.filters.listener.proxy_protocol.v3.ProxyProtocol.KeyValuePair.ValueStringEncoding",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :UNSPECIFIED, 0
  field :SANITIZED_UTF8, 1
  field :BASE64, 2
end

defmodule Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol.KeyValuePair do
  use Protobuf,
    full_name: "envoy.extensions.filters.listener.proxy_protocol.v3.ProxyProtocol.KeyValuePair",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :metadata_namespace, 1, type: :string, json_name: "metadataNamespace"
  field :key, 2, type: :string, deprecated: false

  field :value_string_encoding, 3,
    type:
      Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol.KeyValuePair.ValueStringEncoding,
    json_name: "valueStringEncoding",
    enum: true
end

defmodule Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol.Rule do
  @moduledoc """
  A Rule defines what metadata to apply when a header is present or missing.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.listener.proxy_protocol.v3.ProxyProtocol.Rule",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :tlv_type, 1, type: :uint32, json_name: "tlvType", deprecated: false

  field :on_tlv_present, 2,
    type: Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol.KeyValuePair,
    json_name: "onTlvPresent"
end

defmodule Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol do
  @moduledoc """
  [#next-free-field: 7]
  [#protodoc-title: Proxy Protocol Filter]
  PROXY protocol listener filter.
  [#extension: envoy.filters.listener.proxy_protocol]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.listener.proxy_protocol.v3.ProxyProtocol",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :rules, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol.Rule

  field :allow_requests_without_proxy_protocol, 2,
    type: :bool,
    json_name: "allowRequestsWithoutProxyProtocol"

  field :pass_through_tlvs, 3,
    type: Envoy.Config.Core.V3.ProxyProtocolPassThroughTLVs,
    json_name: "passThroughTlvs"

  field :disallowed_versions, 4,
    repeated: true,
    type: Envoy.Config.Core.V3.ProxyProtocolConfig.Version,
    json_name: "disallowedVersions",
    enum: true

  field :stat_prefix, 5, type: :string, json_name: "statPrefix"

  field :tlv_location, 6,
    type: Envoy.Extensions.Filters.Listener.ProxyProtocol.V3.ProxyProtocol.TlvLocation,
    json_name: "tlvLocation",
    enum: true
end
