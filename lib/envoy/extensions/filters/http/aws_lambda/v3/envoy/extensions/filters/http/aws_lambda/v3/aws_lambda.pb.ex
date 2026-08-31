defmodule Envoy.Extensions.Filters.Http.AwsLambda.V3.Config.InvocationMode do
  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.filters.http.aws_lambda.v3.Config.InvocationMode",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :SYNCHRONOUS, 0
  field :ASYNCHRONOUS, 1
end

defmodule Envoy.Extensions.Filters.Http.AwsLambda.V3.Config do
  @moduledoc """
  AWS Lambda filter config
  [#next-free-field: 9]
  [#protodoc-title: AWS Lambda]
  AWS Lambda :ref:`configuration overview <config_http_filters_aws_lambda>`.
  [#extension: envoy.filters.http.aws_lambda]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.aws_lambda.v3.Config",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :arn, 1, type: :string, deprecated: false
  field :payload_passthrough, 2, type: :bool, json_name: "payloadPassthrough"

  field :invocation_mode, 3,
    type: Envoy.Extensions.Filters.Http.AwsLambda.V3.Config.InvocationMode,
    json_name: "invocationMode",
    enum: true,
    deprecated: false

  field :host_rewrite, 4, type: :string, json_name: "hostRewrite"
  field :credentials_profile, 5, type: :string, json_name: "credentialsProfile"
  field :credentials, 6, type: Envoy.Extensions.Filters.Http.AwsLambda.V3.Credentials

  field :match_excluded_headers, 7,
    repeated: true,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "matchExcludedHeaders"

  field :match_included_headers, 8,
    repeated: true,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "matchIncludedHeaders"
end

defmodule Envoy.Extensions.Filters.Http.AwsLambda.V3.Credentials do
  @moduledoc """
  AWS Lambda Credentials config.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.aws_lambda.v3.Credentials",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :access_key_id, 1, type: :string, json_name: "accessKeyId", deprecated: false
  field :secret_access_key, 2, type: :string, json_name: "secretAccessKey", deprecated: false
  field :session_token, 3, type: :string, json_name: "sessionToken"
end

defmodule Envoy.Extensions.Filters.Http.AwsLambda.V3.PerRouteConfig do
  @moduledoc """
  Per-route configuration for AWS Lambda. This can be useful when invoking a different Lambda function or a different
  version of the same Lambda depending on the route.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.aws_lambda.v3.PerRouteConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :invoke_config, 1,
    type: Envoy.Extensions.Filters.Http.AwsLambda.V3.Config,
    json_name: "invokeConfig"
end
