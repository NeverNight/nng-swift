import Cnng

class Socket {
  enum Option: String {
    enum OptionValue {
      case int(Int)
      case ms(Int32)
      case string(String)
      case size(Int)
      case uint64(UInt64)
    }

    case socketName = "socket-name"
    case raw = "raw"
    case `protocol` = "protocol"
    case protocolName = "protocol-name"
    case peer = "peer"
    case peerName = "peer-name"
    case recvBuffer = "recv-buffer"
    case sendBuffer = "send-buffer"
    case recvFd = "recv-fd"
    case sendFd = "send-fd"
    case recvTimeout = "recv-timeout"
    case sendTimeout  = "send-timeout"
    case localAddress = "local-address"
    case remoteAddress = "remote-address"
    case url = "url"
    case ttlMax = "ttl-max"
    case rectSizeMax = "recv-size-max"
    case reconnectTimeMin = "reconnect-time-min"
    case reconnectTimeMax = "reconnect-time-max"
  }

  var socket: nng_socket

  init(socket: nng_socket) {
    self.socket = socket
  }

  deinit {
    nng_close(socket)
  }

  func listen(url: String) -> Bool {
    guard nng_listen(socket, url, nil, 0) == 0 else {
      return false
    }

    return true
  }

  func dial(url: String) -> Bool {
    guard nng_dial(socket, url, nil, 0) == 0 else {
      return false
    }

    return true
  }

  func getopt(_ option: Option) -> OptionValue {

  }

  func getopt(_ option: Option) -> OptionValue {

  }
}
