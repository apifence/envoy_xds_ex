defmodule Envoy.Extensions.Network.SocketInterface.V3.DefaultSocketInterface do
  @moduledoc """
  Configuration for the default socket interface that relies on OS-dependent syscalls to create
  sockets.
  [#protodoc-title: Default socket interface configuration]
  """

  use Protobuf,
    full_name: "envoy.extensions.network.socket_interface.v3.DefaultSocketInterface",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :io_uring_options, 1,
    type: Envoy.Extensions.Network.SocketInterface.V3.IoUringOptions,
    json_name: "ioUringOptions"
end

defmodule Envoy.Extensions.Network.SocketInterface.V3.IoUringOptions do
  @moduledoc """
  Configuration for ``io_uring``-based asynchronous I/O.

  Each worker thread creates its own ``io_uring`` instance during initialization. Operations
  are submitted to the submission queue (SQ) and completions are reaped from the completion
  queue (CQ) via an eventfd integrated with the worker's event loop.

  .. warning::

    ``io_uring`` support is experimental and its performance characteristics depend heavily on
    the kernel version.

  [#next-free-field: 8]
  """

  use Protobuf,
    full_name: "envoy.extensions.network.socket_interface.v3.IoUringOptions",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :io_uring_size, 1, type: Google.Protobuf.UInt32Value, json_name: "ioUringSize"

  field :enable_submission_queue_polling, 2,
    type: :bool,
    json_name: "enableSubmissionQueuePolling"

  field :read_buffer_size, 3, type: Google.Protobuf.UInt32Value, json_name: "readBufferSize"
  field :write_timeout_ms, 4, type: Google.Protobuf.UInt32Value, json_name: "writeTimeoutMs"

  field :write_high_watermark_bytes, 5,
    type: Google.Protobuf.UInt32Value,
    json_name: "writeHighWatermarkBytes",
    deprecated: false

  field :write_low_watermark_bytes, 6,
    type: Google.Protobuf.UInt32Value,
    json_name: "writeLowWatermarkBytes",
    deprecated: false

  field :enable_multishot_receive, 7, type: :bool, json_name: "enableMultishotReceive"
end
