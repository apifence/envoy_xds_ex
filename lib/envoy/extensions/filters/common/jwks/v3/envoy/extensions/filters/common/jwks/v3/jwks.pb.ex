defmodule Envoy.Extensions.Filters.Common.Jwks.V3.RemoteJwks do
  @moduledoc """
  This message specifies how to fetch JWKS from remote and how to cache it.
  [#protodoc-title: Common JWKS fetch]
  Configuration for fetching a JSON Web Key Set (JWKS) from a remote HTTP server and caching it,
  shared by extensions that need remote JWKS.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.common.jwks.v3.RemoteJwks",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :http_uri, 1, type: Envoy.Config.Core.V3.HttpUri, json_name: "httpUri", deprecated: false

  field :cache_duration, 2,
    type: Google.Protobuf.Duration,
    json_name: "cacheDuration",
    deprecated: false

  field :async_fetch, 3,
    type: Envoy.Extensions.Filters.Common.Jwks.V3.JwksAsyncFetch,
    json_name: "asyncFetch"

  field :retry_policy, 4, type: Envoy.Config.Core.V3.RetryPolicy, json_name: "retryPolicy"
end

defmodule Envoy.Extensions.Filters.Common.Jwks.V3.JwksAsyncFetch do
  @moduledoc """
  Fetch Jwks asynchronously in the main thread when the filter config is parsed.
  The listener is activated only after the Jwks is fetched.
  When the Jwks is expired in the cache, it is fetched again in the main thread.
  The fetched Jwks from the main thread can be used by all worker threads.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.common.jwks.v3.JwksAsyncFetch",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :fast_listener, 1, type: :bool, json_name: "fastListener"

  field :failed_refetch_duration, 2,
    type: Google.Protobuf.Duration,
    json_name: "failedRefetchDuration"
end
