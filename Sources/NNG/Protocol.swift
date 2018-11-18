import Cnng

enum Protocol {
  case req0
  case rep0

  var socket: Socket? {
    var socket = nng_socket()

    switch self {
    case .req0:
      guard nng_req0_open(&socket) == 0 else {
        return nil
      }

    case .rep0:
      guard nng_rep0_open(&socket) == 0 else {
        return nil
      }
    }

    return Socket(socket: socket)
  }
}
