defmodule Envoy.Extensions.HealthCheckers.Udp.V3.UdpHealthCheck do
  @moduledoc """
  Configuration for the UDP health checker.

  For every health-check attempt, Envoy creates a fresh connected UDP socket targeting the host's
  :ref:`health check address
  <envoy_v3_api_field_config.endpoint.v3.Endpoint.HealthCheckConfig.address>`. UDP ``connect()``
  only selects the peer; it does not establish connectivity and does not count as a successful
  health check. The :ref:`reuse_connection
  <envoy_v3_api_field_config.core.v3.HealthCheck.reuse_connection>` setting does not apply.

  Attempts for a host are serialized so that only one attempt is active at a time. Envoy sends
  exactly one datagram containing ``send`` and waits for a response until the enclosing
  :ref:`HealthCheck.timeout <envoy_v3_api_field_config.core.v3.HealthCheck.timeout>` expires.

  The connected socket accepts datagrams only from the configured peer. Each complete response
  datagram is compared byte-for-byte with ``receive``. A matching datagram completes the attempt
  successfully. Non-matching datagrams do not satisfy the check; Envoy continues waiting until a
  matching datagram arrives or the attempt times out. A timeout or local socket error completes
  the attempt unsuccessfully.

  The enclosing :ref:`HealthCheck
  <envoy_v3_api_msg_config.core.v3.HealthCheck>` controls thresholds, intervals, jitter,
  statistics, and event logging.
  [#protodoc-title: UDP Health Checker]
  [#not-implemented-hide:]
  [#extension: envoy.health_checkers.udp]
  """

  use Protobuf,
    full_name: "envoy.extensions.health_checkers.udp.v3.UdpHealthCheck",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :send, 1, type: Envoy.Config.Core.V3.HealthCheck.Payload, deprecated: false
  field :receive, 2, type: Envoy.Config.Core.V3.HealthCheck.Payload, deprecated: false
end
