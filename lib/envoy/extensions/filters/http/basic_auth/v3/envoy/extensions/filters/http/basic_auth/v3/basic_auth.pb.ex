defmodule Envoy.Extensions.Filters.Http.BasicAuth.V3.BasicAuth do
  @moduledoc """
  Basic HTTP authentication.

  Example:

  .. code-block:: yaml

    users:
      inline_string: |-
        user1:{SHA}hashed_user1_password
        user2:{SHA}hashed_user2_password

  [#next-free-field: 6]
  [#protodoc-title: Basic Auth]
  Basic Auth :ref:`configuration overview <config_http_filters_basic_auth>`.
  [#extension: envoy.filters.http.basic_auth]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.basic_auth.v3.BasicAuth",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :users, 1, type: Envoy.Config.Core.V3.DataSource, deprecated: false

  field :forward_username_header, 2,
    type: :string,
    json_name: "forwardUsernameHeader",
    deprecated: false

  field :authentication_header, 3,
    type: :string,
    json_name: "authenticationHeader",
    deprecated: false

  field :allow_missing, 4, type: :bool, json_name: "allowMissing"
  field :emit_dynamic_metadata, 5, type: :bool, json_name: "emitDynamicMetadata"
end

defmodule Envoy.Extensions.Filters.Http.BasicAuth.V3.BasicAuthPerRoute do
  @moduledoc """
  Extra settings that may be added to per-route configuration for
  a virtual host or a cluster.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.basic_auth.v3.BasicAuthPerRoute",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :users, 1, type: Envoy.Config.Core.V3.DataSource, deprecated: false
end
