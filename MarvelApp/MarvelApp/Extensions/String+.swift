import Foundation
import CommonCrypto

extension String {
    func encodeMD5() -> String {
       if let strData = self.data(using: String.Encoding.utf8) {

                var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
                strData.withUnsafeBytes {
                    CC_MD5($0.baseAddress, UInt32(strData.count), &digest)
                }
                var md5String = ""
                for byte in digest {
                    md5String += String(format: "%02x", UInt8(byte))
                }
                if md5String.uppercased() == "8D84E6C45CE9044CAE90C064997ACFF1" {
                    print("Matching MD5 hash: 8D84E6C45CE9044CAE90C064997ACFF1")
                } else {
                    print("MD5 hash does not match: \(md5String)")
                }
                return md5String
            }
            return ""
    }
}
