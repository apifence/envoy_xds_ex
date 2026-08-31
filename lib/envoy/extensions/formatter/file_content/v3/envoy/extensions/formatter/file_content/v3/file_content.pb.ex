defmodule Envoy.Extensions.Formatter.FileContent.V3.FileContent do
  @moduledoc """
  FileContent formatter extension implements the ``%FILE_CONTENT(/path/to/file)%`` command operator
  that reads the contents of the specified file. File-based data is automatically re-read when the
  file is modified on disk.

  Optionally, a directory to watch for changes can be specified with a
  colon followed by the directory to watch, eg ``%FILE_CONTENT(/path/to/file:/path/to/watch)%``.
  See :ref:`watched_directory <envoy_v3_api_field_config.core.v3.DataSource.watched_directory>` for
  detailed semantics.
  [#protodoc-title: Formatter extension for reading file contents]
  [#extension: envoy.formatter.file_content]
  """

  use Protobuf,
    full_name: "envoy.extensions.formatter.file_content.v3.FileContent",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3
end
