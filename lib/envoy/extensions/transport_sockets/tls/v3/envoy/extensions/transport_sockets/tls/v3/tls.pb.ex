defmodule Envoy.Extensions.TransportSockets.Tls.V3.DownstreamTlsContext.OcspStaplePolicy do
  use Protobuf,
    enum: true,
    full_name: "envoy.extensions.transport_sockets.tls.v3.DownstreamTlsContext.OcspStaplePolicy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :LENIENT_STAPLING, 0
  field :STRICT_STAPLING, 1
  field :MUST_STAPLE, 2
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.UpstreamTlsContext do
  @moduledoc """
  [#next-free-field: 8]
  [#protodoc-title: TLS transport socket]
  [#extension: envoy.transport_sockets.tls]
  The TLS contexts below provide the transport socket configuration for upstream/downstream TLS.
  """

  use Protobuf,
    full_name: "envoy.extensions.transport_sockets.tls.v3.UpstreamTlsContext",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :common_tls_context, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext,
    json_name: "commonTlsContext"

  field :sni, 2, type: :string, deprecated: false
  field :auto_host_sni, 6, type: :bool, json_name: "autoHostSni"
  field :auto_sni_san_validation, 7, type: :bool, json_name: "autoSniSanValidation"
  field :allow_renegotiation, 3, type: :bool, json_name: "allowRenegotiation"
  field :max_session_keys, 4, type: Google.Protobuf.UInt32Value, json_name: "maxSessionKeys"

  field :enforce_rsa_key_usage, 5,
    type: Google.Protobuf.BoolValue,
    json_name: "enforceRsaKeyUsage",
    deprecated: true
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.DownstreamTlsContext do
  @moduledoc """
  [#next-free-field: 12]
  """

  use Protobuf,
    full_name: "envoy.extensions.transport_sockets.tls.v3.DownstreamTlsContext",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :session_ticket_keys_type, 0

  field :common_tls_context, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext,
    json_name: "commonTlsContext"

  field :require_client_certificate, 2,
    type: Google.Protobuf.BoolValue,
    json_name: "requireClientCertificate"

  field :require_sni, 3, type: Google.Protobuf.BoolValue, json_name: "requireSni"

  field :session_ticket_keys, 4,
    type: Envoy.Extensions.TransportSockets.Tls.V3.TlsSessionTicketKeys,
    json_name: "sessionTicketKeys",
    oneof: 0

  field :session_ticket_keys_sds_secret_config, 5,
    type: Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig,
    json_name: "sessionTicketKeysSdsSecretConfig",
    oneof: 0

  field :disable_stateless_session_resumption, 7,
    type: :bool,
    json_name: "disableStatelessSessionResumption",
    oneof: 0

  field :disable_stateful_session_resumption, 10,
    type: :bool,
    json_name: "disableStatefulSessionResumption"

  field :session_timeout, 6,
    type: Google.Protobuf.Duration,
    json_name: "sessionTimeout",
    deprecated: false

  field :ocsp_staple_policy, 8,
    type: Envoy.Extensions.TransportSockets.Tls.V3.DownstreamTlsContext.OcspStaplePolicy,
    json_name: "ocspStaplePolicy",
    enum: true,
    deprecated: false

  field :full_scan_certs_on_sni_mismatch, 9,
    type: Google.Protobuf.BoolValue,
    json_name: "fullScanCertsOnSniMismatch"

  field :prefer_client_ciphers, 11, type: :bool, json_name: "preferClientCiphers"
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.TlsKeyLog do
  @moduledoc """
  TLS key log configuration.
  The key log file format is "format used by NSS for its SSLKEYLOGFILE debugging output" (text taken from openssl man page)
  """

  use Protobuf,
    full_name: "envoy.extensions.transport_sockets.tls.v3.TlsKeyLog",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :path, 1, type: :string, deprecated: false

  field :local_address_range, 2,
    repeated: true,
    type: Envoy.Config.Core.V3.CidrRange,
    json_name: "localAddressRange"

  field :remote_address_range, 3,
    repeated: true,
    type: Envoy.Config.Core.V3.CidrRange,
    json_name: "remoteAddressRange"
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CertificateProvider do
  @moduledoc """
  Config for the Certificate Provider to fetch certificates. Certificates are fetched/refreshed asynchronously over
  the network relative to the TLS handshake.

  DEPRECATED: This message is not currently used, but if we ever do need it, we will want to
  move it out of CommonTlsContext and into common.proto, similar to the existing
  CertificateProviderPluginInstance message.

  [#not-implemented-hide:]
  """

  use Protobuf,
    full_name: "envoy.extensions.transport_sockets.tls.v3.CommonTlsContext.CertificateProvider",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :config, 0

  field :name, 1, type: :string, deprecated: false

  field :typed_config, 2,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "typedConfig",
    oneof: 0
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CertificateProviderInstance do
  @moduledoc """
  Similar to CertificateProvider above, but allows the provider instances to be configured on
  the client side instead of being sent from the control plane.

  DEPRECATED: This message was moved outside of CommonTlsContext
  and now lives in common.proto.

  [#not-implemented-hide:]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.transport_sockets.tls.v3.CommonTlsContext.CertificateProviderInstance",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :instance_name, 1, type: :string, json_name: "instanceName"
  field :certificate_name, 2, type: :string, json_name: "certificateName"
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CombinedCertificateValidationContext do
  use Protobuf,
    full_name:
      "envoy.extensions.transport_sockets.tls.v3.CommonTlsContext.CombinedCertificateValidationContext",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :default_validation_context, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CertificateValidationContext,
    json_name: "defaultValidationContext",
    deprecated: false

  field :validation_context_sds_secret_config, 2,
    type: Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig,
    json_name: "validationContextSdsSecretConfig",
    deprecated: false

  field :validation_context_certificate_provider, 3,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CertificateProvider,
    json_name: "validationContextCertificateProvider",
    deprecated: true

  field :validation_context_certificate_provider_instance, 4,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CertificateProviderInstance,
    json_name: "validationContextCertificateProviderInstance",
    deprecated: true
end

defmodule Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext do
  @moduledoc """
  TLS context shared by both client and server TLS contexts.
  [#next-free-field: 17]
  """

  use Protobuf,
    full_name: "envoy.extensions.transport_sockets.tls.v3.CommonTlsContext",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :validation_context_type, 0

  field :tls_params, 1,
    type: Envoy.Extensions.TransportSockets.Tls.V3.TlsParameters,
    json_name: "tlsParams"

  field :tls_certificates, 2,
    repeated: true,
    type: Envoy.Extensions.TransportSockets.Tls.V3.TlsCertificate,
    json_name: "tlsCertificates"

  field :tls_certificate_sds_secret_configs, 6,
    repeated: true,
    type: Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig,
    json_name: "tlsCertificateSdsSecretConfigs"

  field :tls_certificate_provider_instance, 14,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CertificateProviderPluginInstance,
    json_name: "tlsCertificateProviderInstance"

  field :custom_tls_certificate_selector, 16,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "customTlsCertificateSelector"

  field :tls_certificate_certificate_provider, 9,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CertificateProvider,
    json_name: "tlsCertificateCertificateProvider",
    deprecated: true

  field :tls_certificate_certificate_provider_instance, 11,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CertificateProviderInstance,
    json_name: "tlsCertificateCertificateProviderInstance",
    deprecated: true

  field :validation_context, 3,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CertificateValidationContext,
    json_name: "validationContext",
    oneof: 0

  field :validation_context_sds_secret_config, 7,
    type: Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig,
    json_name: "validationContextSdsSecretConfig",
    oneof: 0

  field :combined_validation_context, 8,
    type:
      Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CombinedCertificateValidationContext,
    json_name: "combinedValidationContext",
    oneof: 0

  field :validation_context_certificate_provider, 10,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CertificateProvider,
    json_name: "validationContextCertificateProvider",
    oneof: 0,
    deprecated: true

  field :validation_context_certificate_provider_instance, 12,
    type: Envoy.Extensions.TransportSockets.Tls.V3.CommonTlsContext.CertificateProviderInstance,
    json_name: "validationContextCertificateProviderInstance",
    oneof: 0,
    deprecated: true

  field :alpn_protocols, 4, repeated: true, type: :string, json_name: "alpnProtocols"

  field :custom_handshaker, 13,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "customHandshaker"

  field :key_log, 15,
    type: Envoy.Extensions.TransportSockets.Tls.V3.TlsKeyLog,
    json_name: "keyLog"
end
