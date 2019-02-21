import Cnng

enum Option {
  enum OptionValue {
    case bool(Bool)
    case int(Int)
    case string(String)
    case uint64(UInt64)
  }
  
  enum OptionError: Error {
    case notSupported
    case notSet
    case error(Int32)
  }

  case sockname
  case raw
  case proto
  case protoname
  case peer
  case peername
  case recvbuf
  case sendbuf
  case recvfd
  case sendfd
  case recvtimeo
  case sendtimeo
  case locaddr
  case remaddr
  case url
  case maxttl
  case recvmaxsz
  case reconnmint
  case reconnmaxt
  case tlsConfig
  case tlsAuthMode
  case tlsCertKeyFile
  case tlsCaFile
  case tlsServerName
  case tlsVerified
  case tcpNodelay
  case tcpKeepalive

  internal var option: String {
    switch self {
    case .sockname:
      return NNG_OPT_SOCKNAME
    case .raw:
      return NNG_OPT_RAW
    case .proto:
      return NNG_OPT_PROTO
    case .protoname:
      return NNG_OPT_PROTONAME
    case .peer:
      return NNG_OPT_PEER
    case .peername:
      return NNG_OPT_PEERNAME
    case .recvbuf:
      return NNG_OPT_RECVBUF
    case .sendbuf:
      return NNG_OPT_SENDBUF
    case .recvfd:
      return NNG_OPT_RECVFD
    case .sendfd:
      return NNG_OPT_SENDFD
    case .recvtimeo:
      return NNG_OPT_RECVTIMEO
    case .sendtimeo:
      return NNG_OPT_SENDTIMEO
    case .locaddr:
      return NNG_OPT_LOCADDR
    case .remaddr:
      return NNG_OPT_REMADDR
    case .url:
      return NNG_OPT_URL
    case .maxttl:
      return NNG_OPT_MAXTTL
    case .recvmaxsz:
      return NNG_OPT_RECVMAXSZ
    case .reconnmint:
      return NNG_OPT_RECONNMINT
    case .reconnmaxt:
      return NNG_OPT_RECONNMAXT
    case .tlsConfig:
      return NNG_OPT_TLS_CONFIG
    case .tlsAuthMode:
      return NNG_OPT_TLS_AUTH_MODE
    case .tlsCertKeyFile:
      return NNG_OPT_TLS_CERT_KEY_FILE
    case .tlsCaFile:
      return NNG_OPT_TLS_CA_FILE
    case .tlsServerName:
      return NNG_OPT_TLS_SERVER_NAME
    case .tlsVerified:
      return NNG_OPT_TLS_VERIFIED
    case .tcpNodelay:
      return NNG_OPT_TCP_NODELAY
    case .tcpKeepalive:
      return NNG_OPT_TCP_KEEPALIVE
    }
  }
}

protocol Optionable {
  func getopt(_ option: Option) throws -> Option.OptionValue
  func setopt(_ option: Option, value: Option.OptionValue) throws
}
