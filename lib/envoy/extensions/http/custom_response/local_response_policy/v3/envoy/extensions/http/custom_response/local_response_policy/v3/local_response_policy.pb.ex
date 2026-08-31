defmodule Envoy.Extensions.Http.CustomResponse.LocalResponsePolicy.V3.LocalResponsePolicy do
  @moduledoc """
  Custom response policy to serve a locally stored response to the
  downstream.
  [#next-free-field: 7]
  [#protodoc-title: Local Response Policy for Custom Response]
  [#extension: envoy.http.custom_response.local_response_policy]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.http.custom_response.local_response_policy.v3.LocalResponsePolicy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :response_code_details_action, 0

  field :body, 1, type: Envoy.Config.Core.V3.DataSource

  field :body_format, 2,
    type: Envoy.Config.Core.V3.SubstitutionFormatString,
    json_name: "bodyFormat"

  field :status_code, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "statusCode",
    deprecated: false

  field :response_headers_to_add, 4,
    repeated: true,
    type: Envoy.Config.Core.V3.HeaderValueOption,
    json_name: "responseHeadersToAdd",
    deprecated: false

  field :preserve_response_code_details, 5,
    type: :bool,
    json_name: "preserveResponseCodeDetails",
    oneof: 0,
    deprecated: false

  field :response_code_details, 6,
    type: :string,
    json_name: "responseCodeDetails",
    oneof: 0,
    deprecated: false
end
