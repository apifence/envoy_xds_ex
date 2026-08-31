defmodule Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.ProtoApiScrubberConfig.FilteringMode do
  @moduledoc """
  An enum enlisting all the filtering modes supported by this filter.
  """

  use Protobuf,
    enum: true,
    full_name:
      "envoy.extensions.filters.http.proto_api_scrubber.v3.ProtoApiScrubberConfig.FilteringMode",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :OVERRIDE, 0
end

defmodule Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.ProtoApiScrubberConfig do
  @moduledoc """
  [#protodoc-title: Proto API Scrubber]
  [#extension: envoy.filters.http.proto_api_scrubber]
  ProtoApiScrubber filter supports filtering of the request and
  response payloads based on the configured field restrictions and actions.
  The field restrictions and actions can be defined using unified matcher API.
  The filter evaluates the configured restriction for each field
  to produce the filtered output using the configured actions.
  The design doc for this filter is available
  `here <https://docs.google.com/document/d/1jgRe5mhucFRgmKYf-Ukk20jW8kusIo53U5bcF74GkK8>`_
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.proto_api_scrubber.v3.ProtoApiScrubberConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :descriptor_set, 1,
    type: Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.DescriptorSet,
    json_name: "descriptorSet"

  field :restrictions, 2, type: Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.Restrictions

  field :filtering_mode, 3,
    type: Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.ProtoApiScrubberConfig.FilteringMode,
    json_name: "filteringMode",
    enum: true

  field :scrub_unknown_fields, 4, type: :bool, json_name: "scrubUnknownFields"
end

defmodule Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.DescriptorSet do
  @moduledoc """
  Specifies the descriptor set for proto services.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.proto_api_scrubber.v3.DescriptorSet",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :data_source, 1, type: Envoy.Config.Core.V3.DataSource, json_name: "dataSource"
end

defmodule Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.Restrictions.MethodRestrictionsEntry do
  use Protobuf,
    full_name:
      "envoy.extensions.filters.http.proto_api_scrubber.v3.Restrictions.MethodRestrictionsEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.MethodRestrictions
end

defmodule Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.Restrictions.MessageRestrictionsEntry do
  use Protobuf,
    full_name:
      "envoy.extensions.filters.http.proto_api_scrubber.v3.Restrictions.MessageRestrictionsEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.MessageRestrictions
end

defmodule Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.Restrictions do
  @moduledoc """
  Contains the restrictions for the methods.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.proto_api_scrubber.v3.Restrictions",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :method_restrictions, 1,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.Restrictions.MethodRestrictionsEntry,
    json_name: "methodRestrictions",
    map: true

  field :message_restrictions, 2,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.Restrictions.MessageRestrictionsEntry,
    json_name: "messageRestrictions",
    map: true
end

defmodule Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.MethodRestrictions.RequestFieldRestrictionsEntry do
  use Protobuf,
    full_name:
      "envoy.extensions.filters.http.proto_api_scrubber.v3.MethodRestrictions.RequestFieldRestrictionsEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.RestrictionConfig
end

defmodule Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.MethodRestrictions.ResponseFieldRestrictionsEntry do
  use Protobuf,
    full_name:
      "envoy.extensions.filters.http.proto_api_scrubber.v3.MethodRestrictions.ResponseFieldRestrictionsEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.RestrictionConfig
end

defmodule Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.MethodRestrictions do
  @moduledoc """
  Contains the method restrictions which include the field level restrictions
  for the request and response fields.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.proto_api_scrubber.v3.MethodRestrictions",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :request_field_restrictions, 1,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.MethodRestrictions.RequestFieldRestrictionsEntry,
    json_name: "requestFieldRestrictions",
    map: true

  field :response_field_restrictions, 2,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.MethodRestrictions.ResponseFieldRestrictionsEntry,
    json_name: "responseFieldRestrictions",
    map: true

  field :method_restriction, 3,
    type: Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.RestrictionConfig,
    json_name: "methodRestriction"
end

defmodule Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.MessageRestrictions.FieldRestrictionsEntry do
  use Protobuf,
    full_name:
      "envoy.extensions.filters.http.proto_api_scrubber.v3.MessageRestrictions.FieldRestrictionsEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.RestrictionConfig
end

defmodule Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.MessageRestrictions do
  @moduledoc """
  Contains message-level restrictions.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.proto_api_scrubber.v3.MessageRestrictions",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :config, 1, type: Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.RestrictionConfig

  field :field_restrictions, 2,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.MessageRestrictions.FieldRestrictionsEntry,
    json_name: "fieldRestrictions",
    map: true
end

defmodule Envoy.Extensions.Filters.Http.ProtoApiScrubber.V3.RestrictionConfig do
  @moduledoc """
  The restriction configuration.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.proto_api_scrubber.v3.RestrictionConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :matcher, 1, type: Xds.Type.Matcher.V3.Matcher
end
