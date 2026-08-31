defmodule Envoy.Extensions.InternalRedirect.FilterState.V3.FilterStateConfig do
  @moduledoc """
  An internal redirect predicate that decides whether to follow a redirect by
  reading a boolean filter-state object set earlier in the request by another
  filter (Lua, ext_proc, ``set_filter_state``, a dynamic module, ...).

  The predicate reads the filter-state boolean object named ``redirect_enabled_key``:

  * If the value is ``true``: follows the redirect
  * If the value is ``false``: does not follow the redirect
  * If the object is absent: ``redirect_if_absent`` decides (default: false)

  This lets a request-phase filter decide, per request, whether an
  otherwise-enabled internal redirect is actually taken, without changing route
  matching. Rich, request-time logic (tenant, JWT claim, header, time-of-day,
  rollout %) belongs in the filter that *sets* the boolean value; this predicate
  is a thin reader.
  [#extension: envoy.internal_redirect_predicates.filter_state]
  [#protodoc-title: Filter-state internal redirect predicate]
  """

  use Protobuf,
    full_name: "envoy.extensions.internal_redirect.filter_state.v3.FilterStateConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :redirect_enabled_key, 1,
    type: :string,
    json_name: "redirectEnabledKey",
    deprecated: false

  field :redirect_if_absent, 2, type: :bool, json_name: "redirectIfAbsent"
end
