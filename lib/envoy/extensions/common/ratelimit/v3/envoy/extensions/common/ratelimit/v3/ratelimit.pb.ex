defmodule Envoy.Extensions.Common.Ratelimit.V3.XRateLimitHeadersRFCVersion do
  @moduledoc """
  Defines the version of the standard to use for X-RateLimit headers.
  [#protodoc-title: Common rate limit components]
  """

  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.common.ratelimit.v3.XRateLimitHeadersRFCVersion",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :OFF, 0
  field :DRAFT_VERSION_03, 1
end

defmodule Envoy.Extensions.Common.Ratelimit.V3.VhRateLimitsOptions do
  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.common.ratelimit.v3.VhRateLimitsOptions",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :OVERRIDE, 0
  field :INCLUDE, 1
  field :IGNORE, 2
end

defmodule Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor.Entry do
  use Protobuf,
    full_name: "envoy.extensions.common.ratelimit.v3.RateLimitDescriptor.Entry",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string, deprecated: false
  field :value, 2, type: :string, deprecated: false
end

defmodule Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor.RateLimitOverride do
  @moduledoc """
  Override rate limit to apply to this descriptor instead of the limit
  configured in the rate limit service. See :ref:`rate limit override
  <config_http_filters_rate_limit_rate_limit_override>` for more information.
  """

  use Protobuf,
    full_name: "envoy.extensions.common.ratelimit.v3.RateLimitDescriptor.RateLimitOverride",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :requests_per_unit, 1, type: :uint32, json_name: "requestsPerUnit"
  field :unit, 2, type: Envoy.Type.V3.RateLimitUnit, enum: true, deprecated: false
end

defmodule Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor do
  @moduledoc """
  A RateLimitDescriptor is a list of hierarchical entries that are used by the service to
  determine the final rate limit key and overall allowed limit. Here are some examples of how
  they might be used for the domain "envoy".

  .. code-block:: cpp

    ["authenticated": "false"], ["remote_address": "10.0.0.1"]

  What it does: Limits all unauthenticated traffic for the IP address 10.0.0.1. The
  configuration supplies a default limit for the *remote_address* key. If there is a desire to
  raise the limit for 10.0.0.1 or block it entirely it can be specified directly in the
  configuration.

  .. code-block:: cpp

    ["authenticated": "false"], ["path": "/foo/bar"]

  What it does: Limits all unauthenticated traffic globally for a specific path (or prefix if
  configured that way in the service).

  .. code-block:: cpp

    ["authenticated": "false"], ["path": "/foo/bar"], ["remote_address": "10.0.0.1"]

  What it does: Limits unauthenticated traffic to a specific path for a specific IP address.
  Like (1) we can raise/block specific IP addresses if we want with an override configuration.

  .. code-block:: cpp

    ["authenticated": "true"], ["client_id": "foo"]

  What it does: Limits all traffic for an authenticated client "foo"

  .. code-block:: cpp

    ["authenticated": "true"], ["client_id": "foo"], ["path": "/foo/bar"]

  What it does: Limits traffic to a specific path for an authenticated client "foo"

  The idea behind the API is that (1)/(2)/(3) and (4)/(5) can be sent in 1 request if desired.
  This enables building complex application scenarios with a generic backend.

  Optionally the descriptor can contain a limit override under a "limit" key, that specifies
  the number of requests per unit to use instead of the number configured in the
  rate limiting service.
  """

  use Protobuf,
    full_name: "envoy.extensions.common.ratelimit.v3.RateLimitDescriptor",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :entries, 1,
    repeated: true,
    type: Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor.Entry,
    deprecated: false

  field :limit, 2,
    type: Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor.RateLimitOverride

  field :hits_addend, 3, type: Google.Protobuf.UInt64Value, json_name: "hitsAddend"
  field :is_negative_hits, 4, type: :bool, json_name: "isNegativeHits"
end

defmodule Envoy.Extensions.Common.Ratelimit.V3.LocalRateLimitDescriptor do
  @moduledoc """
  Configuration used to enable local rate limiting.

  .. note::
    The ``LocalRateLimitDescriptor`` is used to configure a local rate limit rule with a token
    bucket algorithm. The ``RateLimitDescriptor`` is used to represent a list of symbols that
    are used to match against the rate limit rule.
  """

  use Protobuf,
    full_name: "envoy.extensions.common.ratelimit.v3.LocalRateLimitDescriptor",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :entries, 1,
    repeated: true,
    type: Envoy.Extensions.Common.Ratelimit.V3.RateLimitDescriptor.Entry,
    deprecated: false

  field :token_bucket, 2,
    type: Envoy.Type.V3.TokenBucket,
    json_name: "tokenBucket",
    deprecated: false

  field :shadow_mode, 3, type: :bool, json_name: "shadowMode"
end

defmodule Envoy.Extensions.Common.Ratelimit.V3.LocalClusterRateLimit do
  @moduledoc """
  Configuration used to enable local cluster level rate limiting where the token buckets
  will be shared across all the Envoy instances in the local cluster.
  A share will be calculated based on the membership of the local cluster dynamically
  and the configuration. When the limiter refilling the token bucket, the share will be
  applied. By default, the token bucket will be shared evenly.

  See :ref:`local cluster name
  <envoy_v3_api_field_config.bootstrap.v3.ClusterManager.local_cluster_name>` for more context
  about local cluster.
  """

  use Protobuf,
    full_name: "envoy.extensions.common.ratelimit.v3.LocalClusterRateLimit",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end
