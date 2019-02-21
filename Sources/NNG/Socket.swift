import Cnng

class Socket {
  enum SocketError: Error {
    case error(Int32)
  }

  var socket: nng_socket

  init(socket: nng_socket) {
    self.socket = socket
  }

  deinit {
    nng_close(socket)
  }

  func listen(url: String) throws {
    let ret = nng_listen(socket, url, nil, 0)

    guard ret == 0 else {
      throw SocketError.error(ret)
    }
  }

  func dial(url: String) throws {
    let ret = nng_dial(socket, url, nil, 0)

    guard ret == 0 else {
      throw SocketError.error(ret)
    }
  }

  func close() throws {
    let ret = nng_close(socket)

    guard ret == 0 else {
      throw SocketError.error(ret)
    }
  }
}

extension Socket: Optionable {
  private func getopt_int(_ option: Option) throws -> Option.OptionValue {
    var val: Int32 = 0
    let err = nng_getopt_int(socket, option.option, &val)
    if err != 0 {
      throw Option.OptionError.error(err)
    }
    return .int(Int(val))
  }

  private func getopt_string(_ option: Option) throws -> Option.OptionValue {
    var val: UnsafeMutablePointer<Int8>?
    let err = nng_getopt_string(socket, option.option, &val)
    if err != 0 {
      throw Option.OptionError.error(err)
    }
    if let val = val {
      return .string(String(cString: val))
    }
    throw Option.OptionError.notSet
  }

  func getopt(_ option: Option) throws -> Option.OptionValue {
    switch option {
      case .proto, .peer:
        return try getopt_int(option)

      case .protoname,  .peername:
        return try getopt_string(option)

      default:
        throw Option.OptionError.notSupported
    }
  }

  func setopt(_ option: Option, value: Option.OptionValue) throws {

  }
}
