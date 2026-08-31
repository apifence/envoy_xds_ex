defmodule Envoy.Extensions.Filters.Http.Oauth2.V3.CookieConfig.SameSite do
  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.filters.http.oauth2.v3.CookieConfig.SameSite",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :DISABLED, 0
  field :STRICT, 1
  field :LAX, 2
  field :NONE, 3
end

defmodule Envoy.Extensions.Filters.Http.Oauth2.V3.PrivateKeyJwtConfig.SigningAlgorithm do
  @moduledoc """
  Supported JWT signing algorithms for the client assertion.
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.filters.http.oauth2.v3.PrivateKeyJwtConfig.SigningAlgorithm",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :RS256, 0
  field :RS384, 1
  field :RS512, 2
  field :ES256, 3
  field :ES384, 4
  field :ES512, 5
end

defmodule Envoy.Extensions.Filters.Http.Oauth2.V3.OAuth2Config.AuthType do
  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.filters.http.oauth2.v3.OAuth2Config.AuthType",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :URL_ENCODED_BODY, 0
  field :BASIC_AUTH, 1
  field :TLS_CLIENT_AUTH, 2
  field :PRIVATE_KEY_JWT, 3
end

defmodule Envoy.Extensions.Filters.Http.Oauth2.V3.CookieConfig do
  @moduledoc """
  OAuth cookie configuration attributes.
  [#protodoc-title: OAuth]
  OAuth :ref:`configuration overview <config_http_filters_oauth>`.
  [#extension: envoy.filters.http.oauth2]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.oauth2.v3.CookieConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :same_site, 1,
    type: Envoy.Extensions.Filters.Http.Oauth2.V3.CookieConfig.SameSite,
    json_name: "sameSite",
    enum: true,
    deprecated: false

  field :path, 2, type: :string, deprecated: false
  field :partitioned, 3, type: :bool
end

defmodule Envoy.Extensions.Filters.Http.Oauth2.V3.CookieConfigs do
  @moduledoc """
  [#next-free-field: 8]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.oauth2.v3.CookieConfigs",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :bearer_token_cookie_config, 1,
    type: Envoy.Extensions.Filters.Http.Oauth2.V3.CookieConfig,
    json_name: "bearerTokenCookieConfig"

  field :oauth_hmac_cookie_config, 2,
    type: Envoy.Extensions.Filters.Http.Oauth2.V3.CookieConfig,
    json_name: "oauthHmacCookieConfig"

  field :oauth_expires_cookie_config, 3,
    type: Envoy.Extensions.Filters.Http.Oauth2.V3.CookieConfig,
    json_name: "oauthExpiresCookieConfig"

  field :id_token_cookie_config, 4,
    type: Envoy.Extensions.Filters.Http.Oauth2.V3.CookieConfig,
    json_name: "idTokenCookieConfig"

  field :refresh_token_cookie_config, 5,
    type: Envoy.Extensions.Filters.Http.Oauth2.V3.CookieConfig,
    json_name: "refreshTokenCookieConfig"

  field :oauth_nonce_cookie_config, 6,
    type: Envoy.Extensions.Filters.Http.Oauth2.V3.CookieConfig,
    json_name: "oauthNonceCookieConfig"

  field :code_verifier_cookie_config, 7,
    type: Envoy.Extensions.Filters.Http.Oauth2.V3.CookieConfig,
    json_name: "codeVerifierCookieConfig"
end

defmodule Envoy.Extensions.Filters.Http.Oauth2.V3.OAuth2Credentials.CookieNames do
  @moduledoc """
  [#next-free-field: 8]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.oauth2.v3.OAuth2Credentials.CookieNames",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :bearer_token, 1, type: :string, json_name: "bearerToken", deprecated: false
  field :oauth_hmac, 2, type: :string, json_name: "oauthHmac", deprecated: false
  field :oauth_expires, 3, type: :string, json_name: "oauthExpires", deprecated: false
  field :id_token, 4, type: :string, json_name: "idToken", deprecated: false
  field :refresh_token, 5, type: :string, json_name: "refreshToken", deprecated: false
  field :oauth_nonce, 6, type: :string, json_name: "oauthNonce", deprecated: false
  field :code_verifier, 7, type: :string, json_name: "codeVerifier", deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.Oauth2.V3.OAuth2Credentials do
  @moduledoc """
  [#next-free-field: 6]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.oauth2.v3.OAuth2Credentials",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :token_formation, 0

  field :client_id, 1, type: :string, json_name: "clientId", deprecated: false

  field :token_secret, 2,
    type: Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig,
    json_name: "tokenSecret"

  field :hmac_secret, 3,
    type: Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig,
    json_name: "hmacSecret",
    oneof: 0,
    deprecated: false

  field :cookie_names, 4,
    type: Envoy.Extensions.Filters.Http.Oauth2.V3.OAuth2Credentials.CookieNames,
    json_name: "cookieNames"

  field :cookie_domain, 5, type: :string, json_name: "cookieDomain", deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.Oauth2.V3.PrivateKeyJwtConfig do
  @moduledoc """
  Configuration for ``PRIVATE_KEY_JWT`` client authentication (RFC 7523).
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.oauth2.v3.PrivateKeyJwtConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :signing_algorithm, 1,
    type: Envoy.Extensions.Filters.Http.Oauth2.V3.PrivateKeyJwtConfig.SigningAlgorithm,
    json_name: "signingAlgorithm",
    enum: true,
    deprecated: false

  field :assertion_lifetime, 2,
    type: Google.Protobuf.Duration,
    json_name: "assertionLifetime",
    deprecated: false

  field :assertion_audience, 3, type: :string, json_name: "assertionAudience"
end

defmodule Envoy.Extensions.Filters.Http.Oauth2.V3.OAuth2TokenForwarding do
  @moduledoc """
  Defines how an OAuth token is forwarded upstream.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.oauth2.v3.OAuth2TokenForwarding",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :header, 1, type: :string, deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.Oauth2.V3.PostLogoutRedirectUri do
  @moduledoc """
  Configuration for the ``post_logout_redirect_uri`` parameter used in OpenID Connect
  `RP-Initiated Logout requests <https://openid.net/specs/openid-connect-rpinitiated-1_0.html>`_.
  This configuration is ignored if ``end_session_endpoint`` is not set.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.oauth2.v3.PostLogoutRedirectUri",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :config, 0

  field :disabled, 1, type: :bool, oneof: 0, deprecated: false
  field :uri, 2, type: :string, oneof: 0, deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.Oauth2.V3.OAuth2Config do
  @moduledoc """
  OAuth config

  [#next-free-field: 34]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.oauth2.v3.OAuth2Config",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :token_endpoint, 1, type: Envoy.Config.Core.V3.HttpUri, json_name: "tokenEndpoint"
  field :retry_policy, 18, type: Envoy.Config.Core.V3.RetryPolicy, json_name: "retryPolicy"

  field :authorization_endpoint, 2,
    type: :string,
    json_name: "authorizationEndpoint",
    deprecated: false

  field :end_session_endpoint, 23, type: :string, json_name: "endSessionEndpoint"

  field :post_logout_redirect_uri, 33,
    type: Envoy.Extensions.Filters.Http.Oauth2.V3.PostLogoutRedirectUri,
    json_name: "postLogoutRedirectUri"

  field :credentials, 3,
    type: Envoy.Extensions.Filters.Http.Oauth2.V3.OAuth2Credentials,
    deprecated: false

  field :redirect_uri, 4, type: :string, json_name: "redirectUri", deprecated: false

  field :redirect_path_matcher, 5,
    type: Envoy.Type.Matcher.V3.PathMatcher,
    json_name: "redirectPathMatcher",
    deprecated: false

  field :signout_path, 6,
    type: Envoy.Type.Matcher.V3.PathMatcher,
    json_name: "signoutPath",
    deprecated: false

  field :forward_bearer_token, 7, type: :bool, json_name: "forwardBearerToken"

  field :forward_id_token, 31,
    type: Envoy.Extensions.Filters.Http.Oauth2.V3.OAuth2TokenForwarding,
    json_name: "forwardIdToken"

  field :preserve_authorization_header, 16, type: :bool, json_name: "preserveAuthorizationHeader"

  field :pass_through_matcher, 8,
    repeated: true,
    type: Envoy.Config.Route.V3.HeaderMatcher,
    json_name: "passThroughMatcher"

  field :auth_scopes, 9, repeated: true, type: :string, json_name: "authScopes"
  field :resources, 10, repeated: true, type: :string

  field :auth_type, 11,
    type: Envoy.Extensions.Filters.Http.Oauth2.V3.OAuth2Config.AuthType,
    json_name: "authType",
    enum: true,
    deprecated: false

  field :use_refresh_token, 12, type: Google.Protobuf.BoolValue, json_name: "useRefreshToken"
  field :default_expires_in, 13, type: Google.Protobuf.Duration, json_name: "defaultExpiresIn"

  field :deny_redirect_matcher, 14,
    repeated: true,
    type: Envoy.Config.Route.V3.HeaderMatcher,
    json_name: "denyRedirectMatcher"

  field :default_refresh_token_expires_in, 15,
    type: Google.Protobuf.Duration,
    json_name: "defaultRefreshTokenExpiresIn"

  field :disable_id_token_set_cookie, 17, type: :bool, json_name: "disableIdTokenSetCookie"

  field :disable_access_token_set_cookie, 19,
    type: :bool,
    json_name: "disableAccessTokenSetCookie"

  field :disable_refresh_token_set_cookie, 20,
    type: :bool,
    json_name: "disableRefreshTokenSetCookie"

  field :cookie_configs, 21,
    type: Envoy.Extensions.Filters.Http.Oauth2.V3.CookieConfigs,
    json_name: "cookieConfigs"

  field :stat_prefix, 22, type: :string, json_name: "statPrefix"

  field :csrf_token_expires_in, 24,
    type: Google.Protobuf.Duration,
    json_name: "csrfTokenExpiresIn"

  field :code_verifier_token_expires_in, 25,
    type: Google.Protobuf.Duration,
    json_name: "codeVerifierTokenExpiresIn"

  field :disable_token_encryption, 26, type: :bool, json_name: "disableTokenEncryption"

  field :allow_failed_matcher, 27,
    repeated: true,
    type: Envoy.Config.Route.V3.HeaderMatcher,
    json_name: "allowFailedMatcher"

  field :original_request_uri, 28, type: :string, json_name: "originalRequestUri"

  field :allowed_redirect_domains, 29,
    repeated: true,
    type: :string,
    json_name: "allowedRedirectDomains"

  field :use_access_token_expiry_for_id_token_cookie, 30,
    type: :bool,
    json_name: "useAccessTokenExpiryForIdTokenCookie"

  field :private_key_jwt_config, 32,
    type: Envoy.Extensions.Filters.Http.Oauth2.V3.PrivateKeyJwtConfig,
    json_name: "privateKeyJwtConfig"
end

defmodule Envoy.Extensions.Filters.Http.Oauth2.V3.OAuth2PerRoute do
  @moduledoc """
  Per-route OAuth2 config.

  This message supplies an OAuth2Config for the matched route.
  It overrides the filter-level config for requests matching the route.
  If neither the global config nor a per-route config is specified, OAuth2 is disabled for the route.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.oauth2.v3.OAuth2PerRoute",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :config, 1, type: Envoy.Extensions.Filters.Http.Oauth2.V3.OAuth2Config, deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.Oauth2.V3.OAuth2 do
  @moduledoc """
  Filter config.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.oauth2.v3.OAuth2",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :config, 1, type: Envoy.Extensions.Filters.Http.Oauth2.V3.OAuth2Config
end
