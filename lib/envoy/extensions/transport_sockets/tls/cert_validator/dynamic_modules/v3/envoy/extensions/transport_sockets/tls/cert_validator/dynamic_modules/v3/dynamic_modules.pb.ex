defmodule Envoy.Extensions.TransportSockets.Tls.CertValidator.DynamicModules.V3.DynamicModuleCertValidatorConfig do
  @moduledoc """
  Configuration for the dynamic module certificate validator.

  Example:

  .. validated-code-block:: yaml
    :type-name: envoy.extensions.transport_sockets.tls.v3.CertificateValidationContext

    custom_validator_config:
      name: envoy.tls.cert_validator.dynamic_modules
      typed_config:
        "@type": type.googleapis.com/envoy.extensions.transport_sockets.tls.cert_validator.dynamic_modules.v3.DynamicModuleCertValidatorConfig
        dynamic_module_config:
          name: my_module
        validator_name: my_validator
  [#protodoc-title: Dynamic Module Certificate Validator]
  [#extension: envoy.tls.cert_validator.dynamic_modules]
  """

  use Protobuf,
    full_name:
      "envoy.extensions.transport_sockets.tls.cert_validator.dynamic_modules.v3.DynamicModuleCertValidatorConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :dynamic_module_config, 1,
    type: Envoy.Extensions.DynamicModules.V3.DynamicModuleConfig,
    json_name: "dynamicModuleConfig",
    deprecated: false

  field :validator_name, 2, type: :string, json_name: "validatorName", deprecated: false
  field :validator_config, 3, type: Google.Protobuf.Any, json_name: "validatorConfig"
end
