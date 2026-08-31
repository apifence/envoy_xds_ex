defmodule Envoy.Extensions.Filters.Udp.UdpProxy.Session.ExtAuthz.V3.FilterConfig.BufferOptions do
  @moduledoc """
  Configuration for UDP datagrams buffering while the authorization call is in flight.
  """

  use Protobuf,
    full_name:
      "envoy.extensions.filters.udp.udp_proxy.session.ext_authz.v3.FilterConfig.BufferOptions",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :max_buffered_datagrams, 1,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxBufferedDatagrams"

  field :max_buffered_bytes, 2, type: Google.Protobuf.UInt64Value, json_name: "maxBufferedBytes"
end

defmodule Envoy.Extensions.Filters.Udp.UdpProxy.Session.ExtAuthz.V3.FilterConfig do
  @moduledoc """
  External authorization for UDP proxy sessions over the gRPC
  :ref:`CheckRequest <envoy_v3_api_msg_service.auth.v3.CheckRequest>` API.
  [#protodoc-title: UDP session external authorization]
  UDP proxy session external authorization
  :ref:`configuration overview <config_udp_session_filters_ext_authz>`.
  [#extension: envoy.filters.udp.session.ext_authz]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.udp.udp_proxy.session.ext_authz.v3.FilterConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false

  field :grpc_service, 2,
    type: Envoy.Config.Core.V3.GrpcService,
    json_name: "grpcService",
    deprecated: false

  field :failure_mode_allow, 3, type: :bool, json_name: "failureModeAllow"

  field :buffer_options, 4,
    type: Envoy.Extensions.Filters.Udp.UdpProxy.Session.ExtAuthz.V3.FilterConfig.BufferOptions,
    json_name: "bufferOptions"
end
