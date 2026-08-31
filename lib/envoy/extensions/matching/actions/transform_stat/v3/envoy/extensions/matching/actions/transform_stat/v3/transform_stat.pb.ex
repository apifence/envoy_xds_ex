defmodule Envoy.Extensions.Matching.Actions.TransformStat.V3.TransformStat.DropStat do
  @moduledoc """
  Action that drops the stat.
  """

  use Protobuf,
    full_name: "envoy.extensions.matching.actions.transform_stat.v3.TransformStat.DropStat",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Extensions.Matching.Actions.TransformStat.V3.TransformStat.DropTag do
  @moduledoc """
  Action that drops the tag.
  This removes the tag from the stat entirely. This is different from updating the
  tag to an empty value, which keeps the tag key with an empty value.
  """

  use Protobuf,
    full_name: "envoy.extensions.matching.actions.transform_stat.v3.TransformStat.DropTag",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end

defmodule Envoy.Extensions.Matching.Actions.TransformStat.V3.TransformStat.UpdateTag do
  @moduledoc """
  Action that updates the tag.
  """

  use Protobuf,
    full_name: "envoy.extensions.matching.actions.transform_stat.v3.TransformStat.UpdateTag",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :new_tag_value, 2, type: :string, json_name: "newTagValue"
end

defmodule Envoy.Extensions.Matching.Actions.TransformStat.V3.TransformStat do
  @moduledoc """
  Transform action for the stat matched by the tag.
  [#protodoc-title: Transform Stat actions]
  [#extension: envoy.matching.actions.transform_stat]
  """

  use Protobuf,
    full_name: "envoy.extensions.matching.actions.transform_stat.v3.TransformStat",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :drop_stat, 1,
    type: Envoy.Extensions.Matching.Actions.TransformStat.V3.TransformStat.DropStat,
    json_name: "dropStat"

  field :drop_tag, 2,
    type: Envoy.Extensions.Matching.Actions.TransformStat.V3.TransformStat.DropTag,
    json_name: "dropTag"

  field :update_tag, 3,
    type: Envoy.Extensions.Matching.Actions.TransformStat.V3.TransformStat.UpdateTag,
    json_name: "updateTag"
end
