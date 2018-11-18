import Cnng

class Socket {
  var socket: nng_socket

  init(socket: nng_socket) {
    self.socket = socket
  }

  deinit {
    print("socket deinit")
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
}
