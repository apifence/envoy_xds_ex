defmodule Envoy.Extensions.RequestId.Uuid.V3.UuidRequestIdConfig do
  @moduledoc """
  Configuration for the default UUID request ID extension which has the following behavior:

  1. Request ID is propagated using the :ref:`x-request-id
     <config_http_conn_man_headers_x-request-id>` header.

  2. Request ID is a universally unique identifier `(UUID4)
     <https://en.wikipedia.org/wiki/Universally_unique_identifier#Version_4_(random)>`_.

  3. Tracing decision (sampled, forced, etc) is set in 13th nibble of the UUID. By default this will
     overwrite existing UUIDs received in the ``x-request-id`` header if the trace sampling decision
     is changed. The 13th nibble of the UUID4 has been chosen because it is fixed to '4' by the
     standard. Thus, '4' indicates a default UUID and no trace status. This nibble is swapped to:

       a. '9': Sampled.
       b. 'a': Force traced due to server-side override.
       c. 'b': Force traced due to client-side request ID joining.

     See the :ref:`x-request-id <config_http_conn_man_headers_x-request-id>` documentation for
     more information.
  [#protodoc-title: UUID]
  [#extension: envoy.request_id.uuid]
  """

  use Protobuf,
    full_name: "envoy.extensions.request_id.uuid.v3.UuidRequestIdConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :pack_trace_reason, 1, type: Google.Protobuf.BoolValue, json_name: "packTraceReason"

  field :use_request_id_for_trace_sampling, 2,
    type: Google.Protobuf.BoolValue,
    json_name: "useRequestIdForTraceSampling"
end
