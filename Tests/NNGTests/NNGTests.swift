import XCTest
@testable import NNG

final class NNGTests: XCTestCase {
    func testExample() {
      guard let rep = Protocol.rep0.socket else {
        return
      }

      guard rep.listen(url: "tcp://127.0.0.1:8082") else {
        return
      }

      guard let req = Protocol.req0.socket else {
        return
      }

      guard req.dial(url: "tcp://127.0.0.1:8082") else {
        return
      }

      let msg = Msg()
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
