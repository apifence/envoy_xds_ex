defmodule Envoy.Extensions.Filters.Http.StatefulSession.V3.StatefulSession do
  @moduledoc """
  [#protodoc-title: Stateful session filter]
  Stateful session :ref:`configuration overview <config_http_filters_stateful_session>`.
  [#extension: envoy.filters.http.stateful_session]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.stateful_session.v3.StatefulSession",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :session_state, 1,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "sessionState"

  field :strict, 2, type: :bool
  field :stat_prefix, 3, type: :string, json_name: "statPrefix"

  field :status_on_strict_destination_not_found, 4,
    type: :uint32,
    json_name: "statusOnStrictDestinationNotFound"
end

defmodule Envoy.Extensions.Filters.Http.StatefulSession.V3.StatefulSessionPerRoute do
  use Protobuf,
    full_name: "envoy.extensions.filters.http.stateful_session.v3.StatefulSessionPerRoute",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :override, 0

  field :disabled, 1, type: :bool, oneof: 0, deprecated: false

  field :stateful_session, 2,
    type: Envoy.Extensions.Filters.Http.StatefulSession.V3.StatefulSession,
    json_name: "statefulSession",
    oneof: 0
end
