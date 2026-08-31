defmodule Envoy.Extensions.Network.SocketInterface.Sockmap.V3.Sockmap do
  @moduledoc """
  Configuration for the ``sockmap`` socket interface. It accelerates same-host TCP hops by
  loading eBPF ``sock_ops`` and ``sk_msg`` programs that redirect payloads between local sockets
  through a ``BPF_MAP_TYPE_SOCKHASH``, bypassing the kernel TCP/IP stack. Connections whose peer
  is not on the same host are not present in the map and transparently fall back to TCP/IP.

  This interface requires a Linux kernel 4.18 or later and the capabilities to load and attach the
  eBPF network programs (``CAP_SYS_ADMIN``, or ``CAP_BPF`` and ``CAP_NET_ADMIN`` on newer kernels).
  When the programs cannot be loaded or attached, the interface logs the failure and every socket
  falls back to the standard datapath, so traffic is never interrupted.
  [#next-free-field: 6]
  [#protodoc-title: Sockmap socket interface configuration]
  Sockmap socket interface :ref:`configuration overview <config_sock_interface_sockmap>`.
  [#extension: envoy.extensions.network.socket_interface.sockmap]
  """

  use Protobuf,
    full_name: "envoy.extensions.network.socket_interface.sockmap.v3.Sockmap",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :bpf_program_path, 1, type: :string, json_name: "bpfProgramPath"
  field :cgroup_path, 2, type: :string, json_name: "cgroupPath"

  field :sockhash_max_entries, 3,
    type: Google.Protobuf.UInt32Value,
    json_name: "sockhashMaxEntries",
    deprecated: false

  field :register_user_space_sockets, 4,
    type: Google.Protobuf.BoolValue,
    json_name: "registerUserSpaceSockets"

  field :accelerated_ports, 5,
    repeated: true,
    type: Envoy.Type.V3.Int64Range,
    json_name: "acceleratedPorts",
    deprecated: false
end
