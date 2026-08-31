defmodule Envoy.Extensions.RateLimitDescriptors.JwtClaim.V3.Descriptor do
  @moduledoc """
  The following descriptor entry is appended with a value extracted from a
  named claim in a JWT found in an HTTP request header.

  .. code-block:: cpp

    ("<descriptor_key>", "<claim_value>")

  .. warning::

     SECURITY WARNING: This extension does NOT verify JWT signatures. Any
     party can present a forged or expired JWT with arbitrary claims, and
     those claims will be used as rate limit descriptor values. This means
     an attacker can trivially evade or manipulate per-claim rate limits
     (e.g. impersonate another subject, or rotate a fake claim value on
     every request to bypass limiting entirely) unless the JWT signature
     is verified elsewhere in the request path — for example, by an
     upstream mTLS-authenticated service, or by an
     :ref:`envoy.filters.http.jwt_authn
     <envoy_v3_api_msg_extensions.filters.http.jwt_authn.v3.JwtAuthentication>`
     filter earlier in the same filter chain that rejects invalid tokens
     before this descriptor action runs.

     DO NOT use this extension to gate access, apply differentiated rate
     limits by trust level, or make any authorization-adjacent decision
     based on the extracted claim, unless signature verification is
     PROVABLY performed elsewhere in the request path.

     If you need Envoy itself to verify the JWT before rate limiting,
     use the :ref:`envoy.filters.http.jwt_authn
     <envoy_v3_api_msg_extensions.filters.http.jwt_authn.v3.JwtAuthentication>`
     filter (placed before the rate limit filter) together with a
     :ref:`request_headers
     <envoy_v3_api_field_config.route.v3.RateLimit.Action.request_headers>`
     or :ref:`metadata
     <envoy_v3_api_field_config.route.v3.RateLimit.Action.metadata>`
     descriptor action instead of this extension.
  [#next-free-field: 7]
  [#protodoc-title: Rate limit descriptor from JWT claim]
  [#extension: envoy.rate_limit_descriptors.jwt_claim]
  """

  use Protobuf,
    full_name: "envoy.extensions.rate_limit_descriptors.jwt_claim.v3.Descriptor",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :descriptor_key, 1, type: :string, json_name: "descriptorKey", deprecated: false
  field :header_name, 2, type: :string, json_name: "headerName", deprecated: false
  field :value_prefix, 3, type: :string, json_name: "valuePrefix", deprecated: false
  field :claim_name, 4, type: :string, json_name: "claimName", deprecated: false
  field :default_value, 5, type: :string, json_name: "defaultValue"
  field :skip_if_absent, 6, type: :bool, json_name: "skipIfAbsent"
end
