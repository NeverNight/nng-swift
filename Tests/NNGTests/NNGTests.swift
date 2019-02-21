import XCTest
@testable import NNG

final class NNGTests: XCTestCase {
    func testExample() {
      guard let rep = Protocol.rep0.socket else {
        return
      }

      do {
        try rep.listen(url: "tcp://127.0.0.1:8082")
      } catch {
        XCTFail("Error: \(error)")
      }

      guard let req = Protocol.req0.socket else {
        return
      }

      do {
        try req.dial(url: "tcp://127.0.0.1:8082")
      } catch {
        XCTFail("Error: \(error)")
      }

      let p1 = try? rep.getopt(.proto)
      let p2 = try? rep.getopt(.protoname)
      let p3 = try? rep.getopt(.peer)
      let p4 = try? rep.getopt(.peername)

      print(p1!)
      print(p2!)
      print(p3!)
      print(p4!)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
