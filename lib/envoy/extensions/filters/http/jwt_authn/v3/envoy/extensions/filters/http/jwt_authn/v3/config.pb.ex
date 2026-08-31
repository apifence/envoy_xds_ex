defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtProvider.NormalizePayload do
  @moduledoc """
  Alters the payload representation in the request dynamic metadata to facilitate its use in matching.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.jwt_authn.v3.JwtProvider.NormalizePayload",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :space_delimited_claims, 1,
    repeated: true,
    type: :string,
    json_name: "spaceDelimitedClaims"
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtProvider do
  @moduledoc """
  Please see following for JWT authentication flow:

  * `JSON Web Token (JWT) <https://tools.ietf.org/html/rfc7519>`_
  * `The OAuth 2.0 Authorization Framework <https://tools.ietf.org/html/rfc6749>`_
  * `OpenID Connect <http://openid.net/connect>`_

  A JwtProvider message specifies how a JSON Web Token (JWT) can be verified. It specifies:

  * issuer: the principal that issues the JWT. If specified, it has to match the ``iss`` field in JWT.
  * allowed audiences: the ones in the token have to be listed here.
  * how to fetch public key JWKS to verify the token signature.
  * how to extract the JWT in the request.
  * how to pass successfully verified token payload.

  Example:

  .. code-block:: yaml

      issuer: https://example.com
      audiences:
      - bookstore_android.apps.googleusercontent.com
      - bookstore_web.apps.googleusercontent.com
      remote_jwks:
        http_uri:
          uri: https://example.com/.well-known/jwks.json
          cluster: example_jwks_cluster
          timeout: 1s
        cache_duration:
          seconds: 300

  [#next-free-field: 22]
  [#protodoc-title: JWT Authentication]
  JWT Authentication :ref:`configuration overview <config_http_filters_jwt_authn>`.
  [#extension: envoy.filters.http.jwt_authn]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.jwt_authn.v3.JwtProvider",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :jwks_source_specifier, 0

  field :issuer, 1, type: :string
  field :audiences, 2, repeated: true, type: :string
  field :subjects, 19, type: Envoy.Type.Matcher.V3.StringMatcher
  field :require_expiration, 20, type: :bool, json_name: "requireExpiration"
  field :max_lifetime, 21, type: Google.Protobuf.Duration, json_name: "maxLifetime"

  field :remote_jwks, 3,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.RemoteJwks,
    json_name: "remoteJwks",
    oneof: 0

  field :local_jwks, 4, type: Envoy.Config.Core.V3.DataSource, json_name: "localJwks", oneof: 0
  field :forward, 5, type: :bool

  field :from_headers, 6,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtHeader,
    json_name: "fromHeaders"

  field :from_params, 7, repeated: true, type: :string, json_name: "fromParams"
  field :from_cookies, 13, repeated: true, type: :string, json_name: "fromCookies"

  field :forward_payload_header, 8,
    type: :string,
    json_name: "forwardPayloadHeader",
    deprecated: false

  field :pad_forward_payload_header, 11, type: :bool, json_name: "padForwardPayloadHeader"
  field :payload_in_metadata, 9, type: :string, json_name: "payloadInMetadata"

  field :normalize_payload_in_metadata, 18,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtProvider.NormalizePayload,
    json_name: "normalizePayloadInMetadata"

  field :header_in_metadata, 14, type: :string, json_name: "headerInMetadata"
  field :failed_status_in_metadata, 16, type: :string, json_name: "failedStatusInMetadata"
  field :clock_skew_seconds, 10, type: :uint32, json_name: "clockSkewSeconds"

  field :jwt_cache_config, 12,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtCacheConfig,
    json_name: "jwtCacheConfig"

  field :claim_to_headers, 15,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtClaimToHeader,
    json_name: "claimToHeaders"

  field :clear_route_cache, 17, type: :bool, json_name: "clearRouteCache"
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtCacheConfig do
  @moduledoc """
  This message specifies JWT Cache configuration.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.jwt_authn.v3.JwtCacheConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :jwt_cache_size, 1, type: :uint32, json_name: "jwtCacheSize"
  field :jwt_max_token_size, 2, type: :uint32, json_name: "jwtMaxTokenSize"
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.RemoteJwks do
  @moduledoc """
  This message specifies how to fetch JWKS from remote and how to cache it.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.jwt_authn.v3.RemoteJwks",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :http_uri, 1, type: Envoy.Config.Core.V3.HttpUri, json_name: "httpUri", deprecated: false

  field :cache_duration, 2,
    type: Google.Protobuf.Duration,
    json_name: "cacheDuration",
    deprecated: false

  field :async_fetch, 3,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwksAsyncFetch,
    json_name: "asyncFetch"

  field :retry_policy, 4, type: Envoy.Config.Core.V3.RetryPolicy, json_name: "retryPolicy"
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwksAsyncFetch do
  @moduledoc """
  Fetch Jwks asynchronously in the main thread when the filter config is parsed.
  The listener is activated only after the Jwks is fetched.
  When the Jwks is expired in the cache, it is fetched again in the main thread.
  The fetched Jwks from the main thread can be used by all worker threads.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.jwt_authn.v3.JwksAsyncFetch",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :fast_listener, 1, type: :bool, json_name: "fastListener"

  field :failed_refetch_duration, 2,
    type: Google.Protobuf.Duration,
    json_name: "failedRefetchDuration"
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtHeader do
  @moduledoc """
  This message specifies a header location to extract the JWT.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.jwt_authn.v3.JwtHeader",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :value_prefix, 2, type: :string, json_name: "valuePrefix", deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.ProviderWithAudiences do
  @moduledoc """
  Specify a required provider with audiences.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.jwt_authn.v3.ProviderWithAudiences",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :provider_name, 1, type: :string, json_name: "providerName"
  field :audiences, 2, repeated: true, type: :string
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtRequirement do
  @moduledoc """
  This message specifies a Jwt requirement. An empty message means JWT verification is not
  required. Here are some config examples:

  .. code-block:: yaml

   # Example 1: not required with an empty message

   # Example 2: require A
   provider_name: provider-A

   # Example 3: require A or B
   requires_any:
     requirements:
       - provider_name: provider-A
       - provider_name: provider-B

   # Example 4: require A and B
   requires_all:
     requirements:
       - provider_name: provider-A
       - provider_name: provider-B

   # Example 5: require A and (B or C)
   requires_all:
     requirements:
       - provider_name: provider-A
       - requires_any:
         requirements:
           - provider_name: provider-B
           - provider_name: provider-C

   # Example 6: require A or (B and C)
   requires_any:
     requirements:
       - provider_name: provider-A
       - requires_all:
         requirements:
           - provider_name: provider-B
           - provider_name: provider-C

   # Example 7: A is optional (if token from A is provided, it must be valid, but also allows
   missing token.)
   requires_any:
     requirements:
     - provider_name: provider-A
     - allow_missing: {}

   # Example 8: A is optional and B is required.
   requires_all:
     requirements:
     - requires_any:
         requirements:
         - provider_name: provider-A
         - allow_missing: {}
     - provider_name: provider-B

  [#next-free-field: 8]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.jwt_authn.v3.JwtRequirement",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :requires_type, 0

  field :provider_name, 1, type: :string, json_name: "providerName", oneof: 0

  field :provider_and_audiences, 2,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.ProviderWithAudiences,
    json_name: "providerAndAudiences",
    oneof: 0

  field :requires_any, 3,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtRequirementOrList,
    json_name: "requiresAny",
    oneof: 0

  field :requires_all, 4,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtRequirementAndList,
    json_name: "requiresAll",
    oneof: 0

  field :allow_missing_or_failed, 5,
    type: Google.Protobuf.Empty,
    json_name: "allowMissingOrFailed",
    oneof: 0

  field :allow_missing, 6, type: Google.Protobuf.Empty, json_name: "allowMissing", oneof: 0

  field :extract_only_without_validation, 7,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.ExtractOnlyWithoutValidation,
    json_name: "extractOnlyWithoutValidation",
    oneof: 0
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.ExtractOnlyWithoutValidation do
  @moduledoc """
  Configuration for extract-only mode without JWT signature validation.

  When this mode is active and a JWT is present in the request but fails
  signature verification, a verification status header is set on the request
  to signal to downstream filters (RBAC, ext_authz) that the JWT claims were
  NOT cryptographically verified. The header is not set when the JWT is valid
  or when no JWT is present.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.jwt_authn.v3.ExtractOnlyWithoutValidation",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :verification_status_header, 1, type: :string, json_name: "verificationStatusHeader"
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtRequirementOrList do
  @moduledoc """
  This message specifies a list of RequiredProvider.
  Their results are OR-ed; if any one of them passes, the result is passed
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.jwt_authn.v3.JwtRequirementOrList",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :requirements, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtRequirement,
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtRequirementAndList do
  @moduledoc """
  This message specifies a list of RequiredProvider.
  Their results are AND-ed; all of them must pass, if one of them fails or missing, it fails.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.jwt_authn.v3.JwtRequirementAndList",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :requirements, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtRequirement,
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.RequirementRule do
  @moduledoc """
  This message specifies a Jwt requirement for a specific Route condition.
  Example 1:

  .. code-block:: yaml

     - match:
         prefix: /healthz

  In above example, "requires" field is empty for /healthz prefix match,
  it means that requests matching the path prefix don't require JWT authentication.

  Example 2:

  .. code-block:: yaml

     - match:
         prefix: /
       requires: { provider_name: provider-A }

  In above example, all requests matched the path prefix require jwt authentication
  from "provider-A".
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.jwt_authn.v3.RequirementRule",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :requirement_type, 0

  field :match, 1, type: Envoy.Config.Route.V3.RouteMatch, deprecated: false
  field :requires, 2, type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtRequirement, oneof: 0

  field :requirement_name, 3,
    type: :string,
    json_name: "requirementName",
    oneof: 0,
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.FilterStateRule.RequiresEntry do
  use Protobuf,
    full_name: "envoy.extensions.filters.http.jwt_authn.v3.FilterStateRule.RequiresEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtRequirement
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.FilterStateRule do
  @moduledoc """
  This message specifies Jwt requirements based on stream_info.filterState.
  This FilterState should use ``Router::StringAccessor`` object to set a string value.
  Other HTTP filters can use it to specify Jwt requirements dynamically.

  Example:

  .. code-block:: yaml

     name: jwt_selector
     requires:
       issuer_1:
         provider_name: issuer1
       issuer_2:
         provider_name: issuer2

  If a filter set "jwt_selector" with "issuer_1" to FilterState for a request,
  jwt_authn filter will use JwtRequirement{"provider_name": "issuer1"} to verify.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.jwt_authn.v3.FilterStateRule",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false

  field :requires, 3,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.FilterStateRule.RequiresEntry,
    map: true
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtAuthentication.ProvidersEntry do
  use Protobuf,
    full_name: "envoy.extensions.filters.http.jwt_authn.v3.JwtAuthentication.ProvidersEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtProvider
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtAuthentication.RequirementMapEntry do
  use Protobuf,
    full_name: "envoy.extensions.filters.http.jwt_authn.v3.JwtAuthentication.RequirementMapEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtRequirement
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtAuthentication do
  @moduledoc """
  This is the Envoy HTTP filter config for JWT authentication.

  For example:

  .. code-block:: yaml

    providers:
       provider1:
         issuer: issuer1
         audiences:
         - audience1
         - audience2
         remote_jwks:
           http_uri:
             uri: https://example.com/.well-known/jwks.json
             cluster: example_jwks_cluster
             timeout: 1s
       provider2:
         issuer: issuer2
         local_jwks:
           inline_string: jwks_string

    rules:
       # Not jwt verification is required for /health path
       - match:
           prefix: /health

       # Jwt verification for provider1 is required for path prefixed with "prefix"
       - match:
           prefix: /prefix
         requires:
           provider_name: provider1

       # Jwt verification for either provider1 or provider2 is required for all other requests.
       - match:
           prefix: /
         requires:
           requires_any:
             requirements:
               - provider_name: provider1
               - provider_name: provider2

  [#next-free-field: 8]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.jwt_authn.v3.JwtAuthentication",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :providers, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtAuthentication.ProvidersEntry,
    map: true

  field :rules, 2, repeated: true, type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.RequirementRule

  field :filter_state_rules, 3,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.FilterStateRule,
    json_name: "filterStateRules"

  field :bypass_cors_preflight, 4, type: :bool, json_name: "bypassCorsPreflight"

  field :requirement_map, 5,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtAuthentication.RequirementMapEntry,
    json_name: "requirementMap",
    map: true

  field :strip_failure_response, 6, type: :bool, json_name: "stripFailureResponse"
  field :stat_prefix, 7, type: :string, json_name: "statPrefix"
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.PerRouteConfig do
  @moduledoc """
  Specify per-route config.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.jwt_authn.v3.PerRouteConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :requirement_specifier, 0

  field :disabled, 1, type: :bool, oneof: 0, deprecated: false

  field :requirement_name, 2,
    type: :string,
    json_name: "requirementName",
    oneof: 0,
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtClaimToHeader.PathSegment do
  @moduledoc """
  Specifies a segment in a path for retrieving a claim from the JWT payload.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.jwt_authn.v3.JwtClaimToHeader.PathSegment",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string, deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtClaimToHeader do
  @moduledoc """
  This message specifies a combination of header name and claim name.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.jwt_authn.v3.JwtClaimToHeader",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :header_name, 1, type: :string, json_name: "headerName", deprecated: false
  field :claim_name, 2, type: :string, json_name: "claimName"

  field :claim_path, 3,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.JwtAuthn.V3.JwtClaimToHeader.PathSegment,
    json_name: "claimPath"
end
