defmodule Envoy.Extensions.TransportSockets.Tls.V3.SPIFFECertValidatorConfig.TrustDomain do
  use Protobuf,
    full_name: "envoy.extensions.transport_sockets.tls.v3.SPIFFECertValidatorConfig.TrustDomain",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :trust_bundle, 2, type: Envoy.Config.Core.V3.DataSource, json_name: "trustBundle"
  field :workload_trust_domain, 3, type: :string, json_name: "workloadTrustDomain"
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.SPIFFECertValidatorConfig do
  @moduledoc """
  Configuration specific to the `SPIFFE <https://github.com/spiffe/spiffe>`_ certificate validator.

  Example:

  .. validated-code-block:: yaml
    :type-name: envoy.extensions.transport_sockets.tls.v3.CertificateValidationContext

    custom_validator_config:
      name: envoy.tls.cert_validator.spiffe
      typed_config:
        "@type": type.googleapis.com/envoy.extensions.transport_sockets.tls.v3.SPIFFECertValidatorConfig
        trust_domains:
        - name: foo.com
          trust_bundle:
            filename: "foo.pem"
        - name: envoy.com
          trust_bundle:
            filename: "envoy.pem"

  In this example, a presented peer certificate whose SAN matches ``spiffe://foo.com/**`` is validated against
  the "foo.pem" x.509 certificate. All the trust bundles are isolated from each other, so no trust domain can mint
  a SVID belonging to another trust domain. That means, in this example, a SVID signed by ``envoy.com``'s CA with ``spiffe://foo.com/**``
  SAN would be rejected since Envoy selects the trust bundle according to the presented SAN before validate the certificate.

  Note that SPIFFE validator inherits and uses the following options from :ref:`CertificateValidationContext <envoy_v3_api_msg_extensions.transport_sockets.tls.v3.CertificateValidationContext>`.

  - :ref:`allow_expired_certificate <envoy_v3_api_field_extensions.transport_sockets.tls.v3.CertificateValidationContext.allow_expired_certificate>` to allow expired certificates.
  - :ref:`match_typed_subject_alt_names <envoy_v3_api_field_extensions.transport_sockets.tls.v3.CertificateValidationContext.match_typed_subject_alt_names>` to match **URI** SAN of certificates. Unlike the default validator, SPIFFE validator only matches **URI** SAN (which equals to SVID in SPIFFE terminology) and ignore other SAN types.

  To support multi-tenant use cases, a filter state object ``envoy.tls.cert_validator.spiffe.workload_trust_domain``
  should be used to define the per-connection workload trust domain. When matching a peer trust domain, both the
  workload and the peer trust domains are used in selecting the validation certificate. The filter state object
  should be shared with the upstream to be used in the upstream TLS context SPIFFE validation context.
  [#protodoc-title: SPIFFE Certificate Validator]
  [#extension: envoy.tls.cert_validator.spiffe]
  """

  use Protobuf,
    full_name: "envoy.extensions.transport_sockets.tls.v3.SPIFFECertValidatorConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :trust_domains, 1,
    repeated: true,
    type: Envoy.Extensions.TransportSockets.Tls.V3.SPIFFECertValidatorConfig.TrustDomain,
    json_name: "trustDomains",
    deprecated: false

  field :trust_bundles, 2, type: Envoy.Config.Core.V3.DataSource, json_name: "trustBundles"
end
