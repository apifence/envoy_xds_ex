defmodule Envoy.Extensions.Formatter.GenericSecret.V3.GenericSecret.SecretConfigsEntry do
  use Protobuf,
    full_name: "envoy.extensions.formatter.generic_secret.v3.GenericSecret.SecretConfigsEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig
end

defmodule Envoy.Extensions.Formatter.GenericSecret.V3.GenericSecret do
  @moduledoc """
  GenericSecret formatter extension implements the ``%SECRET(name)%`` command operator that
  resolves the value of a named generic secret obtained via SDS or static bootstrap configuration.

  The secret must be a :ref:`GenericSecret <envoy_v3_api_msg_extensions.transport_sockets.tls.v3.GenericSecret>`
  with the ``secret`` field set.

  Example configuration adding an authorization header with a secret obtained via SDS:

  .. code-block:: yaml

    http_uri:
      uri: https://api.example.com/v1/data
      cluster: api_backend
      timeout: 5s
    request_headers_to_add:
    - header:
        key: "authorization"
        value: "Bearer %SECRET(my-api-token)%"
    formatters:
    - name: envoy.formatter.generic_secret
      typed_config:
        "@type": type.googleapis.com/envoy.extensions.formatter.generic_secret.v3.GenericSecret
        secret_configs:
          my-api-token:
            name: bearer-token
            sds_config:
              ads: {}
  [#protodoc-title: Formatter extension for printing values from generic secrets]
  [#extension: envoy.formatter.generic_secret]
  """

  use Protobuf,
    full_name: "envoy.extensions.formatter.generic_secret.v3.GenericSecret",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :secret_configs, 1,
    repeated: true,
    type: Envoy.Extensions.Formatter.GenericSecret.V3.GenericSecret.SecretConfigsEntry,
    json_name: "secretConfigs",
    map: true,
    deprecated: false
end
