defmodule Envoy.Extensions.Matching.CommonInputs.Stats.V3.StatFullNameMatchInput do
  @moduledoc """
  Specifies the way to match stats with full name.
  [#protodoc-title: Stats matcher]
  """

  use Protobuf,
    full_name: "envoy.extensions.matching.common_inputs.stats.v3.StatFullNameMatchInput",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Extensions.Matching.CommonInputs.Stats.V3.StatTagValueInput do
  @moduledoc """
  Specifies the way to match stat tags with value.
  """

  use Protobuf,
    full_name: "envoy.extensions.matching.common_inputs.stats.v3.StatTagValueInput",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end
