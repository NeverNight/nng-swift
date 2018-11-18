import Cnng

class Msg {
  var msg: OpaquePointer?

  init?() {
    guard nng_msg_alloc(&msg, 0) == 0 else {
      return nil
    }
  }
}
