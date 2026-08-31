defmodule Envoy.Extensions.Filters.Common.Jwks.V3.JwtHandshakeValidator do
  @moduledoc """
  Validation of a bearer JWT. A consuming extension verifies the token against the configured JWKS,
  issuer, audiences, and time constraints. On success it publishes the verified claims as dynamic
  metadata under ``claims_metadata_namespace``, so the consumer can bind a claimed identifier to a
  verified claim via ``%DYNAMIC_METADATA(namespace:claim)%``. What a validation failure does, and
  any per-field defaults, are defined by the consuming extension.

  .. attention::
    Verifying the token proves only that the caller *holds* a valid token; it does **not** by itself
    prove the caller is the identity it claims. To authenticate the claimed identity, bind a verified
    claim from the consuming extension's own validation configuration. Without such a binding, a token
    minted for one identity can be presented for another. Tokens without an ``exp`` claim are
    rejected. All top-level claims are published as dynamic metadata (see
    ``claims_metadata_namespace``), so do not put secrets in the token.
  [#next-free-field: 9]
  [#protodoc-title: JWT handshake validation]
  Configuration for verifying a bearer JWT during handshake authentication, shared by extensions
  that authenticate a connection or request by validating a token.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.common.jwks.v3.JwtHandshakeValidator",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :jwks_source_specifier, 0

  field :issuer, 1, type: :string, deprecated: false
  field :audiences, 2, repeated: true, type: :string
  field :local_jwks, 3, type: Envoy.Config.Core.V3.DataSource, json_name: "localJwks", oneof: 0

  field :remote_jwks, 8,
    type: Envoy.Extensions.Filters.Common.Jwks.V3.RemoteJwks,
    json_name: "remoteJwks",
    oneof: 0

  field :token_header, 4, type: :string, json_name: "tokenHeader", deprecated: false

  field :claims_metadata_namespace, 5,
    type: :string,
    json_name: "claimsMetadataNamespace",
    deprecated: false

  field :allow_missing_or_failed, 6, type: :bool, json_name: "allowMissingOrFailed"
  field :clock_skew_seconds, 7, type: :uint32, json_name: "clockSkewSeconds"
end
