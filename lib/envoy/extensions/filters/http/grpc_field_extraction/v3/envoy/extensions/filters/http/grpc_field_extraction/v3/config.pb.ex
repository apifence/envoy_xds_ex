defmodule Envoy.Extensions.Filters.Http.GrpcFieldExtraction.V3.GrpcFieldExtractionConfig.ExtractionsByMethodEntry do
  use Protobuf,
    full_name:
      "envoy.extensions.filters.http.grpc_field_extraction.v3.GrpcFieldExtractionConfig.ExtractionsByMethodEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Extensions.Filters.Http.GrpcFieldExtraction.V3.FieldExtractions
end

defmodule Envoy.Extensions.Filters.Http.GrpcFieldExtraction.V3.GrpcFieldExtractionConfig do
  @moduledoc """
  [#protodoc-title: gRPC Field Extraction]

  [#extension: envoy.filters.http.grpc_field_extraction]

  Overview
  --------

  This filter supports extracting the fields from the first gRPC
  request message no matter if it is unary or streaming and writing the result
  to the destination, for which currently only the static Envoy dynamic metadata `envoy.filters.http.grpc_field_extraction` is supported.

  Assumptions
  -----------

  This filter assumes

  1. this filter is only applicable for gRPC with Protobuf as payload.
  2. for bi-directional and client-side gRPC streaming, the initial message from the client should not depend on receiving the server initial metadata.

  Process Flow
  ------------

  When a request reaches the filter, it will check

  1. if the request is the gRPC request configured for extraction, the filter tries to:

    a. block the incoming data before decoding the first complete gRPC message
    b. look up the target field from the buffered gRPC message
    c. write the extraction result into the dynamic metadata and resume the request propagation.

  2. otherwise, pass through the request.

  If the request is a malformed one found during 1.a or 1.b, the filter will reject the request.

  Config Requirements
  -------------------

  Here are config requirements

  1. the target field should be among the following primitive types: `string`,
  `uint32`, `uint64`, `int32`, `int64`, `sint32`, `sint64`, `fixed32`,
  `fixed64`, `sfixed32`, `sfixed64`, `float`, `double`, `map<string, string>`.

  2. the target field could be repeated.

  3. the intermediate type could also be repeated.

  Output Format
  -------------

  1. the extracted field names/values will be wrapped in be ``field<StringValue
  or MapValue>`` -> ``values<ListValue of StringValue or StructValue>``, which will be added in the dynamic ``metadata<google.protobuf.Struct>``.

  2. if the field value is empty, an empty ``Value`` will be set.

  Performance
  -----------

  This filter should be performant as it

  1. converts between the gRPC message from EnvoyBuffer without data copy.
  2. parse the gRPC message binary directly without deserialization.

  though buffering the first message introduces some latency.

  Example
  -------

  We have the following request definition for the gRPC method `pkg.svc.Method`.

  .. code-block:: proto

  	message MethodRequest {
  	  string foo = 1;
  	  Nested nested = 2;
  	  uint32 baz = 3;
  	  ...
  	}

  	message Nested {
  	 repeated string bar = 1;
  	}

  This is the filter config in JSON.

  .. code-block:: json

  	{
  	  "descriptor_set":{},
  	  "extractions_by_method":{
  	     "pkg.svc.Method":{
  	        "request_field_extractions":{
  	           "foo":{
  	           },
  	           "nested.bar":{
  	           }
  	           "baz":{
  	           }
  	        }
  	     }
  	  }
  	}

  During runtime, the filter receives the following `MethodRequest` message in JSON.

  .. code-block:: json

  	{
  	  "foo": "val_foo",
  	  "nested": { "bar": ["val_bar1", "val_bar2"]}
  	}

  The filter will write the following dynamic metadata(`envoy.filters.http.grpc_field_extraction`) in JSON.

  .. code-block:: json

  	{
  	  "foo":[
  	     "val_foo"
  	  ],
  	  "nested.bar":[
  	     "val_bar1", "val_bar2"
  	  ]
  	  "baz":[
  	  ]
  	}

  Normalizing the metadata key
  ----------------------------

  By default the dynamic metadata key is the field path. ``metadata_key`` overrides it, which
  allows different gRPC methods to write the same logical value under a common key.

  .. code-block:: json

  	{
  	  "descriptor_set":{},
  	  "extractions_by_method":{
  	     "pkg.svc.Method":{
  	        "request_field_extractions":{
  	           "nested.bar":{
  	              "metadata_key":"bar"
  	           }
  	        }
  	     }
  	  }
  	}

  writes

  .. code-block:: json

  	{
  	  "bar":[
  	     "val_bar1", "val_bar2"
  	  ]
  	}
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.grpc_field_extraction.v3.GrpcFieldExtractionConfig",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :descriptor_set, 1,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "descriptorSet",
    deprecated: false

  field :extractions_by_method, 2,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Http.GrpcFieldExtraction.V3.GrpcFieldExtractionConfig.ExtractionsByMethodEntry,
    json_name: "extractionsByMethod",
    map: true
end

defmodule Envoy.Extensions.Filters.Http.GrpcFieldExtraction.V3.FieldExtractions.RequestFieldExtractionsEntry do
  use Protobuf,
    full_name:
      "envoy.extensions.filters.http.grpc_field_extraction.v3.FieldExtractions.RequestFieldExtractionsEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string

  field :value, 2,
    type: Envoy.Extensions.Filters.Http.GrpcFieldExtraction.V3.RequestFieldValueDisposition
end

defmodule Envoy.Extensions.Filters.Http.GrpcFieldExtraction.V3.FieldExtractions do
  @moduledoc """
  This message can be used to support per route config approach later even
  though the Istio doesn't support that so far.
  """

  use Protobuf,
    full_name: "envoy.extensions.filters.http.grpc_field_extraction.v3.FieldExtractions",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :request_field_extractions, 1,
    repeated: true,
    type:
      Envoy.Extensions.Filters.Http.GrpcFieldExtraction.V3.FieldExtractions.RequestFieldExtractionsEntry,
    json_name: "requestFieldExtractions",
    map: true
end

defmodule Envoy.Extensions.Filters.Http.GrpcFieldExtraction.V3.RequestFieldValueDisposition do
  use Protobuf,
    full_name:
      "envoy.extensions.filters.http.grpc_field_extraction.v3.RequestFieldValueDisposition",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :disposition, 0

  field :dynamic_metadata, 1, type: :string, json_name: "dynamicMetadata", oneof: 0
  field :metadata_key, 2, type: :string, json_name: "metadataKey"
end
