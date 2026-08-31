defmodule Envoy.Extensions.Filters.Http.BodySizeLimit.V3.BodySizeLimit do
  @moduledoc """
  [#protodoc-title: Body Size Limit]
  Body Size Limit :ref:`configuration overview <config_http_filters_body_size_limit>`.
  [#extension: envoy.filters.http.body_size_limit]
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.body_size_limit.v3.BodySizeLimit",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :max_request_bytes, 1,
    type: Google.Protobuf.UInt64Value,
    json_name: "maxRequestBytes",
    deprecated: false
end
